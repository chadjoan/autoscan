
#include <png.h>
#include <string.h>

#include "png_wrap_utils.h"

/* These two are for use by the allocator to bail out memory if the dCallContext */
/*   wasn't able to allocate.  It is unconcerned with png_info structures */
/*   because those will exist later, when the caller makes them. */
static void d_png_destroy_read(png_structpp png_ptr)
{
    png_destroy_read_struct(png_ptr,NULL,NULL);
}

static void d_png_destroy_write(png_structpp png_ptr)
{
    png_destroy_write_struct(png_ptr,NULL);
}

static d_png_structp png_nsj_create_d_context(
    png_structp            png_ptr,
    png_voidp              error_ptr,
    png_error_ptr          error_fn,
    png_error_ptr          warn_fn,
    void (*destroy_fn)(png_structpp png_ptr))
{
    d_png_structp d_png_ptr;
    memset(&d_png_ptr, 0, sizeof(d_png_structp));

    if ( png_ptr == NULL )
        return d_png_ptr;

    libpngCallContextForD *dCallContext = png_malloc(png_ptr, sizeof(libpngCallContextForD));
    if ( dCallContext == NULL )
    {
        destroy_fn(&png_ptr);
        return d_png_ptr;
    }
    memset(dCallContext, 0, sizeof(libpngCallContextForD));

    d_png_ptr.png_ptr      = png_ptr;
    d_png_ptr.dCallContext = dCallContext;

    png_set_error_fn(png_ptr, dCallContext, &png_nsj_error_handler, &png_nsj_warn_handler);

    if ( error_ptr != NULL )
        d_png_ptr.dCallContext->caller_ptr = error_ptr;
    if ( error_fn != NULL )
        d_png_ptr.dCallContext->secondary_error_fn = error_fn;
    if ( warn_fn != NULL )
        d_png_ptr.dCallContext->secondary_warn_fn = warn_fn;

    return d_png_ptr;
}

d_png_structp png_nsj_create_read_struct(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn)
{
    png_structp png_ptr = png_create_read_struct
        (user_png_ver, NULL,
         &png_nsj_error_handler, &png_nsj_warn_handler);

    return png_nsj_create_d_context(png_ptr, error_ptr, error_fn, warn_fn, &d_png_destroy_read);
}

d_png_structp png_nsj_create_write_struct(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn)
{
    png_structp png_ptr = png_create_write_struct
        (user_png_ver, NULL,
         &png_nsj_error_handler, &png_nsj_warn_handler);

    return png_nsj_create_d_context(png_ptr, error_ptr, error_fn, warn_fn, &d_png_destroy_write);
}

d_png_structp png_nsj_create_read_struct_2(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn,
    png_voidp mem_ptr,
    png_malloc_ptr malloc_fn,
    png_free_ptr free_fn)
{
    png_structp png_ptr = png_create_read_struct_2
        (user_png_ver, error_ptr,
         &png_nsj_error_handler, &png_nsj_warn_handler,
         mem_ptr, malloc_fn, free_fn);

    return png_nsj_create_d_context(png_ptr, error_ptr, error_fn, warn_fn, &d_png_destroy_read);
}

d_png_structp png_nsj_create_write_struct_2(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn,
    png_voidp mem_ptr,
    png_malloc_ptr malloc_fn,
    png_free_ptr free_fn)
{
    png_structp png_ptr = png_create_write_struct_2
        (user_png_ver, error_ptr,
         &png_nsj_error_handler, &png_nsj_warn_handler,
         mem_ptr, malloc_fn, free_fn);

    return png_nsj_create_d_context(png_ptr, error_ptr, error_fn, warn_fn, &d_png_destroy_write);
}


/* Free any memory associated with the png_struct and the png_info_structs */
void png_nsj_destroy_read_struct(
    d_png_structpp png_ptr_ptr,
    png_infopp info_ptr_ptr,
    png_infopp end_info_ptr_ptr)
{
    png_structp png_ptr = png_ptr_ptr->png_ptr;
    png_free(png_ptr, png_ptr_ptr->dCallContext);
    memset(png_ptr_ptr, 0, sizeof(*png_ptr_ptr));
    png_destroy_read_struct(&png_ptr, info_ptr_ptr, end_info_ptr_ptr);
}

/* Free any memory associated with the png_struct and the png_info_structs */
void png_nsj_destroy_write_struct(
    d_png_structpp png_ptr_ptr,
    png_infopp info_ptr_ptr)
{
    png_structp png_ptr = png_ptr_ptr->png_ptr;
    png_free(png_ptr, png_ptr_ptr->dCallContext);
    memset(png_ptr_ptr, 0, sizeof(*png_ptr_ptr));
    png_destroy_write_struct(&png_ptr, info_ptr_ptr);
}

void png_nsj_set_error_fn(
    d_png_structp png_ptr,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warning_fn)
{
    png_ptr.dCallContext->caller_ptr = error_ptr;
    png_ptr.dCallContext->secondary_error_fn = error_fn;
    png_ptr.dCallContext->secondary_warn_fn = warning_fn;
}
