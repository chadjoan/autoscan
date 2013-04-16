
#ifndef PNG_WRAP_UTILS_INCLUDED
#define PNG_WRAP_UTILS_INCLUDED
#include <png.h>

#include "png_struct.h"

/* Set when no errors occur on the C side of things for libpng. */
#define PNG_NSJ_ERROR_NONE       0

/* All libpng errors that get handled by the warn_fn handler will become this. */
#define PNG_NSJ_ERROR_WARNING    1

/* All libpng errors that get handled by the error_fn handler will become this. */
#define PNG_NSJ_ERROR_FATAL      2

/* Issued when attempting to call functions not compiled in the hosting libpng library file. */
#define PNG_NSJ_ERROR_MISSING_FN 3

extern const char *png_nsj_fn_not_defined_msg;

void png_nsj_set_missing_fn_err(d_png_glue_struct *d_context);

void png_nsj_clear_errors(d_png_glue_struct *d_context);

void png_nsj_error_handler(png_structp png_ptr, png_const_charp err_msg);

void png_nsj_warn_handler(png_structp png_ptr, png_const_charp warn_msg);

#endif
