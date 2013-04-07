import sane;
import sane_test;
import sane_wrapper;

import text_table;

import std.stdio;
import std.conv;
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

    auto table = new TextTable(["number","name","vendor","model","type"]);
    table.maxLineLength = columns;
    foreach( i, device; devices )
        table.insertf("%s",i)("%s",device.name)("%s",device.vendor)("%s",device.model)("%s",device.type);
    //    table.insert([device.name, device.vendor, device.model, device.type]);
    table.printByLines( line => writeln(line) );

    int selection = 0;
    if ( devices.length > 1 )
        assert(readf("%d",&selection));

    auto scanner = saneOpen(devices[selection].name);
    scope(exit) saneClose(scanner);

    /+
    @property string name() const { return to!string(c.name); }   /// name of this option (command-line name)
    @property string title() const { return to!string(c.title); } /// title of this option (single-line)
    @property string desc() const { return to!string(c.desc); }   /// description of this option (multi-line)
    @property SANE_Value_Type type() const { return c.type; }     /// how are values interpreted?
    @property SANE_Unit unit() const { return c.unit; } /// what is the (physical) unit?
    @property SANE_Int size() const { return c.size; }  ///
    @property SANE_Int cap() const { return c.cap; }    /// capabilities

    @property SANE_Constraint_Type constraintType() const { return c.constraint_type; }
+/
    auto table2 = new TextTable(["name","title","type","value","desc"]);
    table2.maxLineLength = columns;
    //table2.columnWrap([16,32,40]);
    foreach( od; scanner.optionDescriptors )
        table2.insertf("%s",od.name)("%s",od.title)("%s",od.type)("%s",od.toString())("%s",od.desc);
    table2.printByLines( line => writeln(line) );

    return 0;
}
