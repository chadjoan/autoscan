module text_table;

import std.array;
import std.algorithm;
import std.string;
import std.range;
import std.conv;
import std.stdio;

class TextTable
{
    private string[]   headers;
    private size_t[]   sizes;
    private Appender!(string[][]) cells;

    public string columnSep = "|";
    public string headerSep = "-";
    public string cornerSep = "+";

    this(string[] headers)
    {
        assert(headers !is null);
        assert(headers.length > 0);
        this.headers = headers;
        sizes = new size_t[headers.length];
        sizes[] = 0;
        accumulateColumnSizes(headers);
        cells = appender!(string[][])();
    }

    private void accumulateColumnSizes(string[] contents)
    {
        foreach( i, column; contents )
            sizes[i] = max(sizes[i], column.length);
    }

    auto insertf(T...)(string fmtString, T columnVals)
    {
        struct TTFormattedInserter(size_t colNumber)
        {
            TextTable parent;
            string[] columns;

            auto opCall(U...)(string nextFmtString, U columnVals)
            {
                assert( colNumber < columns.length, "More row values provided than there are columns in the table.");
                columns[colNumber] = format(nextFmtString, columnVals);
                parent.sizes[colNumber] = max(parent.sizes[colNumber], columns[colNumber].length);

                TTFormattedInserter!(colNumber+1) t;
                t.parent = parent;
                t.columns = columns;
                return t;
            }
        }

        string[] newColumns = new string[headers.length];
        cells.put(newColumns);

        TTFormattedInserter!(0) t;
        t.parent = this;
        t.columns = newColumns;
        return t(fmtString,columnVals);
    }

    void insert(string[] row)
    {
        assert( row.length == headers.length,
            format("Attempt to insert a row with %s cells into a table with %s columns.",
                row.length, headers.length));

        accumulateColumnSizes(row);
        cells.put(row);
    }

    private string addPadding(string small, size_t desiredSize, string pad)
    {
        if ( small is null )
            small = "[null]";

        if ( small.length >= desiredSize )
            return pad ~ small;

        return pad ~ small ~ std.array.replicate(pad, desiredSize - small.length);
    }

    private string formatLine(string[] contents, string sep, string pad)
    {
        assert(contents !is null);
        assert(contents.length == headers.length);
        return zip(contents,sizes).map!(a => addPadding(a[0], a[1]+1, pad)).joiner(sep).array.to!string;
    }

    void printByLines( void delegate(string) linePrinter )
    {
        assert( linePrinter !is null );

        linePrinter(formatLine(headers, columnSep, " "));

        string[] headerSeparators = new string[headers.length];
        headerSeparators[] = "";
        linePrinter(formatLine(headerSeparators, cornerSep, headerSep));

        foreach( row; cells.data )
            linePrinter(formatLine(row, columnSep, " "));
    }
}