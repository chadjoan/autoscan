
module libpng.png_manual_wrap;

import libpng.png_struct;
import libpng.types;
import libpng.constants;
import libpng.generated.png_nsj;

/* Simple signature checking function.  This is the same as calling
 * png_check_sig(sig, n) := !png_sig_cmp(sig, 0, n).
 */
auto png_check_sig(png_const_bytep sig, png_size_t n)
{
    return !png_sig_cmp(sig, 0, n);
}

/* Two macros to return the first row and first column of the original,
 * full, image which appears in a given pass.  'pass' is in the range 0
 * to 6 and the result is in the range 0 to 7.
 */
auto PNG_PASS_START_ROW(T)(pass) { return ((1&~pass)<<(3-(pass>>1)))&7; }
auto PNG_PASS_START_COL(T)(pass) { return ((1& pass)<<(3-((pass+1)>>1)))&7; }


/* A macro to return the offset between pixels in the output row for a pair of
 * pixels in the input - effectively the inverse of the 'COL_SHIFT' macro that
 * follows.  Note that ROW_OFFSET is the offset from one row to the next whereas
 * COL_OFFSET is from one column to the next, within a row.
 */
auto PNG_PASS_ROW_OFFSET(T)(T pass) { return pass > 2 ?(8>>((pass-1)>>1)):8; }
auto PNG_PASS_COL_OFFSET(T)(T pass) { return 1<<((7-pass)>>1); }

/* Two macros to help evaluate the number of rows or columns in each
 * pass.  This is expressed as a shift - effectively log2 of the number or
 * rows or columns in each 8x8 tile of the original image.
 */
auto PNG_PASS_ROW_SHIFT(T)(T pass) { return pass > 2 ?(8-pass)>>1:3; }
auto PNG_PASS_COL_SHIFT(T)(T pass) { return pass > 1 ?(7-pass)>>1:3; }

/* Hence two macros to determine the number of rows or columns in a given
 * pass of an image given its height or width.  In fact these macros may
 * return non-zero even though the sub-image is empty, because the other
 * dimension may be empty for a small image.
 */
auto PNG_PASS_ROWS(U,V)(U height, V pass)
{
    return (height+(((1 << PNG_PASS_ROW_SHIFT(pass))-1)-PNG_PASS_START_ROW(pass)))
        >> PNG_PASS_ROW_SHIFT(pass);
}

auto PNG_PASS_COLS(U,V)(U width, V pass)
{
    return (width+(((1<<PNG_PASS_COL_SHIFT(pass))-1)-PNG_PASS_START_COL(pass)))
        >> PNG_PASS_COL_SHIFT(pass);
}

/* For the reader row callbacks (both progressive and sequential) it is
 * necessary to find the row in the output image given a row in an interlaced
 * image, so two more macros:
 */
auto PNG_ROW_FROM_PASS_ROW(U,V)(U yIn, V pass)
   { return ((yIn<<PNG_PASS_ROW_SHIFT(pass))+PNG_PASS_START_ROW(pass)); }
auto PNG_COL_FROM_PASS_COL(U,V)(U xIn, V pass)
   { return ((xIn<<PNG_PASS_COL_SHIFT(pass))+PNG_PASS_START_COL(pass)); }

/* Two macros which return a boolean (0 or 1) saying whether the given row
 * or column is in a particular pass.  These use a common utility macro that
 * returns a mask for a given pass - the offset 'off' selects the row or
 * column version.  The mask has the appropriate bit set for each column in
 * the tile.
 */
auto PNG_PASS_MASK(U,V)(U pass,V off)
{
    return
        ((0x110145AF>>(((7-off)-pass)<<2)) & 0xF) |
        ((0x01145AF0>>(((7-off)-pass)<<2)) & 0xF0);
}


auto PNG_ROW_IN_INTERLACE_PASS(U,V)(U y, V pass)
   { return (PNG_PASS_MASK(pass,0) >> (y&7)) & 1; }
auto PNG_COL_IN_INTERLACE_PASS(U,V)(U x, V pass)
   { return (PNG_PASS_MASK(pass,1) >> (x&7)) & 1; }


// #ifdef PNG_READ_COMPOSITE_NODIV_SUPPORTED
/* With these routines we avoid an integer divide, which will be slower on
 * most machines.  However, it does take more operations than the corresponding
 * divide method, so it may be slower on a few RISC systems.  There are two
 * shifts (by 8 or 16 bits) and an addition, versus a single integer divide.
 *
 * Note that the rounding factors are NOT supposed to be the same!  128 and
 * 32768 are correct for the NODIV code; 127 and 32767 are correct for the
 * standard method.
 *
 * [Optimized code by Greg Roelofs and Mark Adler...blame us for bugs. :-) ]
 */
// For D we have to pick one and use it always.

 /* fg and bg should be in `gamma 1.0' space; alpha is the opacity */
void png_composite(A,B,C,D)(out A composite, B fg, C alpha, D bg)
{
    png_uint_16 temp = cast(png_uint_16)(
             cast(png_uint_16)(fg)
           * cast(png_uint_16)(alpha)
           + cast(png_uint_16)(bg)*cast(png_uint_16)(255
           - cast(png_uint_16)(alpha)) + 128);
    composite = cast(png_byte)((temp + (temp >> 8)) >> 8);
}

void png_composite_16(A,B,C,D)(out A composite, B fg, C alpha, D bg)
{
    png_uint_32 temp = cast(png_uint_32)(
             cast(png_uint_32)(fg)
           * cast(png_uint_32)(alpha)
           + cast(png_uint_32)(bg)*(65535
           - cast(png_uint_32)(alpha)) + 32768);
    composite = cast(png_uint_16)((temp + (temp >> 16)) >> 16);
}

// #else  /* Standard method using integer division */
/+
#  define png_composite(composite, fg, alpha, bg)                          \
     (composite) = (png_byte)(((png_uint_16)(fg) * (png_uint_16)(alpha) +  \
     (png_uint_16)(bg) * (png_uint_16)(255 - (png_uint_16)(alpha)) +       \
     127) / 255)

#  define png_composite_16(composite, fg, alpha, bg)                         \
     (composite) = (png_uint_16)(((png_uint_32)(fg) * (png_uint_32)(alpha) + \
     (png_uint_32)(bg)*(png_uint_32)(65535 - (png_uint_32)(alpha)) +         \
     32767) / 65535)
+/
// #endif /* PNG_READ_COMPOSITE_NODIV_SUPPORTED */


// #ifdef PNG_USE_READ_MACROS
/+
// TODO: It might be optimal to tell the generator to nowrap the functions with
//   these names and then use the macro versions here to intercept the calls
//   in D.  This could remove layers of indirection and be more performant.
//   Not sure how correct it would be though.  It /seems/ alright.

/* Inline macros to do direct reads of bytes from the input buffer.
 * The png_get_int_32() routine assumes we are using two's complement
 * format for negative values, which is almost certainly true.
 */
#  define png_get_uint_32(buf) \
     (((png_uint_32)(*(buf)) << 24) + \
      ((png_uint_32)(*((buf) + 1)) << 16) + \
      ((png_uint_32)(*((buf) + 2)) << 8) + \
      ((png_uint_32)(*((buf) + 3))))

   /* From libpng-1.4.0 until 1.4.4, the png_get_uint_16 macro (but not the
    * function) incorrectly returned a value of type png_uint_32.
    */
#  define png_get_uint_16(buf) \
     ((png_uint_16) \
      (((unsigned int)(*(buf)) << 8) + \
       ((unsigned int)(*((buf) + 1)))))

#  define png_get_int_32(buf) \
     ((png_int_32)((*(buf) & 0x80) \
      ? -((png_int_32)((png_get_uint_32(buf) ^ 0xffffffffL) + 1)) \
      : (png_int_32)png_get_uint_32(buf)))
+/
// #endif


extern(C) png_structp png_nsj_create_read_struct(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn);

alias png_nsj_create_read_struct png_create_read_struct;

extern(C) png_structp png_nsj_create_write_struct(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn);

alias png_nsj_create_write_struct png_create_write_struct;

extern(C) png_structp png_nsj_create_read_struct_2(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn,
    png_voidp mem_ptr,
    png_malloc_ptr malloc_fn,
    png_free_ptr free_fn);

alias png_nsj_create_read_struct_2 png_create_read_struct_2;

extern(C) png_structp png_nsj_create_write_struct_2(
    png_const_charp user_png_ver,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warn_fn,
    png_voidp mem_ptr,
    png_malloc_ptr malloc_fn,
    png_free_ptr free_fn);

alias png_nsj_create_write_struct_2 png_create_write_struct_2;

/* Free any memory associated with the png_struct and the png_info_structs */
extern(C) void png_nsj_destroy_read_struct(
    png_structpp png_ptr_ptr,
    png_infopp info_ptr_ptr,
    png_infopp end_info_ptr_ptr);

alias png_nsj_destroy_read_struct png_destroy_read_struct;

/* Free any memory associated with the png_struct and the png_info_structs */
extern(C) void png_nsj_destroy_write_struct(
    png_structpp png_ptr_ptr,
    png_infopp info_ptr_ptr);

alias png_nsj_destroy_write_struct png_destroy_write_struct;

extern(C) void png_nsj_set_error_fn(
    png_structp png_ptr,
    png_voidp error_ptr,
    png_error_ptr error_fn,
    png_error_ptr warning_fn);

alias png_nsj_set_error_fn png_set_error_fn;


/+
// TODO: These need more thought.

#ifdef PNG_BENIGN_ERRORS_SUPPORTED
/* Benign error in libpng.  Can continue, but may have a problem.
 * User can choose whether to handle as a fatal error or as a warning. */
#  undef png_benign_error
PNG_EXPORT(107, void, png_benign_error, (png_structp png_ptr,
    png_const_charp warning_message));

/* Same, chunk name is prepended to message. */
#  undef png_chunk_benign_error
PNG_EXPORT(108, void, png_chunk_benign_error, (png_structp png_ptr,
    png_const_charp warning_message));

PNG_EXPORT(109, void, png_set_benign_errors,
    (png_structp png_ptr, int allowed));
#else
#  ifdef PNG_ALLOW_BENIGN_ERRORS
#    define png_benign_error png_warning
#    define png_chunk_benign_error png_chunk_warning
#  else
#    define png_benign_error png_error
#    define png_chunk_benign_error png_chunk_error
#  endif
#endif
+/