import sane.sane;
import sane.sane_test;
import sane.abstraction;

import haru.hpdf;
import libpng.png;
import tesseract.capi;
import leptonica.pix;

import text_table;

import std.stdio;
import std.string;
import std.conv;
import std.exception;
import std.process : getenv;

//import core.stdc.stdio;
import core.sys.posix.unistd;
import core.sys.posix.sys.ioctl;
import core.sys.posix.stdio; // For FILE* and related funcs.

/+
bool isPixelBit(dchar c)
{
    return (('A' <= c && c <= 'Z') || ('a' <= c && c <= 'z') || c == '#' );
}

int countBits(string pixelLayout)
{
    int count = 0;
    foreach( c; pixelLayout )
        if ( isPixelBit(c) )
            count++;
    return count;
}

bool existsIn(dchar needle, string haystack)
{
    foreach( c; haystack )
        if ( c == needle )
            return true;
    return false;
}

string getChannelChars(string pixelLayout)
{
    string result = "";
    foreach( c; pixelLayout )
        if ( isPixelBit(c) && !existsIn(c,result) )
            result ~= c;
    return result;
}

template PreferredInt(int bitsPerPixel)
{
    static if ( bitsPerPixel <= 64 )
        alias ulong this;
    else static if ( bitsPerPixel <= 32 )
        alias uint this;
    else static if ( bitsPerPixel <= 16 )
        alias ushort this;
    else
        alias ubyte this;
}

struct ChannelMeta(T)
{
    T mask;
    T shift;
}

struct PixelMeta(T, string channelChars)
{
    alias T PreferredInt;
    const channelChars = channelChars;
    int bitsPerPixel;
    foreach( c; channelChars )
        mixin("ChannelMeta!(T) "~c";");
}

auto getPixelMeta(string pixelFormatStr)()
{
    const bitsPerPixel = countBits(pixelLayout);
    const channelChars = getChannelChars(pixelFormatStr);
    alias PixelMeta!(PreferredInt!bitsPerPixel,channelChars) PMeta;
    PMeta result;

    result.bitsPerPixel = bitsPerPixel;
    foreach( shift; channelChars )
    {
        int bitCount = 0;
        T bitMask = 1;
        mixin("result."~shift~" = 0;");
        mixin("result."~mask~" = 0;");
        foreach( c; pixelFormatStr )
        {
            if ( c == shift )
            {
                mixin(
`               if ( result.`~shift~` == 0 )
                    result.`~shift~` = bitCount;

                result.`~mask~` |= bitMask;
`)
            }

            if ( isPixelBit(c) )
            {
                bitCount++;
                bitMask <<= 1;
            }
        }
    }

    return result;
}

enum  str_rgb24  = "rrrr,rrrr:gggg,gggg:bbbb,bbbb";
enum  str_rgba32 = "aaaa,aaaa:rrrr,rrrr:gggg,gggg:bbbb,bbbb";
enum  str_rgb8c2 = "rrrr,rrrr:RRgg,gggg:ggGG,bbbb:bbbb,BB##";

enum  rgb24  = getPixelMeta(str_rgb24);
enum  rgba32 = getPixelMeta(str_rgba32);
enum  rgb8c2 = getPixelMeta(str_rgb8c2);
enum  rgb8c2x2 = getPixelMeta(str_rgb8c2~str_rgb8c2);
alias Pixel!rgb8c2   RGB8c2;
alias Pixel!rgb8c2x2 RGB8c2x2;

template Pixel(string pixelFormat)
{
    alias Pixel!(PixelMeta!pixelFormat) Pixel;
}

struct Pixel(alias pixelFormat)
{
    const pixelFormat = pixelFormat;
    PixelFormat.PreferredInt payload;
    alias payload this;
}

T to(T,V)(V source) if ( is(T.pixelFormat) && is(V.pixelFormat) )
{

}
+/


int main(string[] args)
{
    // Get number of columns for the current terminal.
    winsize w;
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);


    TessBaseAPI* tapi = TessBaseAPICreate();
    scope(exit) TessBaseAPIDelete(tapi);

    int status = TessBaseAPIInit3(tapi, toStringz("tessdata"), toStringz("eng"));
    if ( status != 0 )
        throw new Exception("Could not init Tesseract.");

    // Just to know wth these are.
    writeln("Tess API parameters:");
    TessBaseAPIPrintVariables(tapi, core.stdc.stdio.stdout);
    writeln("...");
    writeln("...");

    auto str = TessBaseAPIGetInitLanguagesAsString(tapi);
    writefln("Available languages: %s", to!string(str));
    writeln("...");
    writeln("...");

    writeln("Loaded languages:");
    auto vec = TessBaseAPIGetLoadedLanguagesAsVector(tapi);
    for ( int i = 0; vec[i] !is null; i++ )
        writeln(to!string(vec[i]));
    TessDeleteTextArray(vec);
    writeln("...");
    writeln("...");

    //writefln ("lines %d", w.ws_row);
    //writefln ("columns %d", w.ws_col);
    int columns = w.ws_col;

    saneInit(null); // TODO: user auth.
    scope(exit) saneExit();

    auto devices = saneGetDevices(false);
    if ( devices.length == 0 )
    {
        writeln("No scanners detected.");
        return 1;
    }

    TextTable table;
    table = new TextTable(["number","name","vendor","model","type"]);
    table.maxLineLength = columns;
    foreach( i, device; devices )
        table.insertf("%s",i)("%s",device.name)("%s",device.vendor)("%s",device.model)("%s",device.type);
    //    table.insert([device.name, device.vendor, device.model, device.type]);
    table.printByLines( line => writeln(line) );

    writefln("...");
    int selection = 0;
    if ( devices.length > 1 )
    {
        writefln("Please choose a scanner.");
        enforce(readf("%d",&selection));
    }

    auto scanner = saneOpen(devices[selection].name);
    scope(exit) saneClose(scanner);

    writefln("...");
    writefln("...");
    table = new TextTable(["name","title","type","value","desc"]);
    table.maxLineLength = columns;
    //table.columnWrap([16,32,40]);
    int dpiOpt = 0;
    int modeOpt = 0;
    int sourceOpt = 0;
    int aldOpt = 0; // Auto length detection!
    int blah = 0;
    foreach( opt; scanner.options )
    {
        table.insertf("%s",opt.name)("%s",opt.title)("%s",opt.type)("%s",opt.toString())("%s",opt.desc);
        if ( opt.name == "resolution" )
            dpiOpt = blah;
        else if ( opt.name == "mode" )
            modeOpt = blah;
        else if ( opt.name == "source" )
            sourceOpt = blah;
        else if ( opt.name == "ald" )
            aldOpt = blah;
        blah++;
    }
    table.printByLines( line => writeln(line) );

    scanner.options[dpiOpt].asInt = 300;
    scanner.options[modeOpt].asString = "Color";
    scanner.options[sourceOpt].asString = "ADF Duplex";
    scanner.options[aldOpt].asBool = 1;

    writefln("...");
    writefln("...");
    table = new TextTable(["name","title","type","value","desc"]);
    table.maxLineLength = columns;
    foreach( opt; scanner.options )
    {
        table.insertf("%s",opt.name)("%s",opt.title)("%s",opt.type)("%s",opt.toString())("%s",opt.desc);
    }
    table.printByLines( line => writeln(line) );

    ubyte[] scanData = new ubyte[0];
    uint height = 0;
    uint width = 0;
    {
        saneStart(scanner);
        scope(exit) saneCancel(scanner);

        SaneParameters params;
        saneGetParameters(scanner, &params);
        //sane_get_parameters(scanner.c, &params.c);

        writefln("...");
        writefln("...");
        table = new TextTable(["format","lastFrame","bpl","ppl","lines","depth"]);
        table.insertf("%s",params.format)("%s",params.lastFrame)("%s",params.bytesPerLine)
            ("%s",params.pixelsPerLine)("%s",params.lines)("%s",params.depth);
        table.printByLines( line => writeln(line) );

        writefln("...");
        writefln("...");
        writefln("Reading pixel data.");

        ubyte[] scanLine = new ubyte[params.bytesPerLine];
        SANE_Int bytesRead = 0;
        while( saneRead(scanner,scanLine.ptr,scanLine.length.to!int,&bytesRead) )
        {
            //writefln("read %s/%s bytes", bytesRead, scanLine.length);
            scanData ~= scanLine[0 .. params.pixelsPerLine * 3];
            height++;
        }

        width = params.pixelsPerLine;
        writefln("Pixel data received.");

        assert(params.format == SANE_FRAME_RGB); // HACK: So the PDF/png can use it later on.
    }

    /+
    ubyte[] pixels = [
    0x00,0xff,0x00,   0x00,0x00,0x00,   0x00,0xff,0x00,   0x00,0x00,0x00,   0xff,0x00,0x00,   0x00,0x00,0x00,
    0x00,0xff,0x00,   0x00,0x00,0x00,   0x00,0xff,0x00,   0x00,0x00,0x00,   0x00,0x00,0x00,   0x00,0x00,0x00,
    0x00,0xff,0x00,   0x00,0xff,0x00,   0x00,0xff,0x00,   0x00,0x00,0x00,   0xff,0x00,0x00,   0x00,0x00,0x00,
    0x00,0xff,0x00,   0x00,0x00,0x00,   0x00,0xff,0x00,   0x00,0x00,0x00,   0xff,0x00,0x00,   0x00,0x00,0x00,
    ];+/

    /+ Tesseract Notes
    ----------------------------------------------------------------------------
   * Note that TesseractRect is the simplified convenience interface.
   * For advanced uses, use SetImage, (optionally) SetRectangle, Recognize,
   * and one or more of the Get*Text functions below.
    ----------------------------------------------------------------------------
   * Call between pages or documents etc to free up memory and forget
   * adaptive data.
   */
  void ClearAdaptiveClassifier();
    ----------------------------------------------------------------------------


    /+ workflow +/
    Call Init, get a TessAPI object.
  void SetImage(const Pix* pix);
  void SetSourceResolution(int ppi);

  PageIterator* AnalyseLayout();
   ^^ What does this DO?  Maybe I should do that first and get bounding boxes.

  Boxa* GetRegions(Pixa** pixa);
  foreach( region; pixa )
  {

  }



    +/

    writeln("Rotating image.");
    rotate180RGB(scanData, width, height);
    writeln("Done rotating.");

    TessBaseAPISetImage(tapi, scanData.ptr, width, height, 3 /* Bpp -> RGB */, width/3);
    //TessBaseAPISetRectangle(tapi, 0, 0, width, height);

    TessBaseAPISetSourceResolution(tapi, 300);

    /+
        TessPageIterator* tpi = TessBaseAPIAnalyseLayout(tapi);
        if ( tpi is null )
            throw new Exception("Could not get page iterator.");
        scope(exit) TessPageIteratorDelete(tpi);

        int index = 0;
        do
        {
            // TODO: what does TessResultIteratorGetUTF8Text(tri, TessPageIteratorLevel level);
            //   do in here?

            int left, top, right, bottom;
            BOOL result = TessPageIteratorBoundingBox(tpi, RIL_BLOCK, &left, &top, &right, &bottom);

            writefln("  Bounding box #%s is (%s,%s)x(%s,%s)", index, left, top, right, bottom);
            index++;
        }
        while ( TessPageIteratorNext(tpi, RIL_BLOCK) );
+/


    writeln("Doing OCR.");
    status = TessBaseAPIRecognize(tapi, null);
    if ( status != 0 )
        throw new Exception("Could not recognize text.");
    writeln("OCR done.");


    Pix* thresholded = TessBaseAPIGetThresholdedImage(tapi);
    writefln("thresholded image properties:");
    writefln("width  = %s",thresholded.w);
    writefln("height = %s",thresholded.h);
    writefln("depth  = %s",thresholded.d);
    writefln("wpl    = %s",thresholded.wpl);
    writeln("...");

    ubyte[] monoHack = monoToRGB(cast(ubyte[])thresholded.data[0..width*height/32],width,height/8);
    writeln("Saving thresholded image.");
    saveToPngRGB(monoHack, width, height/8, "mono1.png");
    writeln("done.");
    writeln("...");

    Pix* mono32 = pixConvert1To32(null, thresholded, 0x00000000, 0xffFFffFF);

    writefln("thresholded image properties in 32 bit form:");
    writefln("width  = %s",mono32.w);
    writefln("height = %s",mono32.h);
    writefln("depth  = %s",mono32.d);
    writefln("wpl    = %s",mono32.wpl);
    writeln("...");
    ubyte[] mono24 = rgbaToRGB(cast(ubyte[])mono32.data[0..width*height],width,height);
    writeln("Saving thresholded image.");
    saveToPngRGB(mono24, width, height, "mono2.png");
    writeln("done.");
    writeln("...");


/+

    auto txt = TessBaseAPIRect(tapi, scanData.ptr, 3 /* Bpp -> RGB */, width/3, 0,0, width, height,);
+/
    auto txt = TessBaseAPIGetUTF8Text(tapi);
    if ( txt is null )
        writeln("Could not initialize text.");
    else
        writefln("Text recovered: %s", to!string(txt));
    scope(exit) if ( txt !is null ) TessDeleteText(txt);

    TessResultIterator* tri = TessBaseAPIGetIterator(tapi);
    if ( tri is null )
        throw new Exception("Could not get result iterator.");
    scope(exit) TessResultIteratorDelete(tri);
/+
    TessPageIterator* tpi = TessBaseAPIAnalyseLayout(tapi);
    if ( tpi is null )
        throw new Exception("Could not get page iterator.");
    scope(exit) TessPageIteratorDelete(tpi);
+/
    TessPageIterator* tpi = TessResultIteratorGetPageIterator(tri);
    if ( tpi is null )
        throw new Exception("Could not get page iterator.");
    //scope(exit) writefln("Deleting iterator.");
    scope(exit) TessPageIteratorDelete(tpi);

    for( TessPageIteratorLevel level = RIL_BLOCK; level <= RIL_SYMBOL; level++ )
    {
        //TessPageIteratorLevel level = RIL_WORD;
        writefln("level = %s",tesseract.capi.toString(level));

        TessPageIteratorBegin(tpi);
        int index = 0;
        do
        {
            // TODO: what does TessResultIteratorGetUTF8Text(tri, TessPageIteratorLevel level);
            //   do in here?

            int left, top, right, bottom;
            BOOL result = TessPageIteratorBoundingBox(tpi, level, &left, &top, &right, &bottom);

            writefln("  Bounding box #%s is (%s,%s)x(%s,%s)", index, left, top, right, bottom);
            auto tritxt = TessResultIteratorGetUTF8Text(tri, level);
            writefln("  ResultIterator.UTF8Text = %s", to!string(tritxt));
            index++;
        }
        while ( TessPageIteratorNext(tpi, level) );
    }
    writeln("Done page iterating.");

/+
    auto pdf = HPDF_New(null,null);
    if ( !pdf )
        throw new Exception("Couldn't create pdf.");
    scope(exit) HPDF_Free(pdf);

    //HPDF_UseUTFEncodings(pdf); (maybe someday.)
    throwOnError(HPDF_SetCompressionMode (pdf, HPDF_COMP_ALL));

    auto page = HPDF_AddPage (pdf);

    throwOnError(HPDF_Page_SetSize (page, HPDF_PAGE_SIZE_LETTER, HPDF_PAGE_PORTRAIT));
    //HPDF_Page_SetWidth(page, HPDF_Page_GetWidth(page) * 300.0f / 72.0f);
    //HPDF_Page_SetHeight(page, HPDF_Page_GetHeight(page) * 300.0f / 72.0f);
    //throwOnError(HPDF_Page_Concat (page, 72.0f / 300.0f, 0, 0, 72.0f / 300.0f, 0, 0));
    writefln("Page dims: (%s,%s)",HPDF_Page_GetWidth(page),HPDF_Page_GetHeight(page));


    //auto pdfImage = HPDF_LoadRawImageFromMem(pdf, pixels.ptr, 6, 4, HPDF_CS_DEVICE_RGB, 8);
    //throwOnError(HPDF_Page_DrawImage(page, pdfImage, 100, 100, 6, 4));

    writefln("width,height = (%s,%s)", width, height);
    writefln("scanData.length = %s", scanData.length);
    writefln("width*height = %s", width*height);
    auto pdfImage = HPDF_LoadRawImageFromMem(pdf, scanData.ptr, width, height, HPDF_CS_DEVICE_RGB, 8);
    writefln("Yo dawg.");
    throwOnError(HPDF_Page_DrawImage(page, pdfImage, 0, 0,
        HPDF_Page_GetWidth(page), HPDF_Page_GetHeight(page)));


    // Convert everything into two images: RGB and HSV
    // Pixel formats are 8-2-8-2-8-2-2 Red-Carry-Green-Carry-Blue-Carry-Mask
    // R8-C2-G8-C2-B8-C2-M2 == 32 bits.
    // ..OR..
    // R8-C1-G8-C1-B8-C1-M5 with 5 bits of spectral identification.
    //     (That would support categorizing pixels by the top 31 spectral peaks.)
    // Operations can be done on two pixels at a time with 64 bit ulongs.
    // The carry bits allow for three consecutive add or subtract operations
    //   before the carry bits need to be cleared or saturated.
    // (TODO: how to saturate a 2-bit carry?  If not, saturation may need to be done after one op.)
    // At least one of the mask bits can be used to determine which pixels are
    //   "background" and which are "foreground".
    // Documents will tend to have all of the important bits surrounded by margins.
    // These margins establish an important baseline for background-like-pixels
    //   and an algorithm can be devised for thresholding the background:
    // Anything reachable from the margins that lies in the same statistically
    //   significant (HSV) spectral peak can be safely thresholded.
    // PNG encode it all after that.  This should give reasonable compression.
    // TODO: large uniformely shaded areas not reachable by margins?
    // Make a file named gfx_ops.d that has basic per-pixel operations like
    //   "channelAvg" or "saturatedAdd", all marked private.
    // Use mixin(import("gfs_ops.d")); to import it to improve inlining chances.
    // 3-dimensional spectral analysis vs 1-dimensional spectral analysis.
    // Figure out how to do spectral analysis on hue first.
    // Then generalize to 3 dimensions.
    // Visualization? Could be interesting! Possibly time consuming :/

    /+
    private pure nothrow ulong bands(ulong a)
    {
        return a & bandMask;
    }

    private pure nothrow void carryFill(ref ulong a)
    {
        assert(a.bands == 0);
        a &= carryMask;
        a -= (a >> channelWidth);
    }

    private pure nothrow ulong rgb_leq(ulong a, ulong b)
    {
        assert(a.bands == 0);
        assert(b.bands == 0);
        auto c = b - a;
        carryFill(c);

    }

    private pure nothrow uint rgb_leq(uint a, uint b)
    {
        auto c = b - a;
        return a & carryMask;
    }

    if ( rgb_leq(img.band.min, pixel) && rgb_leq(pixel, img.band.max) )
        pixel = img.band.center;
+/
    /+
HPDF_Page_DrawImage  (HPDF_Page    page,
                      HPDF_Image   image,
                      HPDF_REAL    x,
                      HPDF_REAL    y,
                      HPDF_REAL    width,
                      HPDF_REAL    height);
+/

    throwOnError(HPDF_SaveToFile(pdf, "test.pdf"));
+/
    saveToPngRGB(scanData, width, height, "test.png");
    writeln("Thank you for playing Wing Commander!");
    return 0;
}

void verticalMirrorRGB( ubyte[] pixels, int width, int height )
{
    int byteWidth = width*3;
    ubyte[] lineTemp = new ubyte[byteWidth];

    for ( int y = 0; y < height/2; y++ )
    {
        int loBegin = y * byteWidth;
        int loEnd = loBegin + byteWidth;
        int hiBegin = (height - y - 1) * byteWidth;
        int hiEnd = hiBegin + byteWidth;

        lineTemp[] = pixels[hiBegin .. hiEnd];
        pixels[hiBegin .. hiEnd] = pixels[loBegin .. loEnd];
        pixels[loBegin .. loEnd] = lineTemp[];
    }
}

void horizontalMirrorRGB( ubyte[] pixels, int width, int height )
{
    int byteWidth = width*3;

    for ( int y = 0; y < height; y++ )
    {
        int begin = y * byteWidth;
        int end = begin + byteWidth;
        horizontalMirrorLineRGB(pixels[begin .. end],width);
    }
}

void horizontalMirrorLineRGB( ubyte[] pixels, int width )
{
    int byteWidth = width*3;

    for ( int x = 0; x < byteWidth/2; x += 3 )
    {
        // Portability: Endianness concern.
        uint mask = 0x00ffFFff; // 0xffFFff00;
        uint *left = cast(uint*)&pixels[x];
        uint *right = cast(uint*)&pixels[byteWidth-x-3];
        uint tmp = *right;
        *right = (*left & mask) | (*right & ~mask);
        *left  = (tmp   & mask) | (*left  & ~mask);
    }
}

void rotate180RGB( ubyte[] pixels, int width, int height )
{
    verticalMirrorRGB(pixels,width,height);
    horizontalMirrorRGB(pixels,width,height);
}

// hacky hacky.
ubyte[] rgbaToRGB( ubyte[] pixels, int width, int height )
{
    ubyte[] result = new ubyte[width*height*3];
    int i = 0;
    int j = 0;
    while ( i < width*height*4 )
    {
        result[j++] = pixels[i++];
        result[j++] = pixels[i++];
        result[j++] = pixels[i++];
        i++;
    }
    return result;
}

ubyte[] monoToRGB( ubyte[] pixels, int width, int height )
{
    ubyte[] result = new ubyte[width*height*3];
    int i = 0;
    int j = 0;
    while ( i < width*height )
    {
        if ( pixels[i++] > 0 )
        {
            result[j++] = 0xff;
            result[j++] = 0xff;
            result[j++] = 0xff;
        }
        else
        {
            result[j++] = 0x00;
            result[j++] = 0x00;
            result[j++] = 0x00;
        }
    }
    return result;
}

import core.sys.posix.stdio; // For FILE* and related funcs.
import etc.c.zlib; // Z_BEST_COMPRESSION

alias core.sys.posix.stdio.fopen fopen;

void saveToPngRGB( ubyte[] pixels, int width, int height, string fileName )
{

    png_structp  png_ptr;
    png_infop  info_ptr;

    // Allocate the png_ptr and info_ptr because
    //   they are used by everything in libpng.
    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, null, null, null);
    if (!png_ptr)
        throw new Exception("png_create_write_struct failed.");

    // info_ptr holds a bunch of header information for the png.
    info_ptr = png_create_info_struct(png_ptr);
    if (!info_ptr) {
        png_destroy_write_struct(&png_ptr, null);
        throw new Exception("png_create_info_struct failed.");
    }

    // setjmp is unneeded.  If anything goes wrong, an exception is thrown.
    // We can make sure resource cleanup happens by using scope(exit).
    scope(exit) png_destroy_write_struct(&png_ptr, &info_ptr);

    // Open a file for [w]riting in [b]inary mode.
    FILE *fp = fopen(toStringz(fileName), "wb");
    if (!fp)
        throw new Exception(format("Couldn't open file %s for writing.",fileName));
    scope(exit) fclose(fp); // fp gets closed, even if an exception happens.

    // We have an open file, now hand it off to libpng.
    png_init_io(png_ptr, fp);

    // Remember why we do this ;)
    png_set_compression_level(png_ptr, Z_BEST_COMPRESSION);

    // This informs libpng about the basic parameters of our image.
    int bitDepth = 8; /* AKA sample_depth */
    png_set_IHDR(png_ptr, info_ptr, width, height, bitDepth,
        PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,
        PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT);

    // When you're done writing chunks into the header, you call this.
    png_write_info(png_ptr, info_ptr);

    // Write the pixel data into the png.
    // We'll do this one row at a time so that we don't have to allocate an
    //   array of pointers to the beginning of every row.
    for ( int i = 0; i < width*height; i += width )
        png_write_row(png_ptr, cast(ubyte*)(pixels.ptr) + i*3);

    // Call png_write_end when done with pixel data.
    // The second parameter could be another info struct with more chunks.
    // In this case we have no more chunks, so passing it null is sufficient.
    png_write_end(png_ptr, null);

    // We're done.  All of the cleanup and deallocation will be handled by
    //   the scope statements we used earlier.
    writefln("Wrote %s", fileName);
}
