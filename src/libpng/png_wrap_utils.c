
#include <png.h>
#include <stdlib.h>
#include "png_wrap_utils.h"

const char *png_nsj_fn_not_defined_msg = "Attempt to call a function that was not compiled into this libpng.";

void png_nsj_set_missing_fn_err(d_png_glue_struct *d_context)
{
    d_context->error_msg = png_nsj_fn_not_defined_msg;
    d_context->error_type = PNG_NSJ_ERROR_MISSING_FN;
}

void png_nsj_clear_errors(d_png_glue_struct *d_context)
{
    d_context->error_msg = NULL;
    d_context->error_type = PNG_NSJ_ERROR_NONE;
}

void png_nsj_error_handler(png_structp png_ptr, png_const_charp err_msg)
{
    if ( png_ptr != NULL )
    {
        d_png_struct* d_png_ptr = png_get_error_ptr(png_ptr);

        if ( d_png_ptr != NULL )
        {
            d_png_glue_struct *d_context = &d_png_ptr->d_context;
            d_context->error_msg = err_msg;
            d_context->error_type = PNG_NSJ_ERROR_FATAL;

            if ( d_context->secondary_error_fn != NULL )
                d_context->secondary_error_fn(png_ptr, err_msg);

            longjmp(*d_context->d_jmp_buf_ptr,1);
        }
        else
        {
            png_error(NULL,err_msg);
            longjmp(png_jmpbuf(png_ptr),1);
        }
    }
    else
    {
        if ( err_msg != NULL )
            fprintf(stderr, "libpng error: %s\n", err_msg);
        else
            fprintf(stderr, "libpng error: fatal error with no message given.\n");

        exit(EXIT_FAILURE);
    }
}

void png_nsj_warn_handler(png_structp png_ptr, png_const_charp warn_msg)
{
    if ( png_ptr != NULL )
    {
        d_png_struct* d_png_ptr = png_get_error_ptr(png_ptr);

        if ( d_png_ptr != NULL && d_png_ptr->d_context.secondary_warn_fn != NULL )
            d_png_ptr->d_context.secondary_warn_fn(png_ptr,warn_msg);
        else
            png_warning(NULL,warn_msg); /* Force it to use the default warning method. */
    }
    else
    {
        /* How did we even get here? */
        /* Calling code in libpng needs a png_ptr to even know which handler */
        /*   to go to.  As such, we probably shouldn't call png_warn, because */
        /*   something strange is going on. */
        if ( warn_msg != NULL )
            fprintf(stderr, "libpng warning: %s\n", warn_msg);
        else
            fprintf(stderr, "libpng warning: warning with no message given.\n");
    }
}
