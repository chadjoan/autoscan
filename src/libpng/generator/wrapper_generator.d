import std.algorithm;
import std.stdio;
import std.file;
import std.regex;
import std.string;
import std.exception;
import std.path;

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
enum cNewLine = `(?:(?:\r\n)|\r|\n)`;
enum cPreProcMultiLine = `([^\r\n]+\\`~cCommentSpaceOneLine~`*`~cNewLine~`)*[^\n\r]+`;

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
enum rexComments = ctRegex!(cCommentMultiLine~`+`,"sg");
enum rexUndefs = ctRegex!(`#\s*undef\s+[A-Za-z0-9_]+`,"sg");
mixin(rtRegex("rexDefines",`#\s*define\s+[A-Za-z0-9_]+`~cPreProcMultiLine,"sg"));
mixin(rtRegex("rexAllPreProc",`#`~cPreProcMultiLine,"sg"));

// Past this point, I gave up on being comment-correct.
// These regexen expect comments to already be stripped from the file.
mixin(rtRegex("rexStructs",`\bstruct\s+([A-Za-z0-9_]+)\s+`~nestedRegex(`\{`,`\}`,`[^\{\}]*`,5)~`\s+;?`,"sg"));
enum rexTypedefs = ctRegex!(`\btypedef\s+.*?;`,"sg");

enum rexIfDefCpp = ctRegex!(`#ifdef\s+__cplusplus\s+((?:extern\s*"C"\s*\{)|\})\s*#endif`,"sg");

mixin(rtRegex("rexPngFunctionMacro",`\bPNG_FUNCTION\s*`~nestedRegex(`\(`,`\)`,`[^\(\)]*`,5)~`\s*;`,"sg"));

// This defines the following captures: ExportType, FuncId, ReturnType,
//   FuncName, FuncArgs, FuncAttrs.
// The capture names currently don't work, due to a range violation in std.regex.
// Have some enumerated values:
enum
{
    EXPORT_TYPE = 1,
    FUNC_ID,
    RETURN_TYPE,
    FUNC_NAME,
    FUNC_ARGS,
    FUNC_ATTRS,
}
mixin(rtRegex("rexPngExport",`(?P<ExportType>PNG_(?:EXPORT|EXPORTA|FP_EXPORT|FIXED_EXPORT))\s*\(`~
    `\s*(?P<FuncId>[0-9]+)\s*,\s*(?P<ReturnType>[A-Za-z0-9_\s\*]+),`~
    `\s*(?P<FuncName>[A-Za-z0-9_]+)\s*,\s*(?P<FuncArgs>`~nestedRegex(`\(`,`\)`,`[^\(\)]*`,5)~`)\s*`~
    `(,\s*(?P<FuncAttrs>[^\(\)]+))?\)\s*;?`,"sg"));

enum cFuncArg = `\s*([A-Za-z0-9_\s\*]*?)([A-Za-z0-9_]+)`;
enum rexFuncArgs = ctRegex!(cFuncArg~`,`,"sg");

void printUsage()
{
    writeln("This program generates files used to wrap libpng for use in the D programming language.");
    writeln("It uses png.h as its input and does the following things to obtain its output:");
    writeln(" - Removes all #define and #undef statements (to prevent duplicates).");
    writeln(" - Removes all typedef and struct statements (to prevent duplicates).");
    writeln(" - It replaces the PNG_EXPORT macro (and variants) with helper functions in C and D.");
    writeln(" - It replaces the png_structp type with the d_png_structp whenever it appears as an argument to a libpng function.");
    writeln(" - Numerous other things.");
    writeln("It will populate the current directory with these files:");
    writefln("%s, %s, and %s", outputFileImplC, outputFileHeaderC, outputFileD);
    writeln("");
    writeln("Usage:");
    writeln("wrapper_generator <dir containing png.h, pnglibconf.h> <output directory>");
}

alias string function(string,string,string) ExportWrapFn;

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
    // error handlers in the d_context member.
    // We also need to allocate/deallocate the d_context member whenever a
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
    // adds a d_context argument and checks for existence.  If the given
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
}

// =============================================================================
// -------------------------- main function ------------------------------------
int main( string[] args )
{
    if ( args.length != 3 )
    {
        writefln("Expected 2 arguments, got %s", args.length-1);
        writeln("");
        printUsage();
        return 0;
    }

    auto pngh = cast(string)std.file.read(buildPath(args[1],"png.h"));
    int removeCount = 0;

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

    pngh = std.regex.replace!(regexRemoveAndPrint)(pngh,rexDefines);
    pngh = std.regex.replace!(regexRemoveAndPrint)(pngh,rexUndefs);

    // The struct regex must go first, otherwise structs placed inside typedefs
    //   could cause the typedef regex to terminate prematurely.
    // We replace the structs with something readable in the typedef removes.
    pngh = std.regex.replace(pngh,rexStructs,"struct $1 {} ");
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
        ctRegex!(`\bPNG_EXPORT_LAST_ORDINAL\s*\(\s*[0-9]+\s*\)\s*;?`,"sg"));

    // Remove all preprocessor statements.
    // This gets its own output because at least one output uses the #ifdef
    //   logic to determine which functions are available.
    auto pngh_no_preproc = std.regex.replace!(regexRemoveAndPrint)(pngh,rexAllPreProc);

    // --------------- Get constants out of pnglibconfh ------------------------
    // TODO: These should probably turn into properties that retrieve the
    //   values from the C-side.  The solution below might not work well on
    //   other hosts unless the caller can build this generator and run it.
    auto pnglibconfd = cast(string)std.file.read(buildPath(args[1],"pnglibconf.h"));

    pnglibconfd = std.regex.replace(pnglibconfd, ctRegex!(`#.*PNGLCONF_H.*$`,"mg"), "");
    pnglibconfd = std.regex.replace(pnglibconfd, ctRegex!(`#\s*endif`,"mg"), ""); // Incase the one above didn't get it.
    pnglibconfd = std.regex.replace(pnglibconfd,
        ctRegex!(`^\s*#define\s+([0-9A-Za-z_]+)\s*$`,"mg"),
        "\nenum $1 = 1;");
    pnglibconfd = std.regex.replace(pnglibconfd,
        ctRegex!(`^\s*#define\s+([0-9A-Za-z_]+)(\s+)([0-9A-Za-z_+-]+)\s*$`,"mg"),
        "\nenum $1$2= $3;");

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
        generateFunctionDetectors(pngh) ~
        generateHelperFuncsC(pngh_no_preproc);

    auto png_c_helper_funcs_header =
        png_c_includes ~
        generateHelperFuncsHeaderC(pngh_no_preproc);

    auto png_d_helper_funcs =
        "module "~dThisModule~";\n"~
        "import std.c.time;\n"~
        "import "~dOtherModulePath~"types;\n"~
        "import "~dOtherModulePath~"png_struct;\n"~
        "import "~dOtherModulePath~"png_wrap_utils;\n"~
        "\n"~
        pnglibconfd~
        "\n"~
        generateHelperFuncsD(pngh_no_preproc);


    string outputPathImplC   = buildPath(args[2],outputFileImplC);
    string outputPathHeaderC = buildPath(args[2],outputFileHeaderC);
    string outputPathD       = buildPath(args[2],outputFileD);
    std.file.write(outputPathImplC,   finalCleanup(png_c_helper_funcs_impl));
    std.file.write(outputPathHeaderC, finalCleanup(png_c_helper_funcs_header));
    std.file.write(outputPathD,       finalCleanup(png_d_helper_funcs));

    writeln("Generated the following files:");
    writeln("  "~outputPathImplC);
    writeln("  "~outputPathHeaderC);
    writeln("  "~outputPathD);
    writeln("");

    return 1;
}

// ------------------------ auxiliary functions --------------------------------

string pngNameToNsjName(string pngName)
{
    enforce(startsWith(pngName, "png_"));
    return "png_nsj_"~pngName[4..$];
}

string generateFunctionDetectors(string pngh)
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

string dontWrapCD(string returnType, string funcName, string funcArgs)
{
    return "";
}

string simpleWrapHeaderC(string returnType, string funcName, string funcArgs)
{
    return returnType ~ " " ~ funcName ~ funcArgs ~ ";\n";
}

void analyzeArgs(string funcName, string argTuple, out string argNames, out string[] argTypes)
{
    auto args = argTuple[1..$-1];
    argNames = "";
    argTypes = new string[0];
    int whichArg = 0;
    foreach( arg; std.regex.match(args~",",rexFuncArgs) )
    {
        auto argType = std.string.strip(arg[1]);
        auto argName = arg[2];

        //writefln("argument: %s", arg.hit);
        //writefln("argument name: %s", argName);
        //writefln("argument type: %s", argType);

        /+
        // This wasn't working and probably isn't necessary anymore.
        if ( argType.length == 0 )
        {
            // Yay!  Corner cases.
            // They don't always specify argument names for their argument types.
            // This happens, for example, in png_get_current_row_number.
            argType = argName;
            argName = format("png_nsj_arg%s",whichArg);
        }
        +/

        //writefln("arg name postproc: %s", argName);
        //writefln("arg type postproc: %s", argType);

        argTypes ~= argType;
        argNames ~= argName ~ ", ";

        whichArg++;
    }

    // Trim off the last comma.
    if ( argNames.length > 2 )
        argNames = argNames[0..$-2];
}

string getArgNames(string funcName, string argTuple)
{
    string argNames;
    string[] argTypes;
    analyzeArgs(funcName,argTuple,argNames,argTypes);
    return argNames;
}

string[] getArgTypes(string funcName, string argTuple)
{
    string argNames;
    string[] argTypes;
    analyzeArgs(funcName,argTuple,argNames,argTypes);
    return argTypes;
}

string getReturnSuccessExpr(string returnType, string funcName, string argNames)
{
    argNames = std.regex.replace(argNames, ctRegex!`^(\s*png_ptr)\b`, "png_ptr->png_ptr");
    string returnSuccessExpr = std.string.format("%s(%s)", funcName, argNames);

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

string wrapConditionalC(string returnType, string funcName, string funcArgs)
{
    string extendedArgs = "d_png_glue_struct *d_context, "~funcArgs[1..$-1];
    string returnSuccessExpr = getReturnSuccessExpr(
        returnType, funcName, getArgNames(funcName,funcArgs));
    string returnFailExpr = getReturnFailExpr(returnType);
    return format(
        "%s %s(%s)\n"~
        "{\n"~
        "#   if PNG_NSJ_%s_IS_DEFINED == 1\n"~
        "        png_nsj_clear_errors(d_context);\n"~
        "        %s;\n"~
        "#   else\n"~
        "        png_nsj_set_missing_fn_err(d_context);\n"~
        "        %s;\n"~
        "#   endif\n"~
        "}\n",
        returnType, pngNameToNsjName(funcName), extendedArgs,
        funcName,
        returnSuccessExpr,
        returnFailExpr);
}

string wrapConditionalSetjmpC(string returnType, string funcName, string funcArgs)
{
    string modifiedArgs = std.regex.replace(funcArgs,
        ctRegex!("(?:(?:png_structp)|(?:png_const_structp))","sg"), "d_png_structp");

    string argNames;
    string[] argTypes;
    analyzeArgs(funcName,funcArgs,argNames,argTypes);

    //enforce(startsWith(argNames,"png_ptr"), std.string.format(
    enforce(argTypes[0] == "png_structp" || argTypes[0] == "png_const_structp",
        std.string.format(
        "All functions are expected to have type something of type png_structp or png_const_structp "~
        "as their first argument, however, '%s' does not.",funcName));

    string returnSuccessExpr = getReturnSuccessExpr(
        returnType, funcName, argNames);

    string returnFailExpr = getReturnFailExpr(returnType);

    return std.string.format(
        "%s %s%s\n"~
        "{\n"~
        "    png_nsj_clear_errors(&png_ptr->d_context);\n"~
        "\n"~
        "#   if PNG_NSJ_%s_IS_DEFINED == 1\n"~
        "        jmp_buf d_jmp_buf;\n"~
        "        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;\n"~
        "        if ( setjmp(d_jmp_buf) ) {\n"~
        "            %s;\n"~
        "        }\n"~
        "        %s;\n"~
        "#   else\n"~
        "        png_nsj_set_missing_fn_err(&png_ptr->d_context);\n"~
        "        %s;\n"~
        "#   endif\n"~
        "}\n",
        returnType, pngNameToNsjName(funcName), modifiedArgs,
        funcName,
        returnFailExpr,
        returnSuccessExpr,
        returnFailExpr);
}

string genericExportReplacer(string targetOfWrapperFuncSet, string commonWrapFunc)(
    string source, string returnType, string funcName, string funcArgs)
{
    // All function definitions go through this function before being dispatched
    //   to their destination-specific wrapping routines.

    /* TODO: EXPORT_TYPE? */
    infofln("%s: Generating: %s %s(...)",
        source, returnType, funcName);

    // Get rid of the func_name(void) C-ism.
    funcArgs = std.regex.replace(funcArgs, ctRegex!`\(\s*void\s*\)`, "()");

    /* Fix broken funcArgs if they omitted the parameter name for png_ptr. */
    string strippedFuncArgs = std.string.strip(funcArgs[1..$-1]);
    if ( strippedFuncArgs == "png_structp" || strippedFuncArgs == "png_const_structp" )
        funcArgs = "(png_structp png_ptr)";

    // You can thank png_process_data_pause for this one.
    funcArgs = std.regex.replace(funcArgs, ctRegex!`^\(\s*(png_structp|png_const_structp)\s*,`, "($1 png_ptr,");

    if ( funcName in cWrapExceptions )
        // Some functions don't take png_ptr as a first arg and also don't
        //   do setjmp/longjmp stuff.  They must be wrapped differently.
        mixin("return cWrapExceptions[funcName]."~targetOfWrapperFuncSet~
            "(returnType, funcName, funcArgs);");
    else
        // More commonly, we have to wrap heavily.
        mixin("return "~commonWrapFunc~"(returnType, funcName, funcArgs);");

}

string generateHelperFuncsC(string pngh)
{
    auto exportReplacer = (Captures!(typeof(pngh)) caps)
    {
        return genericExportReplacer!("cImpl","wrapConditionalSetjmpC")
            ("C helper funcs impl", caps[RETURN_TYPE], caps[FUNC_NAME], caps[FUNC_ARGS]);
    };

    // Convert exports into helper functions.
    pngh = std.regex.replace!(exportReplacer)(pngh,rexPngExport);

    return pngh;
}

string wrapConditionalHeaderC(string returnType, string funcName, string funcArgs)
{
    string extendedArgs = "d_png_glue_struct *d_context, "~funcArgs[1..$-1];
    return format(
        "%s %s(%s);\n",
        returnType, pngNameToNsjName(funcName), extendedArgs);
}

string wrapConditionalSetjmpHeaderC(string returnType, string funcName, string funcArgs)
{
    string modifiedArgs = std.regex.replace(funcArgs,
        ctRegex!("(?:(?:png_structp)|(?:png_const_structp))","sg"), "d_png_structp");

    return std.string.format(
        "%s %s%s;\n",
        returnType, pngNameToNsjName(funcName), modifiedArgs);
}

string generateHelperFuncsHeaderC(string pngh)
{
    auto exportReplacer = (Captures!(typeof(pngh)) caps)
    {
        return genericExportReplacer!("cHeader","wrapConditionalSetjmpHeaderC")
            ("C helper funcs header", caps[RETURN_TYPE], caps[FUNC_NAME], caps[FUNC_ARGS]);
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
        return "return;";
    else
        return "return result;";
}

string simpleWrapD(string returnType, string funcName, string funcArgs)
{
    return std.string.format(
        "extern(C) %s %s%s;\n",
        returnType, funcName, funcArgs);
}

string wrapConditionalD(string returnType, string funcName, string funcArgs)
{
    // In this case we provide our own (stack allocated) d_context for the
    //   C functions to return error codes into.
    string extendedArgs = "d_png_glue_struct* d_context, "~funcArgs[1..$-1];
    string argNames = "&d_context, "~getArgNames(funcName,funcArgs);
    string callExpr = getCallExprD(returnType, pngNameToNsjName(funcName), argNames);

    return std.string.format(
        "extern(C) %s %s(%s);\n"~
        "%s %s%s\n"~
        "{\n"~
        "    d_png_glue_struct d_context;\n"~
        "    %s;\n"~
        "    png_nsj_check_errors(&d_context);\n"~
        "    %s;\n"~
        "}\n\n",
        returnType, pngNameToNsjName(funcName), extendedArgs,
        returnType, funcName, funcArgs,
        callExpr,
        getReturnExprD(returnType));
}

string wrapConditionalSetjmpD(string returnType, string funcName, string funcArgs)
{
    string argNames = getArgNames(funcName,funcArgs);
    string callExpr = getCallExprD(returnType, pngNameToNsjName(funcName), argNames);

    return std.string.format(
        "extern(C) %s %s%s;\n"~
        "%s %s%s\n"~
        "{\n"~
        "    %s;\n"~
        "    png_nsj_check_errors(&png_ptr.d_context);\n"~
        "    %s;\n"~
        "}\n\n",
        returnType, pngNameToNsjName(funcName), funcArgs,
        returnType, funcName, funcArgs,
        callExpr,
        getReturnExprD(returnType));
}

string generateHelperFuncsD(string pngh)
{
    // Replace 'struct tm' from <time.h> with 'tm' defined in std.c.time
    pngh = std.regex.replace(pngh, ctRegex!(`\bstruct\s+tm\b`,"sg"),"std.c.time.tm");

    // FAR pointers.  It isn't the 90s anymore.  Just say no.
    pngh = std.regex.replace(pngh, ctRegex!(`\bFAR\b`,"sg"), "");

    // Convert 'PNG_CONST' to 'const'
    pngh = std.regex.replace(pngh, ctRegex!(`\bPNG_CONST\b`,"sg"), "const");

    // Convert some C types to D
    pngh = std.regex.replace(pngh, ctRegex!(`\bunsigned\s+int\b`,"sg"), "uint");

    // Now replace the PNG_EXPORT notations with D functions and extern(C)s.
    auto exportReplacer = (Captures!(typeof(pngh)) caps)
    {
        return genericExportReplacer!("dWrap","wrapConditionalSetjmpD")
            ("D helper funcs", caps[RETURN_TYPE], caps[FUNC_NAME], caps[FUNC_ARGS]);
    };

    pngh = std.regex.replace!(exportReplacer)(pngh,rexPngExport);

    return pngh;
}

string finalCleanup(string pngh)
{
    // Make the output easier to read.  Good for diagnostics.
    return std.regex.replace(pngh,ctRegex!(cNewLine~"{3,}","sg"),"\n\n");
}