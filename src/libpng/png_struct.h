
#ifndef D_PNG_STRUCT_INCLUDED
#define D_PNG_STRUCT_INCLUDED

typedef struct d_png_glue_struct
{
    const char *error_msg;

    /* Make this pointer-sized so that the layout is predictable for the D side. */
    /* See the PNG_NSJ_ERROR_* constants for possible values. */
    size_t     error_type;

    /* Overriding D's error handling in a controlled manner may be important
     * for anyone wanting to cross back into C territory with a png_ptr that
     * was declared D-side.  At that point, libpng's default jmp_buf will no
     * longer be usable for setjmp'ing, so the C code would need to define its
     * own error handler with its own jmp_buf before being able to use setjmp
     * with libpng in the traditional style.
     */
    void* caller_ptr;
    void (*secondary_error_fn)(png_structp png_ptr, png_const_charp err_msg);
    void (*secondary_warn_fn)(png_structp png_ptr, png_const_charp err_msg);

    /* NOTE: Allocating the entire jmp_buf here resulted in strange stack
     * corruption on the author's system as soon as setjmp was called on it.
     * Stack allocating the jmp_buf and then storing a pointer to the stack
     * allocated jmp_buf in this field seems to have solved the issue.
     */
    jmp_buf*    d_jmp_buf_ptr;
} d_png_glue_struct;


typedef struct d_png_struct
{
    png_structp png_ptr;
    d_png_glue_struct d_context;

} d_png_struct;

typedef d_png_struct* d_png_structp;

typedef d_png_struct** d_png_structpp;

#endif
