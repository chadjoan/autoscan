module libpng.png_struct;

import core.sys.posix.setjmp; // For jmp_buf.
import libpng.types;

// Cheating: We redefine png_struct to allow D's context to exist alongside
//   the png_ptr context.  This enables setjmp/longjmp to be wrapped into
//   exception handling and to retrieve the error messages when something
//   goes wrong.
// Used to wrap setjmp/longjmp and retrieve error messages, mostly.
struct png_struct
{
    c_png_struct* png_ptr;
    d_png_glue_struct d_context;
}

alias png_struct png_struct_def;
alias png_struct* png_structp;
//alias const png_struct  * png_const_structp;
alias png_structp png_const_structp;
alias png_struct** png_structpp;

struct d_png_glue_struct
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
    extern(C) void function(c_png_structp png_ptr, png_const_charp err_msg) secondary_error_fn;
    extern(C) void function(c_png_structp png_ptr, png_const_charp err_msg) secondary_warn_fn;
    void* caller_ptr;

    /* NOTE: Allocating the entire jmp_buf here resulted in strange stack
     * corruption on the author's system as soon as setjmp was called on it.
     * Stack allocating the jmp_buf and then storing a pointer to the stack
     * allocated jmp_buf in this field seems to have solved the issue.
     */
    jmp_buf*    d_jmp_buf_ptr;
}