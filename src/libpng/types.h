
#ifndef D_PNG_STRUCT_INCLUDED
#define D_PNG_STRUCT_INCLUDED

#include <png.h>

typedef struct libpngCallContextForD
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

    /* Is it safe to jump?
     * The caller should set this to 1 before setjmp'ing, and then to 0 after
     * the setjmp is no longer valid.  This safety measure can prevent
     * longjmp'ing to no-longer-existing stack frames.
     * Make this pointer-sized so that the layout is predictable for the D side.
     */
    size_t jump_ready;

    /* It is unwise to make any assumptions about the size of this member.
     * It might not agree on both sides of the language barrier.
     * This is fine as long as the C side allocates enough space for it and
     *   the D side never touches it.
     * This should also be the last member in the struct.
     * Anything placed after it may not be offset the same in both languages.
     */
    jmp_buf    d_jmp_buf;
} libpngCallContextForD;


typedef struct d_png_structp
{
    png_structp            png_ptr;
    libpngCallContextForD  *dCallContext;

} d_png_structp;

typedef struct d_png_const_structp
{
    png_const_structp      png_ptr;
    libpngCallContextForD  *dCallContext;

} d_png_const_structp;

//typedef libpngCallContextForD*            d_png_structp;
//typedef d_png_const_struct*               d_png_const_structp;
//typedef d_png_structp PNG_RESTRICT        d_png_structrp;
//typedef d_png_const_structp PNG_RESTRICT  d_png_const_structrp;
typedef d_png_structp        d_png_structrp;
typedef d_png_const_structp  d_png_const_structrp;

typedef d_png_structp* d_png_structpp;

#endif
