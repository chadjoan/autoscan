module libpng.png_wrap_utils;

import std.conv;

import libpng.png_struct;
import libpng.types;

enum
{
    /* Set when no errors occur on the C side of things for libpng. */
    PNG_NSJ_ERROR_NONE       = 0,

    /* All libpng errors that get handled by the warn_fn handler will become this. */
    PNG_NSJ_ERROR_WARNING    = 1,

    /* All libpng errors that get handled by the error_fn handler will become this. */
    PNG_NSJ_ERROR_FATAL      = 2,

    /* Issued when attempting to call functions not compiled in the hosting libpng library file. */
    PNG_NSJ_ERROR_MISSING_FN = 3,
}

extern extern(C) const(char*) png_nsj_fn_not_defined_msg;

extern(C) void png_nsj_set_missing_fn_err(d_png_glue_struct *d_context);

extern(C) void png_nsj_clear_errors(d_png_glue_struct *d_context);

extern(C) void png_nsj_error_handler(png_structp png_ptr, png_const_charp err_msg);

class PngException : Exception { this(string msg) { super(msg); } }
class PngFunctionNotImpl : Exception { this(string msg) { super(msg); } }

void png_nsj_check_errors( const d_png_glue_struct *d_context )
{
    if ( d_context is null )
        return;

    switch( d_context.error_type )
    {
        case PNG_NSJ_ERROR_WARNING: break; // Is this even useful?
        case PNG_NSJ_ERROR_FATAL:
            throw new PngException(to!string(d_context.error_msg));
        case PNG_NSJ_ERROR_MISSING_FN:
            throw new PngFunctionNotImpl(to!string(d_context.error_msg));
        case PNG_NSJ_ERROR_NONE: break;
        default: assert(0);
    }
}