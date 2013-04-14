import sane.sane;
import sane.sane_test;
import sane.abstraction;

import haru.hpdf;

import text_table;

import std.stdio;
import std.conv;
import std.exception;
import std.process : getenv;

//import core.stdc.stdio;
import core.sys.posix.unistd;
import core.sys.posix.sys.ioctl;


int main(string[] args)
{
    // Get number of columns for the current terminal.
    winsize w;
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);

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

        assert(params.format == SANE_FRAME_RGB); // HACK: So the PDF can use it later on.
    }

    ubyte[] pixels = [
    0x00,0xff,0x00,   0x00,0x00,0x00,   0x00,0xff,0x00,   0x00,0x00,0x00,   0xff,0x00,0x00,   0x00,0x00,0x00,
    0x00,0xff,0x00,   0x00,0x00,0x00,   0x00,0xff,0x00,   0x00,0x00,0x00,   0x00,0x00,0x00,   0x00,0x00,0x00,
    0x00,0xff,0x00,   0x00,0xff,0x00,   0x00,0xff,0x00,   0x00,0x00,0x00,   0xff,0x00,0x00,   0x00,0x00,0x00,
    0x00,0xff,0x00,   0x00,0x00,0x00,   0x00,0xff,0x00,   0x00,0x00,0x00,   0xff,0x00,0x00,   0x00,0x00,0x00,
    ];



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

    return 0;
}
