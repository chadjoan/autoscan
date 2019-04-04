module libpng.png_wrap_utils;

import std.conv;

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

extern(C) void png_nsj_set_missing_fn_err(libpngCallContextForD *dCallContext);

extern(C) void png_nsj_clear_errors(libpngCallContextForD *dCallContext);

extern(C) void png_nsj_error_handler(png_structp png_ptr, png_const_charp err_msg);

void png_nsj_check_errors( libpngCallContextForD *dCallContext )
{
    if ( dCallContext is null )
        return;

    // Clear this so that subsequent calls into libpng that don't propertly
    //   setjmp won't cause it to longjmp to the discarded stack frame.
    dCallContext.jump_ready = 0;

    switch( dCallContext.error_type )
    {
        case PNG_NSJ_ERROR_WARNING: break; // Is this even useful?
        case PNG_NSJ_ERROR_FATAL:
            throw new PngException(to!string(dCallContext.error_msg));
        case PNG_NSJ_ERROR_MISSING_FN:
            throw new PngFunctionNotImpl(to!string(dCallContext.error_msg));
        case PNG_NSJ_ERROR_NONE: break;
        default: assert(0);
    }
}
