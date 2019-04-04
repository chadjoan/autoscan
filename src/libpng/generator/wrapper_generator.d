import std.algorithm;
import std.stdio;
import std.regex;
import std.string;
import std.exception;
import std.path;
import std.range.primitives;

// "NSJ" means "No SetJmp"

version=Silent;
version(Silent)
{
    pragma(msg,"Building generator in silent mode.");
    void infoln(A...)(A args) { }
    void infofln(A...)(A args) { }
}
else
{
    pragma(msg,"Building generator in verbose mode.");
    alias writeln infoln;
    alias writefln infofln;
}

enum Severity
{
    info,
    warning,
    error,
    fatal
}

class Msg
{
    string    message;
    Severity  severity;
}

struct Parameter
{
    string  cType;
    string  cName;
    uint[]  arrayDims;
}

class Context
{
    Msg[]  log;

    void error(string msg)
    {
        auto logEntry = new Msg();
        logEntry.message = msg;
        logEntry.severity = Severity.error;
        log ~= logEntry;
    }

    void errorf(A...)(string fmtstr, A vargs)
    {
        error(std.string.format(fmtstr, vargs));
    }
}

// Non-compiling regexen (file bug reports later?):
//enum cCommentSpaceOneLine = `(?:(?:(?![\r\n])\s)|(?:/\*[^\r\n]*?\*/)|(?://[^\r\n]*))`;
//enum rexDefines = ctRegex!(`#\s*define\s+[A-Za-z0-9_]+`~
//    `(?:[^\n\r\\]+\\`~cCommentSpaceOneLine~`*)+[^\n\r]*`,"sg");
//enum rexDefines = ctRegex!(`#\s*define\s+[A-Za-z0-9_]+`~
//    `(?:(?:(?![\n\r]).)+\\`~cCommentSpaceOneLine~`*)+[^\n\r]*`,"sg");
/+
string nestedRegex(string leftSym, string rightSym, string fill, uint level)
{
    if ( level == 0 )
        return leftSym ~ fill ~ rightSym;
    else
        return leftSym ~ fill ~ "(?:" ~
            nestedRegex(leftSym,rightSym,fill,level-1) ~ fill ~ ")*" ~ rightSym;
}
+/
// `Error: found 'else' instead of statement`:
//enum rexStructs = ctRegex!(`struct\s+([A-Za-z0-9_]+)\s+`~nestedRegex(`\{`,`\}`,".*?",1)~`\s+;?`,"sg");
//
// Doesn't seem to match the filler lazily.  Matches all code after the first struct opening.
//enum rexStructs = ctRegex!(`struct\s+([A-Za-z0-9_]+)\s+`~nestedRegex(`\{`,`\}`,".*?",1)~`\s+;?`,"sg");

enum outputFileImplC   = "png_nsj.c";
enum outputFileHeaderC = "png_nsj.h";
enum outputFileD       = "png_nsj.d";
enum dThisModule       = "libpng.generated.png_nsj";
enum dOtherModulePath  = "libpng.";

enum cCommentMultiLine = `(?:(?://[^\r\n]*)|(?:/\*.*?\*/))`;
enum cCommentAllSpace = `(?:\s|`~cCommentMultiLine~`)`;
enum cCommentSpaceOneLine = `(?:(?:[^\r\n])|(?://[^\r\n]*)|(?:/\*[^\r\n]*?\*/))`;
enum cCommentSpaceOneLineStrict = `(?:(?:[ \t])|(?://[^\r\n]*)|(?:/\*[^\r\n]*?\*/))`;
enum cNewLine = `(?:(?:\r\n)|\r|\n)`;
enum cPreProcMultiLine = `(?:[^\r\n]+\\`~cCommentSpaceOneLine~`*`~cNewLine~`)*[^\n\r]+`;
enum cPreProcWhiteSpace = `(?:(?:\\`~cCommentSpaceOneLineStrict~`*`~cNewLine~`)|[ \t])`;
enum cStringLiteral = `(:?"(?:(?:\\")|[^"]+?)")`;

enum regexStrPngStructpVariants = "(?:(?:png_structp)|(?:png_const_structp)|(?:png_structrp)|(?:png_const_structrp))";

string nestedRegex(string leftSym, string rightSym, string fill, uint level)
{
    if ( level == 0 )
        return leftSym ~ fill ~ rightSym;
    else
        return leftSym ~ "(?:" ~ fill ~
            nestedRegex(leftSym,rightSym,fill,level-1) ~ ")*" ~ fill ~ rightSym;
}

// Save compile time and memory by offloading the nastier regexen to runtime.
string rtRegex(string name, string regex, string flags)
{
    /* HACK: relies on ` character being absent from regex. */
    return
        "Regex!char "~name~";\n"~
        "static this()\n"~
        "{\n"~
        "    "~name~" = regex(`"~regex~"`,`"~flags~"`);\n"~
        "}\n";
}

// Create static regexes at compile-time, which contains fast native code.
mixin(rtRegex("rexComments",cCommentMultiLine~`+`,"sg"));
mixin(rtRegex("rexUndefs", `#\s*undef\s+[A-Za-z0-9_]+`,"sg"));
mixin(rtRegex("rexDefines",         `#\s*define\s+[A-Za-z0-9_]+`~cPreProcMultiLine,"sg"));
mixin(rtRegex("rexDefinesAlphaNum", `^\s*#\s*define\s+([0-9A-Za-z_]+)(`~cPreProcWhiteSpace~`+)((:?\(\s*)?[+-]?(:?[0-9A-Za-z_\s]+?)(:?\s*?\))?)\s*?$`,"smg"));
mixin(rtRegex("rexDefinesStrings",  `^\s*#\s*define\s+([0-9A-Za-z_]+)(`~cPreProcWhiteSpace~`+)((:?\(\s*)?`~cStringLiteral~`(:?\s*?\))?)\s*?$`,"smg"));
mixin(rtRegex("rexAllPreProc",`#`~cPreProcMultiLine,"sg"));

// Past this point, I gave up on being comment-correct.
// These regexen expect comments to already be stripped from the file.
mixin(rtRegex("rexStructs",`\bstruct\s+([A-Za-z0-9_]+)\s*`~nestedRegex(`\{`,`\}`,`[^\{\}]*`,5)~`\s*;?`,"sg"));
mixin(rtRegex("rexStructsOtherNameOrder",`\bstruct\s+`~nestedRegex(`\{`,`\}`,`[^\{\}]*`,5)~`\s*([A-Za-z0-9_]+)\s*;?`,"sg"));
mixin(rtRegex("rexTypedefs",`\btypedef\s+.*?;`,"sg"));

mixin(rtRegex("rexIfDefCpp",`#ifdef\s+__cplusplus\s+((?:extern\s*"C"\s*\{)|\})\s*#endif`,"sg"));

mixin(rtRegex("rexPngFunctionMacro",`\bPNG_FUNCTION\s*`~nestedRegex(`\(`,`\)`,`[^\(\)]*`,5)~`\s*;`,"sg"));

// This defines the following captures: ExportType, FuncOrdinal, ReturnType,
//   FuncName, FuncArgs, FuncAttrs.
// The capture names currently don't work, due to a range violation in std.regex.
// Have some enumerated values:
enum
{
    EXPORT_TYPE = 1,
    FUNC_ORDINAL,
    RETURN_TYPE,
    FUNC_NAME,
    FUNC_PARAMS,
    FUNC_ATTRS,
}
mixin(rtRegex("rexPngExport",`(?P<ExportType>PNG_(?:EXPORT|EXPORTA|FP_EXPORT|FIXED_EXPORT|REMOVED))\s*\(`~
    `\s*(?P<FuncOrdinal>[0-9]+)\s*,\s*(?P<ReturnType>[A-Za-z0-9_\s\*]+),`~
    `\s*(?P<FuncName>[A-Za-z0-9_]+)\s*,\s*(?P<FuncParams>`~nestedRegex(`\(`,`\)`,`[^\(\)]*`,5)~`)\s*`~
    `(?:,\s*(?P<FuncAttrs>[^\(\)]+))?\)\s*;?`,"sg"));

// \x5B = [,  \x5D = ]
enum cFuncArg = `\s*([A-Za-z0-9_\x5B\x5D\s\*]*?)([A-Za-z0-9_]+)(\s*\[\s*[+]?\s*[0-9]+\s*\])?`;
enum rexFuncArgs = ctRegex!(cFuncArg~`,`,"sg");

enum rexPngStructpVariants = ctRegex!(regexStrPngStructpVariants, "sg");

bool isPngStructpVariant(string cType)
{
    //import std.stdio;
    auto caps = std.regex.matchFirst(cType, rexPngStructpVariants);
    /+writefln("isPngStructpVariant(\"%s\")", cType);
    if ( caps.empty )
        writefln("  caps was empty");
    else
        writefln("  caps.length == %s", caps[0].length);
    writefln("/isPngStructpVariant");
    +/
    if ( caps.empty || caps[0].length != cType.length )
        return false;
    else
        return true;
}

string removeParens(string text)
{
    if ( text.startsWith("(") && text.endsWith(")") )
        return text[1 .. $-1];
    else
        return text;
}

void printUsage()
{
    writeln("This program generates files used to wrap libpng for use in the D programming language.");
    writeln("It uses png.h as its input and does the following things to obtain its output:");
    writeln(" - Removes all #define and #undef statements (to prevent duplicates).");
    writeln(" - Removes all typedef and struct statements (to prevent duplicates).");
    writeln(" - It replaces the PNG_EXPORT macro (and variants) with helper functions in C and D.");
    writeln(" - It replaces the png_structp (and variants) type with the d_png_structp whenever it appears as a parameter to a libpng function.");
    writeln(" - Numerous other things.");
    writeln("It will populate the current directory with these files:");
    writefln("%s, %s, and %s", outputFileImplC, outputFileHeaderC, outputFileD);
    writeln("");
    writeln("Usage:");
    writeln("wrapper_generator <dir containing png.h, pnglibconf.h> <output directory>");
}

alias string function(Context,string,string,string,string) ExportWrapFn;

final class WrapperFuncSet
{
    ExportWrapFn cImpl;
    ExportWrapFn cHeader;
    ExportWrapFn dWrap;

    this( ExportWrapFn cImpl, ExportWrapFn cHeader, ExportWrapFn dWrap )
    {
        this.cImpl = cImpl;
        this.cHeader = cHeader;
        this.dWrap = dWrap;
    }
}

WrapperFuncSet dontWrap;
WrapperFuncSet simpleWrap;
WrapperFuncSet wrapConditional;

WrapperFuncSet[string] cWrapExceptions;

static this()
{
    dontWrap        = new WrapperFuncSet(&dontWrapCD, &dontWrapCD, &dontWrapCD);
    simpleWrap      = new WrapperFuncSet(&dontWrapCD, &simpleWrapHeaderC, &simpleWrapD);
    wrapConditional = new WrapperFuncSet(&wrapConditionalC, &wrapConditionalHeaderC, &wrapConditionalD);

    // These should be always available in the host libpng library.
    // They do not need special wrapping in any way.
    cWrapExceptions["png_access_version_number"] = simpleWrap;
    cWrapExceptions["png_sig_cmp"] = simpleWrap;
    cWrapExceptions["png_info_init_3"] = simpleWrap; // Doesn't SEEM to setjmp.  Let's just wrap direct.  Deprecated anyways.

    // These control error functions and some memory allocation.
    // We need to be able to make sure that the D error handler is always in
    // control, and forward all other requests as a replacement of the secondary
    // error handlers in the dCallContext member.
    // We also need to allocate/deallocate the dCallContext member whenever a
    // png_struct is created or destroyed.
    cWrapExceptions["png_create_read_struct"] = dontWrap; // Wrapped manually.
    cWrapExceptions["png_create_write_struct"] = dontWrap; // Wrapped manually.
    cWrapExceptions["png_create_read_struct_2"] = dontWrap; // Wrapped manually.
    cWrapExceptions["png_create_write_struct_2"] = dontWrap; // Wrapped manually.
    cWrapExceptions["png_destroy_read_struct"] = dontWrap; // Wrapped manually.
    cWrapExceptions["png_destroy_write_struct"] = dontWrap; // Wrapped manually.
    cWrapExceptions["png_set_error_fn"] = dontWrap; // Wrapped manually.

    // Incredibly untested and may not do what you expect.
    cWrapExceptions["png_set_longjmp_fn"] = dontWrap;
    cWrapExceptions["png_longjmp"] = dontWrap;

    // Unsupported.  Probably won't work right until wrapped correctly.
    cWrapExceptions["png_benign_error"] = dontWrap;
    cWrapExceptions["png_chunk_benign_error"] = dontWrap;
    cWrapExceptions["png_set_benign_errors"] = dontWrap;

    // These are conditionally available, but do not accept a png_ptr object
    // for their first argument by default.  We wrap them in a function that
    // adds a dCallContext parameter and checks for existence.  If the given
    // function doesn't exist, then the calling D code is notified and can
    // throw an exception about it.
    // Aside from that, there is no way to setjmp out of these reliably.
    // Hopefully these don't use longjmp anyways.
    cWrapExceptions["png_convert_from_struct_tm"] = wrapConditional;
    cWrapExceptions["png_convert_from_time_t"] = wrapConditional;
    cWrapExceptions["png_build_grayscale_palette"] = wrapConditional;
    cWrapExceptions["png_get_uint_32"] = wrapConditional;
    cWrapExceptions["png_get_uint_16"] = wrapConditional;
    cWrapExceptions["png_get_int_32"] = wrapConditional;
    cWrapExceptions["png_save_uint_32"] = wrapConditional;
    cWrapExceptions["png_save_int_32"] = wrapConditional;
    cWrapExceptions["png_save_uint_16"] = wrapConditional;

    // These haven't been considered carefully.  They are probably newer
    // functions going from libpng 1.5.X to 1.6.X.
    cWrapExceptions["png_convert_to_rfc1123_buffer"]    = wrapConditional;
    cWrapExceptions["png_image_begin_read_from_file"]   = wrapConditional;
    cWrapExceptions["png_image_begin_read_from_stdio"]  = wrapConditional;
    cWrapExceptions["png_image_begin_read_from_memory"] = wrapConditional;
    cWrapExceptions["png_image_finish_read"]            = wrapConditional;
    cWrapExceptions["png_image_free"]                   = wrapConditional;
    cWrapExceptions["png_image_write_to_file"]          = wrapConditional;
    cWrapExceptions["png_image_write_to_stdio"]         = wrapConditional;
    cWrapExceptions["png_image_write_to_memory"]        = wrapConditional;
}

// =============================================================================
// -------------------------- main function ------------------------------------
int main( string[] args )
{
    import std.array : appender;
    import std.algorithm : each;
    import std.file;

    if ( args.length != 3 )
    {
        writefln("Expected 2 arguments, got %s", args.length-1);
        writeln("");
        printUsage();
        return 0;
    }

    Context ctx = new Context();


    writeln("Wrapper generator running.");
    writefln("Target directory: %s", args[1]);

    auto pngh = cast(string)std.file.read(buildPath(args[1],"png.h"));
    int removeCount = 0;

    // --------------- Get constants out of pnglibconfh ------------------------
    // TODO: These should probably turn into properties that retrieve the
    //   values from the C-side.  The solution below might not work well on
    //   other hosts unless the caller can build this generator and run it.
    //   (But then again, it's exposed through macros, so the library writers
    //   are assuming that anything statically linked with the client code is
    //   going to be in sync with anything dynamically linked.)
    //   Perhaps an even more important concern would be that not all of these
    //   would be #define'd in from a C compiler's perspective due to the
    //   #if/#endif jumble that the preprocessor sorts out but our regex logic
    //   ignores. Having C code pull these values based on whether macros are
    //   defined or not and then expose C functions for the D code ... that
    //   would be a way to solve this.
    auto pnglibconfd = cast(string)std.file.read(buildPath(args[1],"pnglibconf.h"));

    pnglibconfd = std.regex.replace(pnglibconfd, ctRegex!(`#.*PNGLCONF_H.*$`,"mg"), "");
    pnglibconfd = std.regex.replace(pnglibconfd, ctRegex!(`#\s*endif`,"mg"), ""); // Incase the one above didn't get it.
    pnglibconfd = std.regex.replace(pnglibconfd,
        regex(`^\s*#define\s+([0-9A-Za-z_]+)\s*$`,"mg"),
        "\nenum $1 = 1;");

    bool[string] macroDefs;
    auto macroDefineReplacer = (Captures!(typeof(pngh)) caps)
    {
        import std.string : strip;
        string lhs         = caps[1].strip;
        string alignSpaces = caps[2];
        string rhs         = caps[3].strip.removeParens.strip;
        auto numericMatches = std.regex.matchFirst(rhs,
            ctRegex!(`^[+-]?(:?(:?0x[0-9A-Fa-f]+)|(:?[0-9]+))$`,"sg"));

        bool isNumeric = false;
        if ( !numericMatches.empty && !numericMatches[0].empty )
            isNumeric = true;

        bool isString = false;
        if ( !isNumeric ) {
            auto stringMatches = std.regex.matchFirst(rhs,
                ctRegex!(`^`~cStringLiteral~`$`,"sg"));

            if ( !stringMatches.empty && !stringMatches[0].empty )
                isString = true;
        }

        if ( isNumeric || isString || rhs in macroDefs )
        {
            macroDefs[lhs] = true;
            alignSpaces = std.regex.replace(alignSpaces, ctRegex!(`[^\s]+`,"sg"), "");
            return std.string.format("\nenum %s%s= %s;", lhs, alignSpaces, rhs);
        }
        else
            return "";
    };


    pnglibconfd = std.regex.replace!(macroDefineReplacer)(pnglibconfd,rexDefinesAlphaNum);

    // ------------------- Removal ------------------------

    auto regexRemoveAndCount = (Captures!(typeof(pngh)) caps)
    {
        removeCount++;
        return "";
    };

    auto regexRemoveAndPrint = (Captures!(typeof(pngh)) caps)
    {
        infoln("Removing: "~caps.hit);
        return "";
    };

    auto regexRemoveOnly = (Captures!(typeof(pngh)) caps) { return ""; };

    // Comments must be removed first or they can mess up the struct/typedef
    //   macros.
    removeCount = 0;
    pngh = std.regex.replace!(regexRemoveAndCount)(pngh,rexComments);
    infofln("Removed %s comments.", removeCount);

    // Get useful definitions out of the png.h header itself.
    // Note that we search only for easily-identified constants instead of
    // trying to handle every imaginable #define.
    auto enumDefs = appender!string;
    auto macroDefineAccumulator = (Captures!(typeof(pngh)) caps)
    {
        import std.string : strip;
        string enumDef = macroDefineReplacer(caps);
        if ( !enumDef.empty ) {
            enumDefs.put(enumDef.strip);
            enumDefs.put("\n");
        }
        return enumDef;
    };

    std.regex.matchAll(pngh, rexDefinesAlphaNum).each!macroDefineAccumulator;
    std.regex.matchAll(pngh, rexDefinesStrings).each!macroDefineAccumulator;
    string enumDefsFromPngh = enumDefs.data;

    // The rest of the #defines and #undefs get removed because we want this
    // text to eventually be valid D code and we no longer need these.
    pngh = std.regex.replace!(regexRemoveAndPrint)(pngh,rexDefines);
    pngh = std.regex.replace!(regexRemoveAndPrint)(pngh,rexUndefs);

    // The struct regex must go first, otherwise structs placed inside typedefs
    //   could cause the typedef regex to terminate prematurely.
    // We replace the structs with something readable in the typedef removes.
    pngh = std.regex.replace(pngh,rexStructs,"struct $1 {} ");
    pngh = std.regex.replace(pngh,rexStructsOtherNameOrder,"struct $1 {} ");
    pngh = std.regex.replace!(regexRemoveAndPrint)(pngh,rexTypedefs);

    // Now the "struct XYZ {} " thingies gotta go too.  (Killing the typedefs
    //   might have done this already, but this is good safety.)
    pngh = std.regex.replace!(regexRemoveAndPrint)(pngh,rexStructs);

    // The result will be #include'd repeatedly to generate code using the
    //   preprocessor, so the include guard has got to go.
    pngh = std.regex.replace(pngh,ctRegex!(`#ifndef PNG_H`,"sg"),"");
    pngh = std.regex.replace(pngh,ctRegex!(`#endif\s+$`,"s"),""); // only the last one.

    // The #ifdef __cplusplus thing might screw up generated code.
    // We'll remove it; it's easy enough to put it back in later stages.
    pngh = std.regex.replace!(regexRemoveAndPrint)(pngh,rexIfDefCpp);

    // Remove the PNG_FUNCTION(void, (PNGCAPI *png_longjmp_ptr), PNGARG...) macro.
    // png_longjmp_ptr probably isn't going to be used in D code anyway.
    pngh = std.regex.replace!(regexRemoveAndPrint)(pngh,rexPngFunctionMacro);

    // Remove the PNG_EXPORT_LAST_ORDINAL macro because it is unnecessary for D.
    pngh = std.regex.replace!(regexRemoveAndPrint)(pngh,
        regex(`\bPNG_EXPORT_LAST_ORDINAL\s*\(\s*[0-9]+\s*\)\s*;?`,"sg"));

    // Remove all preprocessor statements.
    // This gets its own output because at least one output uses the #ifdef
    //   logic to determine which functions are available.
    auto pngh_no_preproc = std.regex.replace!(regexRemoveAndPrint)(pngh,rexAllPreProc);

    // ------------------- Substitutions ------------------------
    // At this point we fork pngh into separate bodies with separate purposes.
    // Some of these will be concatenated later to become the C helper funcs.
    // Other(s) may become the D helper functions.
    auto png_c_includes =
        "#include <png.h>\n"~
        "#include <stdlib.h>\n"~ // For size_t.
        "#include \"png_wrap_utils.h\"\n"~
        "\n";

    auto png_c_helper_funcs_impl =
        png_c_includes ~
        `#include "`~outputFileHeaderC~"\"\n\n"~
        generateFunctionDetectors(ctx, pngh) ~
        generateHelperFuncsC(ctx, pngh_no_preproc);

    auto png_c_helper_funcs_header =
        png_c_includes ~
        generateHelperFuncsHeaderC(ctx, pngh_no_preproc);

    auto png_d_helper_funcs =
        "module "~dThisModule~";\n"~
        "import core.stdc.time;\n"~
        "import core.stdc.stdio;\n"~
        "import "~dOtherModulePath~"types;\n"~
        "import "~dOtherModulePath~"png_wrap_utils;\n"~
        "private import "~dOtherModulePath~"png_types;\n"~
        "\n"~
        "// Definitions of constants derived from pnglibconf.h:\n"~
        pnglibconfd~
        "\n"~
        "// Definitions of constants derived from png.h:\n"~
        enumDefsFromPngh~
        "\n"~
        "// Generated wrapper functions:\n"~
        generateHelperFuncsD(ctx, pngh_no_preproc);

    bool success = true;
    foreach( logEntry; ctx.log )
    {
        import std.stdio;
        if ( logEntry.severity >= Severity.error )
            success = false;

        if ( logEntry.severity >= Severity.error )
            stderr.writeln(logEntry.message);
        else
            stdout.writeln(logEntry.message);
    }

    string outputPathImplC   = buildPath(args[2],outputFileImplC);
    string outputPathHeaderC = buildPath(args[2],outputFileHeaderC);
    string outputPathD       = buildPath(args[2],outputFileD);

    if ( success )
    {
        std.file.write(outputPathImplC,   finalCleanup(png_c_helper_funcs_impl));
        std.file.write(outputPathHeaderC, finalCleanup(png_c_helper_funcs_header));
        std.file.write(outputPathD,       finalCleanup(png_d_helper_funcs));

        writeln("Generated the following files:");
        writeln("  "~outputPathImplC);
        writeln("  "~outputPathHeaderC);
        writeln("  "~outputPathD);
        writeln("");

        return 0;
    }
    else
    {
        writeln("Errors encountered during wrapper generation.");
        writeln("Any existing generated wrapper files will be moved/renamed.");
        void renameIfExists(string pathFrom, string pathTo)
        {
            if ( std.file.exists(pathFrom) )
            {
                writefln("  Renaming %s -> %s", pathFrom, pathTo);
                std.file.rename(pathFrom, pathTo);
            }
        }

        renameIfExists(outputPathImplC,   outputPathImplC~".previous");
        renameIfExists(outputPathHeaderC, outputPathHeaderC~".previous");
        renameIfExists(outputPathD,       outputPathD~".previous");

        writeln("");

        return 1;
    }
}

// ------------------------ auxiliary functions --------------------------------

string pngNameToNsjName(string pngName)
{
    enforce(startsWith(pngName, "png_"));
    return "png_nsj_"~pngName[4..$];
}

string generateFunctionDetectors(Context ctx, string pngh)
{
    int fnCount = 0;
    auto exportReplacer = (Captures!(typeof(pngh)) caps)
    {
        fnCount++;
        infofln("Found exported function: %s", caps[FUNC_NAME]);
        return "#define PNG_NSJ_"~caps[FUNC_NAME]~"_IS_DEFINED 1\n";
    };

    fnCount = 0;
    pngh = std.regex.replace!(exportReplacer)(pngh,rexPngExport);
    infofln("Functions found: %s",fnCount);

    return pngh;
}

string dontWrapCD(Context ctx, string returnType, string funcName, string funcParams, string funcAttrs)
{
    return "";
}

string simpleWrapHeaderC(Context ctx, string returnType, string funcName, string funcParams, string funcAttrs)
{
    string passedFuncAttrs = filterFunctionAttributesForWrappersInC(funcAttrs);
    return passedFuncAttrs ~ " " ~ returnType ~ " " ~ funcName ~ funcParams ~ ";\n";
}

Parameter[] analyzeParams(string funcName, string paramTuple)
{
    import std.array  : appender;
    import std.conv   : to;
    import std.string : startsWith, endsWith;

    auto paramsMeta = appender!(Parameter[]);
    auto paramsStr = paramTuple;
    paramsStr = paramsStr.removeParens;
    foreach( param; std.regex.match(paramsStr~",",rexFuncArgs) )
    {
        Parameter meta;
        meta.cType = std.string.strip(param[1]);
        meta.cName = param[2];
        if ( !param[3].empty )
        {
            string arrayDecl = std.string.strip(param[3]);
            // Assumption: the regex only matches single-dimension arrays.
            enforce(arrayDecl.length > 2);
            enforce(arrayDecl[0]   == '[');
            enforce(arrayDecl[$-1] == ']');
            arrayDecl = arrayDecl[1..$-1];
            meta.arrayDims ~= to!uint(arrayDecl);
        }

        paramsMeta.put(meta);
    }

    return paramsMeta.data;
}

string[] dKeywords = [
    "abstract",
    "alias",
    "align",
    "asm",
    "assert",
    "auto",

    "body",
    "bool",
    "break",
    "byte",

    "case",
    "cast",
    "catch",
    "cdouble",
    "cent",
    "cfloat",
    "char",
    "class",
    "const",
    "continue",
    "creal",

    "dchar",
    "debug",
    "default",
    "delegate",
    "delete (deprecated)",
    "deprecated",
    "do",
    "double",

    "else",
    "enum",
    "export",
    "extern",

    "false",
    "final",
    "finally",
    "float",
    "for",
    "foreach",
    "foreach_reverse",
    "function",

    "goto",

    "idouble",
    "if",
    "ifloat",
    "immutable",
    "import",
    "in",
    "inout",
    "int",
    "interface",
    "invariant",
    "ireal",
    "is",

    "lazy",
    "long",

    "macro (reserved)",
    "mixin",
    "module",

    "new",
    "nothrow",
    "null",

    "out",
    "override",

    "package",
    "pragma",
    "private",
    "protected",
    "public",
    "pure",

    "real",
    "ref",
    "return",

    "scope",
    "shared",
    "short",
    "static",
    "struct",
    "super",
    "switch",
    "synchronized",

    "template",
    "this",
    "throw",
    "true",
    "try",
    "typeid",
    "typeof",

    "ubyte",
    "ucent",
    "uint",
    "ulong",
    "union",
    "unittest",
    "ushort",

    "version",
    "void",

    "wchar",
    "while",
    "with",

    "__FILE__",
    "__FILE_FULL_PATH__",
    "__MODULE__",
    "__LINE__",
    "__FUNCTION__",
    "__PRETTY_FUNCTION__",

    "__gshared",
    "__traits",
    "__vector",
    "__parameters"
];

auto getParamNames(R)(R params)
    if ( isRandomAccessRange!R && is(ElementType!R == Parameter) )
{
    return params.map!(p => p.cName);
}

auto getParamNames(string funcName, string paramTuple)
{
    import std.algorithm : map;
    auto params = analyzeParams(funcName,paramTuple);
    return getParamNames(params);
}

bool isDeprecated(string funcAttrs)
{
    import std.algorithm.iteration : splitter;
    import std.algorithm.searching : canFind;
    return funcAttrs.splitter().canFind("PNG_DEPRECATED");
}

string filterFunctionAttributesForWrappersInC(string funcAttrs)
{
    string passedFuncAttrs = "";
    if ( funcAttrs.isDeprecated() )
        passedFuncAttrs ~= "PNG_DEPRECATED";
    return passedFuncAttrs;
}

string replaceFunctionAttributesForWrappersInD(string funcAttrs)
{
    string passedFuncAttrs = "";
    if ( funcAttrs.isDeprecated() )
        passedFuncAttrs ~= "deprecated";
    return passedFuncAttrs;
}

void generateFunctionPrologueEpilogueForWrappersInC(string funcAttrs, ref string prologue, ref string epilogue)
{
    if ( funcAttrs.isDeprecated() )
    {
        prologue ~=
            "#pragma GCC diagnostic push\n"~
            "#pragma GCC diagnostic ignored \"-Wdeprecated-declarations\"\n";
        epilogue ~=
            "#pragma GCC diagnostic pop\n";
    }
}

void sanitizeParamNamesD(R)(ref R params)
    if ( isRandomAccessRange!R && is(ElementType!R == Parameter) )
{
    import std.algorithm : canFind;
    import std.string : startsWith;

    foreach(ref param; params)
    //for(size_t i = 0; i < params.length; i++)
    {
        //auto param = paramsi];
        if ( dKeywords.canFind(param.cName) )
        {
            if ( param.cName.startsWith("_") )
                param.cName = "d"~param.cName;
            else
                param.cName = "_"~param.cName;

            //param[i] = paramName;
        }
    }
}

auto getParamTypes(string funcName, string paramTuple)
{
    import std.algorithm : map;

    auto params = analyzeParams(funcName,paramTuple);
    return params.map!(p => p.cType);
}

string getReturnSuccessExpr(R)(string returnType, string funcName, R paramNames)
    if ( isRandomAccessRange!R )
{
    import std.string : join;
    string args = std.regex.replace(paramNames.join(", "), ctRegex!`^(\s*png_ptr)\b`, "png_ptr.png_ptr");
    string returnSuccessExpr = std.string.format("%s(%s)", funcName, args);

    if ( returnType != "void" )
        returnSuccessExpr = "return "~returnSuccessExpr;

    return returnSuccessExpr;
}

pure string getReturnFailExpr(string returnType)
{
    if ( returnType == "void" )
        return "return";
    else
        return "return 0";
}

string wrapConditionalC(Context ctx, string returnType, string funcName, string funcParams, string funcAttrs)
{
    string extendedArgs = "libpngCallContextForD *dCallContext, "~funcParams[1..$-1];
    string returnSuccessExpr = getReturnSuccessExpr(
        returnType, funcName, getParamNames(funcName,funcParams));
    string returnFailExpr = getReturnFailExpr(returnType);
    string passedFuncAttrs = filterFunctionAttributesForWrappersInC(funcAttrs);

    string prologue = "";
    string epilogue = "";
    generateFunctionPrologueEpilogueForWrappersInC(funcAttrs, prologue, epilogue);

    return format(
        "%s%s %s %s(%s)\n"~
        "{\n"~
        "#   if PNG_NSJ_%s_IS_DEFINED == 1\n"~
        "        png_nsj_clear_errors(dCallContext);\n"~
        "        %s;\n"~
        "#   else\n"~
        "        png_nsj_set_missing_fn_err(dCallContext);\n"~
        "        %s;\n"~
        "#   endif\n"~
        "}\n%s",
        prologue,
        passedFuncAttrs, returnType, pngNameToNsjName(funcName), extendedArgs,
        funcName,
        returnSuccessExpr,
        returnFailExpr,
        epilogue);
}

string wrapConditionalSetjmpC(Context ctx, string returnType, string funcName, string funcParams, string funcAttrs)
{
    string passedFuncAttrs = filterFunctionAttributesForWrappersInC(funcAttrs);
    string modifiedArgs = std.regex.replace(funcParams,
        ctRegex!("("~regexStrPngStructpVariants~")","sg"), "d_$1");

    auto params = analyzeParams(funcName,funcParams);
    auto paramNames = getParamNames(params);

    //enforce(startsWith(paramNames,"png_ptr"), std.string.format(
    if ( !params[0].cType.isPngStructpVariant() )
        ctx.errorf(
            "All functions are expected to have type something of type png_structp, png_structrp, png_const_structp, or png_const_structrp "~
            "as their first parameter, however, '%s' does not.  "~
            "Typically these functions are added to the cWrapExceptions list and wrapped using the 'wrapConditional' wrapper functions",
            funcName);

    string returnSuccessExpr = getReturnSuccessExpr(
        returnType, funcName, paramNames);

    string returnFailExpr = getReturnFailExpr(returnType);

    string prologue = "";
    string epilogue = "";
    generateFunctionPrologueEpilogueForWrappersInC(funcAttrs, prologue, epilogue);

    return std.string.format(
        "%s%s %s %s%s\n"~
        "{\n"~
        "    png_nsj_clear_errors(png_ptr.dCallContext);\n"~
        "\n"~
        "#   if PNG_NSJ_%s_IS_DEFINED == 1\n"~
        "        png_ptr.dCallContext->jump_ready = 1;\n"~ /* Cleared in png_nsj_check_errors in png_wrap_utils.d */
        "        if ( setjmp(png_ptr.dCallContext->d_jmp_buf) ) {\n"~
        "            %s;\n"~
        "        }\n"~
        "        %s;\n"~
        "#   else\n"~
        "        png_nsj_set_missing_fn_err(png_ptr.dCallContext);\n"~
        "        %s;\n"~
        "#   endif\n"~
        "}\n%s",
        prologue,
        passedFuncAttrs, returnType, pngNameToNsjName(funcName), modifiedArgs,
        funcName,
        returnFailExpr,
        returnSuccessExpr,
        returnFailExpr,
        epilogue);
}

string genericExportReplacer(string targetOfWrapperFuncSet, alias commonWrapFunc)(
    Context ctx, string source, string exportType, string returnType, string funcName, string funcParams, string funcAttrs)
{
    import std.algorithm : findSplit;
    // All function definitions go through this function before being dispatched
    //   to their destination-specific wrapping routines.

    /* TODO: EXPORT_TYPE? */
    infofln("%s: Generating: %s %s(...)",
        source, returnType, funcName);

    // Get rid of the func_name(void) C-ism.
    funcParams = std.regex.replace(funcParams, ctRegex!`\(\s*void\s*\)`, "()");

    /* Fix broken funcParams if they omitted the parameter name for png_ptr. */
    string strippedFuncParams = std.string.strip(funcParams[1..$-1]);
    auto   firstParamSplit = strippedFuncParams.findSplit(",");
    string firstParam = std.string.strip(firstParamSplit[0]);
    string restParams = strippedFuncParams[firstParamSplit[0].length .. $];
    if ( firstParam.isPngStructpVariant() /* implies that the first param is ONLY the type declaration */ )
    {
        auto firstParamType = firstParam;
        funcParams = "("~firstParamType~" png_ptr"~restParams~")";
    }

    // You can thank png_process_data_pause for this one.
    funcParams = std.regex.replace(funcParams, ctRegex!(`^\(\s*(`~regexStrPngStructpVariants~`)\s*,`), "($1 png_ptr,");

    if ( funcName in cWrapExceptions )
        // Some functions don't take png_ptr as a first arg and also don't
        //   do setjmp/longjmp stuff.  They must be wrapped differently.
        mixin("return cWrapExceptions[funcName]."~targetOfWrapperFuncSet~
            "(ctx, returnType, funcName, funcParams, funcAttrs);");
    else
        // More commonly, we have to wrap heavily.
        return commonWrapFunc(ctx, returnType, funcName, funcParams, funcAttrs);

}

string removedFunctionReplacerD(
    Context ctx, string source, string exportType, string returnType, string funcName, string funcParams, string funcAttrs)
{
    assert(exportType == "PNG_REMOVED");
    return std.string.format(
        "@disable %s %s%s\n"~
        "{\n"~
        `    assert(false, "Attempt to call function '%s' that was removed from libpng.");`~"\n"~
        "}\n\n",
        returnType, funcName, funcParams,
        funcName);
}

string generateHelperFuncsC(Context ctx, string pngh)
{
    // FAR pointers.  It isn't the 90s anymore.  Just say no.
    pngh = std.regex.replace(pngh, ctRegex!(`\bFAR\b`,"sg"), "");

     auto exportReplacer = (Captures!(typeof(pngh)) caps)
    {
        if ( caps[EXPORT_TYPE] == "PNG_REMOVED" )
            // No need to create C-side helpers for functions that can't be called.
            return "/* Removed:\n"~caps[0]~"\n*/";
        else
            return genericExportReplacer!("cImpl", wrapConditionalSetjmpC)
                (ctx, "C helper funcs impl", caps[EXPORT_TYPE], caps[RETURN_TYPE], caps[FUNC_NAME], caps[FUNC_PARAMS], caps[FUNC_ATTRS]);
    };

    // Convert exports into helper functions.
    pngh = std.regex.replace!(exportReplacer)(pngh,rexPngExport);

    return pngh;
}

string wrapConditionalHeaderC(Context ctx, string returnType, string funcName, string funcParams, string funcAttrs)
{
    string extendedArgs = "libpngCallContextForD *dCallContext, "~funcParams[1..$-1];
    return format(
        "%s %s(%s);\n",
        returnType, pngNameToNsjName(funcName), extendedArgs);
}

string wrapConditionalSetjmpHeaderC(Context ctx, string returnType, string funcName, string funcParams, string funcAttrs)
{
    string modifiedArgs = std.regex.replace(funcParams,
        ctRegex!("("~regexStrPngStructpVariants~")","sg"), "d_$1");

    return std.string.format(
        "%s %s%s;\n",
        returnType, pngNameToNsjName(funcName), modifiedArgs);
}

string generateHelperFuncsHeaderC(Context ctx, string pngh)
{
    auto exportReplacer = (Captures!(typeof(pngh)) caps)
    {
        if ( caps[EXPORT_TYPE] == "PNG_REMOVED" )
            // No need to create C-side helpers for functions that can't be called.
            return "/* Removed:\n"~caps[0]~"\n*/";
        else
            return genericExportReplacer!("cHeader", wrapConditionalSetjmpHeaderC)
                (ctx, "C helper funcs header", caps[EXPORT_TYPE], caps[RETURN_TYPE], caps[FUNC_NAME], caps[FUNC_PARAMS], caps[FUNC_ATTRS]);
    };

    // Convert exports into helper functions.
    pngh = std.regex.replace!(exportReplacer)(pngh,rexPngExport);

    return pngh;
}

string getCallExprD(string returnType, string funcName, string argNames)
{
    if ( returnType == "void" )
        return format("%s(%s)", funcName, argNames);
    else
        return format("auto result = %s(%s)", funcName, argNames);
}

string getReturnExprD(string returnType)
{
    if ( returnType == "void" )
        return "return";
    else
        return "return result";
}

string simpleWrapD(Context ctx, string returnType, string funcName, string funcParams, string funcAttrs)
{
    string dFuncAttrs = replaceFunctionAttributesForWrappersInD(funcAttrs);
    return std.string.format(
        "extern(C) %s %s %s%s;\n",
        dFuncAttrs, returnType, funcName, funcParams);
}

void calculateBasicArgAndParamListsD(string funcName, string funcParams, ref string argList, ref string paramList)
{
    import std.string : chomp, join;

    auto params = analyzeParams(funcName, funcParams);
    sanitizeParamNamesD(params);

    foreach( param; params )
    {
        string dType = param.cType;
        if ( !param.arrayDims.empty )
            foreach ( dim; param.arrayDims )
                dType ~= "*"; // Decay C-style array parameters to pointers; D distinguishes arrays from pointers but C does not.
        paramList ~= dType ~ " " ~ param.cName ~ ", ";
        argList   ~= param.cName ~ ", ";
    }

    paramList = paramList.chomp(", ");
    argList   = argList.chomp(", ");
}

string wrapConditionalD(Context ctx, string returnType, string funcName, string funcParams, string funcAttrs)
{
    import std.string : join;

    string dFuncAttrs = replaceFunctionAttributesForWrappersInD(funcAttrs);

    string argList    = "";
    string paramListD = "";

    calculateBasicArgAndParamListsD(funcName, funcParams, argList, paramListD);

    // In this case we provide our own (stack allocated) dCallContext for the
    //   C functions to return error codes into.
    argList = ["&dCallContext", argList].join(", ");
    string callExpr = getCallExprD(returnType, pngNameToNsjName(funcName), argList);
    string paramListC = ["libpngCallContextForD* dCallContext", paramListD].join(", ");

    return std.string.format(
        "extern(C) %s %s %s(%s);\n"~
        "%s %s %s(%s)\n"~
        "{\n"~
        "    libpngCallContextForD dCallContext;\n"~
        "    %s;\n"~
        "    png_nsj_check_errors(&dCallContext);\n"~
        "    %s;\n"~
        "}\n\n",
        dFuncAttrs, returnType, pngNameToNsjName(funcName), paramListC,
        dFuncAttrs, returnType, funcName, paramListD,
        callExpr,
        getReturnExprD(returnType));
}

string wrapConditionalSetjmpD(Context ctx, string returnType, string funcName, string funcParams, string funcAttrs)
{
    import std.string : join;

    string dFuncAttrs = replaceFunctionAttributesForWrappersInD(funcAttrs);

    string argList   = "";
    string paramList = "";

    calculateBasicArgAndParamListsD(funcName, funcParams, argList, paramList);

    string callExpr = getCallExprD(returnType, pngNameToNsjName(funcName), argList);

    return std.string.format(
        "extern(C) %s %s %s(%s);\n"~
        "%s %s %s(%s)\n"~
        "{\n"~
        "    %s;\n"~
        "    png_nsj_check_errors(png_ptr.dCallContext);\n"~
        "    %s;\n"~
        "}\n\n",
        dFuncAttrs, returnType, pngNameToNsjName(funcName), paramList,
        dFuncAttrs, returnType, funcName, paramList,
        callExpr,
        getReturnExprD(returnType));
}

string generateHelperFuncsD(Context ctx, string pngh)
{
    // Replace 'struct tm' from <time.h> with 'tm' defined in core.stdc.time
    pngh = std.regex.replace(pngh, ctRegex!(`\bstruct\s+tm\b`,"sg"),"core.stdc.time.tm");

    // FAR pointers.  It isn't the 90s anymore.  Just say no.
    pngh = std.regex.replace(pngh, ctRegex!(`\bFAR\b`,"sg"), "");

    // Convert 'PNG_CONST' to 'const'
    pngh = std.regex.replace(pngh, ctRegex!(`\bPNG_CONST\b`,"sg"), "const");

    // D doesn't have 'restrict'.
    // TODO: Ideally we would inject a stub that looks at the pointer arguments
    // TODO: ('restrict' should imply multiple pointer parameters) and asserts
    // TODO: that they point to different things.
    pngh = std.regex.replace(pngh, ctRegex!(`\bPNG_RESTRICT\b`,"sg"), "");

    // Convert some C types to D
    pngh = std.regex.replace(pngh, ctRegex!(`\bunsigned\s+int\b`,"sg"), "uint");

    // Now replace the PNG_EXPORT notations with D functions and extern(C)s.
    auto exportReplacer = (Captures!(typeof(pngh)) caps)
    {
        if ( caps[EXPORT_TYPE] == "PNG_REMOVED" )
            return removedFunctionReplacerD(
                ctx, "D helper funcs", caps[EXPORT_TYPE], caps[RETURN_TYPE], caps[FUNC_NAME], caps[FUNC_PARAMS], caps[FUNC_ATTRS]);
        else
            return genericExportReplacer!("dWrap", wrapConditionalSetjmpD)
                (ctx, "D helper funcs", caps[EXPORT_TYPE], caps[RETURN_TYPE], caps[FUNC_NAME], caps[FUNC_PARAMS], caps[FUNC_ATTRS]);
    };

    pngh = std.regex.replace!(exportReplacer)(pngh,rexPngExport);

    return pngh;
}

string finalCleanup(string pngh)
{
    // Make the output easier to read.  Good for diagnostics.
    return std.regex.replace(pngh,ctRegex!(cNewLine~"{3,}","sg"),"\n\n");
}
