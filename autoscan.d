import sane;
import sane_test;
import sane_wrapper;

import text_table;

import std.stdio;

int main(string[] args)
{
    saneInit(null); // TODO: user auth.
    scope(exit) saneExit();

    auto devices = saneGetDevices(false);
    if ( devices.length == 0 )
    {
        writeln("No scanners detected.");
        return 1;
    }

    auto table = new TextTable(["name","vendor","model","type"]);
    foreach( device; devices )
        table.insertf("%s",device.name)("%s",device.vendor)("%s",device.model)("%s",device.type);
    //    table.insert([device.name, device.vendor, device.model, device.type]);
    table.printByLines( line => writeln(line) );

    return 0;
}
