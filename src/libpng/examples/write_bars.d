module libpng.examples.write_bars;

import libpng.png;

import std.string;
import std.stdio : writefln;

import core.sys.posix.stdio; // For FILE* and related funcs.
import etc.c.zlib; // Z_BEST_COMPRESSION

enum outputFile = "color_bars.png";
alias uint Pixel;

void generateScaleRow(Pixel[] data, Pixel mask, int width)
{
    assert(width == 512);
    Pixel incr = 0x01010101;
    Pixel current;

    // black -> color
    current = 0;
    for ( int x = 0; x < 256; x++ )
    {
        data[x] = current & mask;
        current += incr;
    }

    // color -> white
    current = mask;
    for ( int x = 256; x < 512; x++ )
    {
        data[x] = current | mask;
        current += incr & ~mask;
    }
}

void generateScaleBar(Pixel[] data, Pixel mask, int width, int height)
{
    int i = 0;
    for ( int y = 0; y < height; y++ )
    {
        generateScaleRow(data[i..i+width], mask, width);
        i += width;
    }
}

Pixel[] generateImage(out int width, out int height)
{
    width = 512;
    height = 128*3;

    Pixel[] result = new Pixel[width*height];

    generateScaleBar(result[0*128*width..1*128*width], 0x00FF0000, width, 128);
    generateScaleBar(result[1*128*width..2*128*width], 0x0000FF00, width, 128);
    generateScaleBar(result[2*128*width..3*128*width], 0x000000FF, width, 128);

    return result;
}

void main()
{
    int width;
    int height;
    Pixel[] data = generateImage(width,height);

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
    FILE *fp = fopen(outputFile, "wb");
    if (!fp)
        throw new Exception(format("Couldn't open file %s for writing.",outputFile));
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

    // The image we generated is 32bpp RGB+filler, but we are writing 24bpp RGB.
    // We can use png_set_filler to tell libpng to drop the filler byte as
    //   it writes out to the file.
    // Which byte the filler occupies depends on the endianness of the machine.
    // We can test this easily enough with some pointer twiddling.
    Pixel p = 0x00_00_00_01;
    if ( (cast(ubyte*)&p)[0] == 0x01 )
        // Low byte is left byte (before). Padding is after.
        png_set_filler(png_ptr, 0, PNG_FILLER_AFTER);
    else
        // Low byte is right byte (after).  Padding is before.
        png_set_filler(png_ptr, 0, PNG_FILLER_BEFORE);

    // Write the pixel data into the png.
    // We'll do this one row at a time so that we don't have to allocate an
    //   array of pointers to the beginning of every row.
    for ( int i = 0; i < width*height; i += width )
        png_write_row(png_ptr, cast(ubyte*)(data.ptr + i));

    // Call png_write_end when done with pixel data.
    // The second parameter could be another info struct with more chunks.
    // In this case we have no more chunks, so passing it null is sufficient.
    png_write_end(png_ptr, null);

    // We're done.  All of the cleanup and deallocation will be handled by
    //   the scope statements we used earlier.
    writefln("Wrote %s", outputFile);
}


