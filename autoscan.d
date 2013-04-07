import sane;
import sane_test;
import sane_wrapper;

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
        blah++;
    }
    table.printByLines( line => writeln(line) );

    scanner.options[dpiOpt].asInt = 300;
    scanner.options[modeOpt].asString = "Color";
    scanner.options[sourceOpt].asString = "ADF Duplex";

    writefln("...");
    writefln("...");
    table = new TextTable(["name","title","type","value","desc"]);
    table.maxLineLength = columns;
    foreach( opt; scanner.options )
    {
        table.insertf("%s",opt.name)("%s",opt.title)("%s",opt.type)("%s",opt.toString())("%s",opt.desc);
    }
    table.printByLines( line => writeln(line) );


    auto pdf = HPDF_New(null,null);
    if ( !pdf )
        throw new Exception("Couldn't create pdf.");
    scope(exit) HPDF_Free(pdf);

    HPDF_SetCompressionMode (pdf, HPDF_COMP_ALL);

    auto page = HPDF_AddPage (pdf);

    HPDF_Page_SetSize (page, HPDF_PAGE_SIZE_B5, HPDF_PAGE_LANDSCAPE);

    HPDF_SaveToFile(pdf, "test.pdf");

    return 0;
}
