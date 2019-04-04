
#include <png.h>
#include <stdlib.h>
#include "png_wrap_utils.h"

const char *png_nsj_fn_not_defined_msg = "Attempt to call a function that was not compiled into this libpng.";

void png_nsj_set_missing_fn_err(libpngCallContextForD *dCallContext)
{
    dCallContext->error_msg = png_nsj_fn_not_defined_msg;
    dCallContext->error_type = PNG_NSJ_ERROR_MISSING_FN;
}

void png_nsj_clear_errors(libpngCallContextForD *dCallContext)
{
    dCallContext->error_msg = NULL;
    dCallContext->error_type = PNG_NSJ_ERROR_NONE;
}

static void png_nsj_err_and_exit(png_const_charp err_msg)
{
    if ( err_msg != NULL )
        fprintf(stderr, "libpng error: %s\n", err_msg);
    else
        fprintf(stderr, "libpng error: fatal error with no message given.\n");

    exit(EXIT_FAILURE);
}

void png_nsj_error_handler(png_structp png_ptr, png_const_charp err_msg)
{
    if ( png_ptr != NULL )
    {
        libpngCallContextForD* dCallContext = png_get_error_ptr(png_ptr);

        if ( dCallContext != NULL )
        {
            dCallContext->error_msg = err_msg;
            dCallContext->error_type = PNG_NSJ_ERROR_FATAL;

            if ( dCallContext->secondary_error_fn != NULL )
                dCallContext->secondary_error_fn(png_ptr, err_msg);

            if ( dCallContext->jump_ready )
                longjmp(dCallContext->d_jmp_buf,1);

            fprintf(stderr, "libpng error handler for D: Last entry to libpng didn't setjmp. Can't longjmp.\n");
            png_nsj_err_and_exit(err_msg);
        }
        else
        {
            png_error(NULL,err_msg);
            longjmp(png_jmpbuf(png_ptr),1);
        }
    }
    else
    {
        fprintf(stderr, "libpng error handler for D: png_ptr is NULL. Can't longjmp.\n");
        png_nsj_err_and_exit(err_msg);
    }
}

void png_nsj_warn_handler(png_structp png_ptr, png_const_charp warn_msg)
{
    if ( png_ptr != NULL )
    {
        libpngCallContextForD* dCallContext = png_get_error_ptr(png_ptr);

        if ( dCallContext != NULL && dCallContext->secondary_warn_fn != NULL )
            dCallContext->secondary_warn_fn(png_ptr,warn_msg);
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
