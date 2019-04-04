module libpng.types;

import core.sys.posix.setjmp; // For jmp_buf.
public import libpng.png_types;

class PngException : Exception { this(string msg) { super(msg); } }
class PngFunctionNotImpl : Exception { this(string msg) { super(msg); } }

/// Cheating: We redefine png_structp to allow D's context to exist alongside
///   the png_ptr context.  This enables setjmp/longjmp to be wrapped into
///   exception handling and to retrieve the error messages when something
///   goes wrong.
/// The D call context is used when wrapping setjmp/longjmp and to retrieve
///   error messages, mostly.
/// The 'png_struct' definition itself is notably absent. The libpng API
///   would not allow the caller to stack-allocate or introspect such a thing
///   anyways, it would have just been a symbol. Given that it would be a pain
///   to manage the value-semantics of a faux png_struct (ex: if the dCallContext
///   were allocated in-place such that declaring a png_struct would allocate
///   space for it), this opportunity to shoot oneself in the foot has been
///   denied. Copying png_structp structs around should be perfectly safe.
/// Implementation note: this is known as d_png_structp on the C-side of the
///   wrapper.
struct png_structp
{
    c_png_struct*           png_ptr;
    libpngCallContextForD*  dCallContext;

    @property png_const_structp toConst()
    {
        // As of this writing (dmd 2.085.0, 2019-04-04) it is necessary to
        // reinterpret the 'this' object in its pointer form instead of
        // directly, because a direct cast somehow causes this .toConst()
        // function to call itself repeatedly ad infinitum until the program
        // segfaults/crashes. I'm not sure why it does that or why this
        // workaround works, but transiting through pointer-ness does seem to
        // remove the danger.
        return *(cast(png_const_structp*)(&this));
    }

    alias toConst this;
}

struct png_const_structp
{
    const c_png_struct*     png_ptr;
    libpngCallContextForD*  dCallContext;

    alias png_ptr this;
}

alias png_structp        png_structrp;
alias png_const_structp  png_const_structrp;
alias png_structp*       png_structpp; // TODO: This... should probably go the other way around, but that might mean defining another png_structp-like thing.  Ugh.

struct libpngCallContextForD
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

    /* Is it safe to jump?
     * The caller should set this to 1 before setjmp'ing, and then to 0 after
     * the setjmp is no longer valid.  This safety measure can prevent
     * longjmp'ing to no-longer-existing stack frames.
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
}
