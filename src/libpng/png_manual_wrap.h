
#ifndef PNG_NSJ_MANUAL_WRAP_INCLUDED
#define PNG_NSJ_MANUAL_WRAP_INCLUDED
#include <png.h>

d_png_structp png_nsj_create_read_struct(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn);

d_png_structp png_nsj_create_write_struct(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn);

d_png_structp png_nsj_create_read_struct_2(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn,
    png_voidp mem_ptr,
    png_malloc_ptr malloc_fn,
    png_free_ptr free_fn);

d_png_structp png_nsj_create_write_struct_2(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn,
    png_voidp mem_ptr,
    png_malloc_ptr malloc_fn,
    png_free_ptr free_fn);

/* Free any memory associated with the png_struct and the png_info_structs */
void png_nsj_destroy_read_struct(
    d_png_structpp png_ptr_ptr,
    png_infopp info_ptr_ptr,
    png_infopp end_info_ptr_ptr);

/* Free any memory associated with the png_struct and the png_info_structs */
void png_nsj_destroy_write_struct(
    d_png_structpp png_ptr_ptr,
    png_infopp info_ptr_ptr);

void png_nsj_set_error_fn(
    d_png_structp png_ptr,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warning_fn);

#endif
