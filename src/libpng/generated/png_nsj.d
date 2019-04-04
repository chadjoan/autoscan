module libpng.generated.png_nsj;
import core.stdc.time;
import core.stdc.stdio;
import libpng.types;
import libpng.png_wrap_utils;
private import libpng.png_types;

// Definitions of constants derived from pnglibconf.h:
/* pnglibconf.h - library build configuration */

/* libpng version 1.6.35, July 15, 2018 */

/* Copyright (c) 1998-2017 Glenn Randers-Pehrson */

/* This code is released under the libpng license. */
/* For conditions of distribution and use, see the disclaimer */
/* and license in png.h */

/* pnglibconf.h */
/* Machine generated file: DO NOT EDIT */
/* Derived from: scripts/pnglibconf.dfa */

/* options */
enum PNG_16BIT_SUPPORTED = 1;
enum PNG_ALIGNED_MEMORY_SUPPORTED = 1;
/*#undef PNG_ARM_NEON_API_SUPPORTED*/
/*#undef PNG_ARM_NEON_CHECK_SUPPORTED*/
enum PNG_BENIGN_ERRORS_SUPPORTED = 1;
enum PNG_BENIGN_READ_ERRORS_SUPPORTED = 1;
/*#undef PNG_BENIGN_WRITE_ERRORS_SUPPORTED*/
enum PNG_BUILD_GRAYSCALE_PALETTE_SUPPORTED = 1;
enum PNG_CHECK_FOR_INVALID_INDEX_SUPPORTED = 1;
enum PNG_COLORSPACE_SUPPORTED = 1;
enum PNG_CONSOLE_IO_SUPPORTED = 1;
enum PNG_CONVERT_tIME_SUPPORTED = 1;
enum PNG_EASY_ACCESS_SUPPORTED = 1;
/*#undef PNG_ERROR_NUMBERS_SUPPORTED*/
enum PNG_ERROR_TEXT_SUPPORTED = 1;
enum PNG_FIXED_POINT_SUPPORTED = 1;
enum PNG_FLOATING_ARITHMETIC_SUPPORTED = 1;
enum PNG_FLOATING_POINT_SUPPORTED = 1;
enum PNG_FORMAT_AFIRST_SUPPORTED = 1;
enum PNG_FORMAT_BGR_SUPPORTED = 1;
enum PNG_GAMMA_SUPPORTED = 1;
enum PNG_GET_PALETTE_MAX_SUPPORTED = 1;
enum PNG_HANDLE_AS_UNKNOWN_SUPPORTED = 1;
enum PNG_INCH_CONVERSIONS_SUPPORTED = 1;
enum PNG_INFO_IMAGE_SUPPORTED = 1;
enum PNG_IO_STATE_SUPPORTED = 1;
enum PNG_MNG_FEATURES_SUPPORTED = 1;
enum PNG_POINTER_INDEXING_SUPPORTED = 1;
/*#undef PNG_POWERPC_VSX_API_SUPPORTED*/
/*#undef PNG_POWERPC_VSX_CHECK_SUPPORTED*/
enum PNG_PROGRESSIVE_READ_SUPPORTED = 1;
enum PNG_READ_16BIT_SUPPORTED = 1;
enum PNG_READ_ALPHA_MODE_SUPPORTED = 1;
enum PNG_READ_ANCILLARY_CHUNKS_SUPPORTED = 1;
enum PNG_READ_BACKGROUND_SUPPORTED = 1;
enum PNG_READ_BGR_SUPPORTED = 1;
enum PNG_READ_CHECK_FOR_INVALID_INDEX_SUPPORTED = 1;
enum PNG_READ_COMPOSITE_NODIV_SUPPORTED = 1;
enum PNG_READ_COMPRESSED_TEXT_SUPPORTED = 1;
enum PNG_READ_EXPAND_16_SUPPORTED = 1;
enum PNG_READ_EXPAND_SUPPORTED = 1;
enum PNG_READ_FILLER_SUPPORTED = 1;
enum PNG_READ_GAMMA_SUPPORTED = 1;
enum PNG_READ_GET_PALETTE_MAX_SUPPORTED = 1;
enum PNG_READ_GRAY_TO_RGB_SUPPORTED = 1;
enum PNG_READ_INTERLACING_SUPPORTED = 1;
enum PNG_READ_INT_FUNCTIONS_SUPPORTED = 1;
enum PNG_READ_INVERT_ALPHA_SUPPORTED = 1;
enum PNG_READ_INVERT_SUPPORTED = 1;
enum PNG_READ_OPT_PLTE_SUPPORTED = 1;
enum PNG_READ_PACKSWAP_SUPPORTED = 1;
enum PNG_READ_PACK_SUPPORTED = 1;
enum PNG_READ_QUANTIZE_SUPPORTED = 1;
enum PNG_READ_RGB_TO_GRAY_SUPPORTED = 1;
enum PNG_READ_SCALE_16_TO_8_SUPPORTED = 1;
enum PNG_READ_SHIFT_SUPPORTED = 1;
enum PNG_READ_STRIP_16_TO_8_SUPPORTED = 1;
enum PNG_READ_STRIP_ALPHA_SUPPORTED = 1;
enum PNG_READ_SUPPORTED = 1;
enum PNG_READ_SWAP_ALPHA_SUPPORTED = 1;
enum PNG_READ_SWAP_SUPPORTED = 1;
enum PNG_READ_TEXT_SUPPORTED = 1;
enum PNG_READ_TRANSFORMS_SUPPORTED = 1;
enum PNG_READ_UNKNOWN_CHUNKS_SUPPORTED = 1;
enum PNG_READ_USER_CHUNKS_SUPPORTED = 1;
enum PNG_READ_USER_TRANSFORM_SUPPORTED = 1;
enum PNG_READ_bKGD_SUPPORTED = 1;
enum PNG_READ_cHRM_SUPPORTED = 1;
enum PNG_READ_eXIf_SUPPORTED = 1;
enum PNG_READ_gAMA_SUPPORTED = 1;
enum PNG_READ_hIST_SUPPORTED = 1;
enum PNG_READ_iCCP_SUPPORTED = 1;
enum PNG_READ_iTXt_SUPPORTED = 1;
enum PNG_READ_oFFs_SUPPORTED = 1;
enum PNG_READ_pCAL_SUPPORTED = 1;
enum PNG_READ_pHYs_SUPPORTED = 1;
enum PNG_READ_sBIT_SUPPORTED = 1;
enum PNG_READ_sCAL_SUPPORTED = 1;
enum PNG_READ_sPLT_SUPPORTED = 1;
enum PNG_READ_sRGB_SUPPORTED = 1;
enum PNG_READ_tEXt_SUPPORTED = 1;
enum PNG_READ_tIME_SUPPORTED = 1;
enum PNG_READ_tRNS_SUPPORTED = 1;
enum PNG_READ_zTXt_SUPPORTED = 1;
enum PNG_SAVE_INT_32_SUPPORTED = 1;
enum PNG_SAVE_UNKNOWN_CHUNKS_SUPPORTED = 1;
enum PNG_SEQUENTIAL_READ_SUPPORTED = 1;
enum PNG_SETJMP_SUPPORTED = 1;
enum PNG_SET_OPTION_SUPPORTED = 1;
enum PNG_SET_UNKNOWN_CHUNKS_SUPPORTED = 1;
enum PNG_SET_USER_LIMITS_SUPPORTED = 1;
enum PNG_SIMPLIFIED_READ_AFIRST_SUPPORTED = 1;
enum PNG_SIMPLIFIED_READ_BGR_SUPPORTED = 1;
enum PNG_SIMPLIFIED_READ_SUPPORTED = 1;
enum PNG_SIMPLIFIED_WRITE_AFIRST_SUPPORTED = 1;
enum PNG_SIMPLIFIED_WRITE_BGR_SUPPORTED = 1;
enum PNG_SIMPLIFIED_WRITE_STDIO_SUPPORTED = 1;
enum PNG_SIMPLIFIED_WRITE_SUPPORTED = 1;
enum PNG_STDIO_SUPPORTED = 1;
enum PNG_STORE_UNKNOWN_CHUNKS_SUPPORTED = 1;
enum PNG_TEXT_SUPPORTED = 1;
enum PNG_TIME_RFC1123_SUPPORTED = 1;
enum PNG_UNKNOWN_CHUNKS_SUPPORTED = 1;
enum PNG_USER_CHUNKS_SUPPORTED = 1;
enum PNG_USER_LIMITS_SUPPORTED = 1;
enum PNG_USER_MEM_SUPPORTED = 1;
enum PNG_USER_TRANSFORM_INFO_SUPPORTED = 1;
enum PNG_USER_TRANSFORM_PTR_SUPPORTED = 1;
enum PNG_WARNINGS_SUPPORTED = 1;
enum PNG_WRITE_16BIT_SUPPORTED = 1;
enum PNG_WRITE_ANCILLARY_CHUNKS_SUPPORTED = 1;
enum PNG_WRITE_BGR_SUPPORTED = 1;
enum PNG_WRITE_CHECK_FOR_INVALID_INDEX_SUPPORTED = 1;
enum PNG_WRITE_COMPRESSED_TEXT_SUPPORTED = 1;
enum PNG_WRITE_CUSTOMIZE_COMPRESSION_SUPPORTED = 1;
enum PNG_WRITE_CUSTOMIZE_ZTXT_COMPRESSION_SUPPORTED = 1;
enum PNG_WRITE_FILLER_SUPPORTED = 1;
enum PNG_WRITE_FILTER_SUPPORTED = 1;
enum PNG_WRITE_FLUSH_SUPPORTED = 1;
enum PNG_WRITE_GET_PALETTE_MAX_SUPPORTED = 1;
enum PNG_WRITE_INTERLACING_SUPPORTED = 1;
enum PNG_WRITE_INT_FUNCTIONS_SUPPORTED = 1;
enum PNG_WRITE_INVERT_ALPHA_SUPPORTED = 1;
enum PNG_WRITE_INVERT_SUPPORTED = 1;
enum PNG_WRITE_OPTIMIZE_CMF_SUPPORTED = 1;
enum PNG_WRITE_PACKSWAP_SUPPORTED = 1;
enum PNG_WRITE_PACK_SUPPORTED = 1;
enum PNG_WRITE_SHIFT_SUPPORTED = 1;
enum PNG_WRITE_SUPPORTED = 1;
enum PNG_WRITE_SWAP_ALPHA_SUPPORTED = 1;
enum PNG_WRITE_SWAP_SUPPORTED = 1;
enum PNG_WRITE_TEXT_SUPPORTED = 1;
enum PNG_WRITE_TRANSFORMS_SUPPORTED = 1;
enum PNG_WRITE_UNKNOWN_CHUNKS_SUPPORTED = 1;
enum PNG_WRITE_USER_TRANSFORM_SUPPORTED = 1;
enum PNG_WRITE_WEIGHTED_FILTER_SUPPORTED = 1;
enum PNG_WRITE_bKGD_SUPPORTED = 1;
enum PNG_WRITE_cHRM_SUPPORTED = 1;
enum PNG_WRITE_eXIf_SUPPORTED = 1;
enum PNG_WRITE_gAMA_SUPPORTED = 1;
enum PNG_WRITE_hIST_SUPPORTED = 1;
enum PNG_WRITE_iCCP_SUPPORTED = 1;
enum PNG_WRITE_iTXt_SUPPORTED = 1;
enum PNG_WRITE_oFFs_SUPPORTED = 1;
enum PNG_WRITE_pCAL_SUPPORTED = 1;
enum PNG_WRITE_pHYs_SUPPORTED = 1;
enum PNG_WRITE_sBIT_SUPPORTED = 1;
enum PNG_WRITE_sCAL_SUPPORTED = 1;
enum PNG_WRITE_sPLT_SUPPORTED = 1;
enum PNG_WRITE_sRGB_SUPPORTED = 1;
enum PNG_WRITE_tEXt_SUPPORTED = 1;
enum PNG_WRITE_tIME_SUPPORTED = 1;
enum PNG_WRITE_tRNS_SUPPORTED = 1;
enum PNG_WRITE_zTXt_SUPPORTED = 1;
enum PNG_bKGD_SUPPORTED = 1;
enum PNG_cHRM_SUPPORTED = 1;
enum PNG_eXIf_SUPPORTED = 1;
enum PNG_gAMA_SUPPORTED = 1;
enum PNG_hIST_SUPPORTED = 1;
enum PNG_iCCP_SUPPORTED = 1;
enum PNG_iTXt_SUPPORTED = 1;
enum PNG_oFFs_SUPPORTED = 1;
enum PNG_pCAL_SUPPORTED = 1;
enum PNG_pHYs_SUPPORTED = 1;
enum PNG_sBIT_SUPPORTED = 1;
enum PNG_sCAL_SUPPORTED = 1;
enum PNG_sPLT_SUPPORTED = 1;
enum PNG_sRGB_SUPPORTED = 1;
enum PNG_tEXt_SUPPORTED = 1;
enum PNG_tIME_SUPPORTED = 1;
enum PNG_tRNS_SUPPORTED = 1;
enum PNG_zTXt_SUPPORTED = 1;
/* end of options */
/* settings */
enum PNG_API_RULE = 0;
enum PNG_ARM_NEON_OPT = 0;
enum PNG_DEFAULT_READ_MACROS = 1;
enum PNG_GAMMA_THRESHOLD_FIXED = 5000;
enum PNG_INFLATE_BUF_SIZE = 1024;
enum PNG_MAX_GAMMA_8 = 11;
enum PNG_QUANTIZE_BLUE_BITS = 5;
enum PNG_QUANTIZE_GREEN_BITS = 5;
enum PNG_QUANTIZE_RED_BITS = 5;
enum PNG_TEXT_Z_DEFAULT_COMPRESSION = -1;
enum PNG_TEXT_Z_DEFAULT_STRATEGY = 0;
enum PNG_USER_CHUNK_CACHE_MAX = 1000;
enum PNG_USER_CHUNK_MALLOC_MAX = 8000000;
enum PNG_USER_HEIGHT_MAX = 1000000;
enum PNG_USER_WIDTH_MAX = 1000000;
enum PNG_ZBUF_SIZE = 8192;
enum PNG_ZLIB_VERNUM = 0x12b0;
enum PNG_Z_DEFAULT_COMPRESSION = -1;
enum PNG_Z_DEFAULT_NOFILTER_STRATEGY = 0;
enum PNG_Z_DEFAULT_STRATEGY = 1;
enum PNG_sCAL_PRECISION = 5;
enum PNG_sRGB_PROFILE_CHECKS = 2;
/* end of settings */

// Definitions of constants derived from png.h:
enum PNG_LIBPNG_VER_SONUM   = 16;
enum PNG_LIBPNG_VER_DLLNUM  = 16;
enum PNG_LIBPNG_VER_MAJOR   = 1;
enum PNG_LIBPNG_VER_MINOR   = 6;
enum PNG_LIBPNG_VER_RELEASE = 35;
enum PNG_LIBPNG_VER_BUILD  = 02;
enum PNG_LIBPNG_BUILD_ALPHA    = 1;
enum PNG_LIBPNG_BUILD_BETA     = 2;
enum PNG_LIBPNG_BUILD_RC       = 3;
enum PNG_LIBPNG_BUILD_STABLE   = 4;
enum PNG_LIBPNG_BUILD_RELEASE_STATUS_MASK = 7;
enum PNG_LIBPNG_BUILD_PATCH    = 8;
enum PNG_LIBPNG_BUILD_PRIVATE = 16;
enum PNG_LIBPNG_BUILD_SPECIAL = 32;
enum PNG_LIBPNG_BUILD_BASE_TYPE = PNG_LIBPNG_BUILD_BETA;
enum PNG_LIBPNG_VER = 10635;
enum PNG_LIBPNG_BUILD_TYPE = PNG_LIBPNG_BUILD_BASE_TYPE;
enum PNG_DISPOSE_OP_NONE        = 0x00;
enum PNG_DISPOSE_OP_BACKGROUND  = 0x01;
enum PNG_DISPOSE_OP_PREVIOUS    = 0x02;
enum PNG_BLEND_OP_SOURCE        = 0x00;
enum PNG_BLEND_OP_OVER          = 0x01;
enum PNG_TEXT_COMPRESSION_NONE_WR = -3;
enum PNG_TEXT_COMPRESSION_zTXt_WR = -2;
enum PNG_TEXT_COMPRESSION_NONE    = -1;
enum PNG_TEXT_COMPRESSION_zTXt     = 0;
enum PNG_ITXT_COMPRESSION_NONE     = 1;
enum PNG_ITXT_COMPRESSION_zTXt     = 2;
enum PNG_TEXT_COMPRESSION_LAST     = 3;
enum PNG_HAVE_IHDR  = 0x01;
enum PNG_HAVE_PLTE  = 0x02;
enum PNG_AFTER_IDAT = 0x08;
enum PNG_FP_1    = 100000;
enum PNG_FP_HALF  = 50000;
enum PNG_COLOR_MASK_PALETTE    = 1;
enum PNG_COLOR_MASK_COLOR      = 2;
enum PNG_COLOR_MASK_ALPHA      = 4;
enum PNG_COLOR_TYPE_GRAY = 0;
enum PNG_COLOR_TYPE_RGB        = PNG_COLOR_MASK_COLOR;
enum PNG_COLOR_TYPE_GRAY_ALPHA = PNG_COLOR_MASK_ALPHA;
enum PNG_COLOR_TYPE_GA  = PNG_COLOR_TYPE_GRAY_ALPHA;
enum PNG_COMPRESSION_TYPE_BASE = 0;
enum PNG_COMPRESSION_TYPE_DEFAULT = PNG_COMPRESSION_TYPE_BASE;
enum PNG_FILTER_TYPE_BASE      = 0;
enum PNG_INTRAPIXEL_DIFFERENCING = 64;
enum PNG_FILTER_TYPE_DEFAULT   = PNG_FILTER_TYPE_BASE;
enum PNG_INTERLACE_NONE        = 0;
enum PNG_INTERLACE_ADAM7       = 1;
enum PNG_INTERLACE_LAST        = 2;
enum PNG_OFFSET_PIXEL          = 0;
enum PNG_OFFSET_MICROMETER     = 1;
enum PNG_OFFSET_LAST           = 2;
enum PNG_EQUATION_LINEAR       = 0;
enum PNG_EQUATION_BASE_E       = 1;
enum PNG_EQUATION_ARBITRARY    = 2;
enum PNG_EQUATION_HYPERBOLIC   = 3;
enum PNG_EQUATION_LAST         = 4;
enum PNG_SCALE_UNKNOWN         = 0;
enum PNG_SCALE_METER           = 1;
enum PNG_SCALE_RADIAN          = 2;
enum PNG_SCALE_LAST            = 3;
enum PNG_RESOLUTION_UNKNOWN    = 0;
enum PNG_RESOLUTION_METER      = 1;
enum PNG_RESOLUTION_LAST       = 2;
enum PNG_sRGB_INTENT_PERCEPTUAL = 0;
enum PNG_sRGB_INTENT_RELATIVE   = 1;
enum PNG_sRGB_INTENT_SATURATION = 2;
enum PNG_sRGB_INTENT_ABSOLUTE   = 3;
enum PNG_sRGB_INTENT_LAST       = 4;
enum PNG_KEYWORD_MAX_LENGTH     = 79;
enum PNG_MAX_PALETTE_LENGTH    = 256;
enum PNG_TRANSFORM_IDENTITY       = 0x0000;
enum PNG_TRANSFORM_STRIP_16       = 0x0001;
enum PNG_TRANSFORM_STRIP_ALPHA    = 0x0002;
enum PNG_TRANSFORM_PACKING        = 0x0004;
enum PNG_TRANSFORM_PACKSWAP       = 0x0008;
enum PNG_TRANSFORM_EXPAND         = 0x0010;
enum PNG_TRANSFORM_INVERT_MONO    = 0x0020;
enum PNG_TRANSFORM_SHIFT          = 0x0040;
enum PNG_TRANSFORM_BGR            = 0x0080;
enum PNG_TRANSFORM_SWAP_ALPHA     = 0x0100;
enum PNG_TRANSFORM_SWAP_ENDIAN    = 0x0200;
enum PNG_TRANSFORM_INVERT_ALPHA   = 0x0400;
enum PNG_TRANSFORM_STRIP_FILLER   = 0x0800;
enum PNG_TRANSFORM_STRIP_FILLER_BEFORE = PNG_TRANSFORM_STRIP_FILLER;
enum PNG_TRANSFORM_STRIP_FILLER_AFTER = 0x1000;
enum PNG_TRANSFORM_GRAY_TO_RGB   = 0x2000;
enum PNG_TRANSFORM_EXPAND_16     = 0x4000;
enum PNG_TRANSFORM_SCALE_16      = 0x8000;
enum PNG_FLAG_MNG_EMPTY_PLTE     = 0x01;
enum PNG_FLAG_MNG_FILTER_64      = 0x04;
enum PNG_ALL_MNG_FEATURES        = 0x05;
enum PNG_ERROR_ACTION_NONE  = 1;
enum PNG_ERROR_ACTION_WARN  = 2;
enum PNG_ERROR_ACTION_ERROR = 3;
enum PNG_RGB_TO_GRAY_DEFAULT = -1;
enum PNG_ALPHA_PNG           = 0;
enum PNG_ALPHA_STANDARD      = 1;
enum PNG_ALPHA_ASSOCIATED    = 1;
enum PNG_ALPHA_PREMULTIPLIED = 1;
enum PNG_ALPHA_OPTIMIZED     = 2;
enum PNG_ALPHA_BROKEN        = 3;
enum PNG_DEFAULT_sRGB = -1;
enum PNG_GAMMA_MAC_18 = -2;
enum PNG_GAMMA_sRGB   = 220000;
enum PNG_GAMMA_LINEAR = PNG_FP_1;
enum PNG_FILLER_BEFORE = 0;
enum PNG_FILLER_AFTER = 1;
enum PNG_BACKGROUND_GAMMA_UNKNOWN = 0;
enum PNG_BACKGROUND_GAMMA_SCREEN  = 1;
enum PNG_BACKGROUND_GAMMA_FILE    = 2;
enum PNG_BACKGROUND_GAMMA_UNIQUE  = 3;
enum PNG_CRC_DEFAULT       = 0;
enum PNG_CRC_ERROR_QUIT    = 1;
enum PNG_CRC_WARN_DISCARD  = 2;
enum PNG_CRC_WARN_USE      = 3;
enum PNG_CRC_QUIET_USE     = 4;
enum PNG_CRC_NO_CHANGE     = 5;
enum PNG_NO_FILTERS     = 0x00;
enum PNG_FILTER_NONE    = 0x08;
enum PNG_FILTER_SUB     = 0x10;
enum PNG_FILTER_UP      = 0x20;
enum PNG_FILTER_AVG     = 0x40;
enum PNG_FILTER_PAETH   = 0x80;
enum PNG_FILTER_VALUE_NONE  = 0;
enum PNG_FILTER_VALUE_SUB   = 1;
enum PNG_FILTER_VALUE_UP    = 2;
enum PNG_FILTER_VALUE_AVG   = 3;
enum PNG_FILTER_VALUE_PAETH = 4;
enum PNG_FILTER_VALUE_LAST  = 5;
enum PNG_FILTER_HEURISTIC_DEFAULT    = 0;
enum PNG_FILTER_HEURISTIC_UNWEIGHTED = 1;
enum PNG_FILTER_HEURISTIC_WEIGHTED   = 2;
enum PNG_FILTER_HEURISTIC_LAST       = 3;
enum PNG_DESTROY_WILL_FREE_DATA = 1;
enum PNG_SET_WILL_FREE_DATA = 1;
enum PNG_USER_WILL_FREE_DATA = 2;
enum PNG_HANDLE_CHUNK_AS_DEFAULT   = 0;
enum PNG_HANDLE_CHUNK_NEVER        = 1;
enum PNG_HANDLE_CHUNK_IF_SAFE      = 2;
enum PNG_HANDLE_CHUNK_ALWAYS       = 3;
enum PNG_HANDLE_CHUNK_LAST         = 4;
enum PNG_IO_NONE        = 0x0000;
enum PNG_IO_READING     = 0x0001;
enum PNG_IO_WRITING     = 0x0002;
enum PNG_IO_SIGNATURE   = 0x0010;
enum PNG_IO_CHUNK_HDR   = 0x0020;
enum PNG_IO_CHUNK_DATA  = 0x0040;
enum PNG_IO_CHUNK_CRC   = 0x0080;
enum PNG_IO_MASK_OP     = 0x000f;
enum PNG_IO_MASK_LOC    = 0x00f0;
enum PNG_INTERLACE_ADAM7_PASSES = 7;
enum PNG_IMAGE_VERSION = 1;
enum PNG_IMAGE_WARNING = 1;
enum PNG_IMAGE_ERROR = 2;
enum PNG_FORMAT_GRAY = 0;
enum PNG_IMAGE_FLAG_COLORSPACE_NOT_sRGB = 0x01;
enum PNG_IMAGE_FLAG_FAST = 0x02;
enum PNG_IMAGE_FLAG_16BIT_sRGB = 0x04;
enum PNG_ARM_NEON   = 0;
enum PNG_MAXIMUM_INFLATE_WINDOW = 2;
enum PNG_SKIP_sRGB_CHECK_PROFILE = 4;
enum PNG_MIPS_MSA   = 6;
enum PNG_IGNORE_ADLER32 = 8;
enum PNG_POWERPC_VSX   = 10;
enum PNG_OPTION_NEXT  = 12;
enum PNG_OPTION_UNSET   = 0;
enum PNG_OPTION_INVALID = 1;
enum PNG_OPTION_OFF     = 2;
enum PNG_OPTION_ON      = 3;
enum PNG_LIBPNG_VER_STRING = "1.6.35+apng";
enum PNG_HEADER_VERSION_STRING 
     = " libpng version 1.6.35+apng - July 15, 2018\n";

// Generated wrapper functions:

 

extern(C)  png_uint_32 png_access_version_number();

extern(C)  void png_nsj_set_sig_bytes(png_structrp png_ptr, int num_bytes);
 void png_set_sig_bytes(png_structrp png_ptr, int num_bytes)
{
    png_nsj_set_sig_bytes(png_ptr, num_bytes);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  int png_sig_cmp(png_const_bytep sig, size_t start,
    size_t num_to_check);

extern(C)  size_t png_nsj_get_compression_buffer_size(png_const_structrp png_ptr);
 size_t png_get_compression_buffer_size(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_compression_buffer_size(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_compression_buffer_size(png_structrp png_ptr, size_t size);
 void png_set_compression_buffer_size(png_structrp png_ptr, size_t size)
{
    png_nsj_set_compression_buffer_size(png_ptr, size);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C) deprecated int png_nsj_reset_zstream(png_structrp png_ptr);
deprecated int png_reset_zstream(png_structrp png_ptr)
{
    auto result = png_nsj_reset_zstream(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_write_sig(png_structrp png_ptr);
 void png_write_sig(png_structrp png_ptr)
{
    png_nsj_write_sig(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_chunk(png_structrp png_ptr, png_const_bytep chunk_name, png_const_bytep data, size_t length);
 void png_write_chunk(png_structrp png_ptr, png_const_bytep chunk_name, png_const_bytep data, size_t length)
{
    png_nsj_write_chunk(png_ptr, chunk_name, data, length);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_chunk_start(png_structrp png_ptr, png_const_bytep chunk_name, png_uint_32 length);
 void png_write_chunk_start(png_structrp png_ptr, png_const_bytep chunk_name, png_uint_32 length)
{
    png_nsj_write_chunk_start(png_ptr, chunk_name, length);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_chunk_data(png_structrp png_ptr, png_const_bytep data, size_t length);
 void png_write_chunk_data(png_structrp png_ptr, png_const_bytep data, size_t length)
{
    png_nsj_write_chunk_data(png_ptr, data, length);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_chunk_end(png_structrp png_ptr);
 void png_write_chunk_end(png_structrp png_ptr)
{
    png_nsj_write_chunk_end(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_infop png_nsj_create_info_struct(png_const_structrp png_ptr);
 png_infop png_create_info_struct(png_const_structrp png_ptr)
{
    auto result = png_nsj_create_info_struct(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C) deprecated void png_info_init_3(png_infopp info_ptr,
    size_t png_info_struct_size);

extern(C)  void png_nsj_write_info_before_PLTE(png_structrp png_ptr, png_const_inforp info_ptr);
 void png_write_info_before_PLTE(png_structrp png_ptr, png_const_inforp info_ptr)
{
    png_nsj_write_info_before_PLTE(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_info(png_structrp png_ptr, png_const_inforp info_ptr);
 void png_write_info(png_structrp png_ptr, png_const_inforp info_ptr)
{
    png_nsj_write_info(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_read_info(png_structrp png_ptr, png_inforp info_ptr);
 void png_read_info(png_structrp png_ptr, png_inforp info_ptr)
{
    png_nsj_read_info(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

   

extern(C) deprecated png_const_charp png_nsj_convert_to_rfc1123(png_structrp png_ptr, png_const_timep ptime);
deprecated png_const_charp png_convert_to_rfc1123(png_structrp png_ptr, png_const_timep ptime)
{
    auto result = png_nsj_convert_to_rfc1123(png_ptr, ptime);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  int png_nsj_convert_to_rfc1123_buffer(libpngCallContextForD* dCallContext, char* _out, png_const_timep ptime);
 int png_convert_to_rfc1123_buffer(char* _out, png_const_timep ptime)
{
    libpngCallContextForD dCallContext;
    auto result = png_nsj_convert_to_rfc1123_buffer(&dCallContext, _out, ptime);
    png_nsj_check_errors(&dCallContext);
    return result;
}

extern(C)  void png_nsj_convert_from_struct_tm(libpngCallContextForD* dCallContext, png_timep ptime, tm * ttime);
 void png_convert_from_struct_tm(png_timep ptime, tm * ttime)
{
    libpngCallContextForD dCallContext;
    png_nsj_convert_from_struct_tm(&dCallContext, ptime, ttime);
    png_nsj_check_errors(&dCallContext);
    return;
}

extern(C)  void png_nsj_convert_from_time_t(libpngCallContextForD* dCallContext, png_timep ptime, time_t ttime);
 void png_convert_from_time_t(png_timep ptime, time_t ttime)
{
    libpngCallContextForD dCallContext;
    png_nsj_convert_from_time_t(&dCallContext, ptime, ttime);
    png_nsj_check_errors(&dCallContext);
    return;
}

extern(C)  void png_nsj_set_expand(png_structrp png_ptr);
 void png_set_expand(png_structrp png_ptr)
{
    png_nsj_set_expand(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_expand_gray_1_2_4_to_8(png_structrp png_ptr);
 void png_set_expand_gray_1_2_4_to_8(png_structrp png_ptr)
{
    png_nsj_set_expand_gray_1_2_4_to_8(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_palette_to_rgb(png_structrp png_ptr);
 void png_set_palette_to_rgb(png_structrp png_ptr)
{
    png_nsj_set_palette_to_rgb(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_tRNS_to_alpha(png_structrp png_ptr);
 void png_set_tRNS_to_alpha(png_structrp png_ptr)
{
    png_nsj_set_tRNS_to_alpha(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_expand_16(png_structrp png_ptr);
 void png_set_expand_16(png_structrp png_ptr)
{
    png_nsj_set_expand_16(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_bgr(png_structrp png_ptr);
 void png_set_bgr(png_structrp png_ptr)
{
    png_nsj_set_bgr(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_gray_to_rgb(png_structrp png_ptr);
 void png_set_gray_to_rgb(png_structrp png_ptr)
{
    png_nsj_set_gray_to_rgb(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_rgb_to_gray(png_structrp png_ptr, int error_action, double red, double green);
 void png_set_rgb_to_gray(png_structrp png_ptr, int error_action, double red, double green)
{
    png_nsj_set_rgb_to_gray(png_ptr, error_action, red, green);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_rgb_to_gray_fixed(png_structrp png_ptr, int error_action, png_fixed_point red, png_fixed_point green);
 void png_set_rgb_to_gray_fixed(png_structrp png_ptr, int error_action, png_fixed_point red, png_fixed_point green)
{
    png_nsj_set_rgb_to_gray_fixed(png_ptr, error_action, red, green);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_byte png_nsj_get_rgb_to_gray_status(png_const_structrp png_ptr);
 png_byte png_get_rgb_to_gray_status(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_rgb_to_gray_status(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_build_grayscale_palette(libpngCallContextForD* dCallContext, int bit_depth, png_colorp palette);
 void png_build_grayscale_palette(int bit_depth, png_colorp palette)
{
    libpngCallContextForD dCallContext;
    png_nsj_build_grayscale_palette(&dCallContext, bit_depth, palette);
    png_nsj_check_errors(&dCallContext);
    return;
}

extern(C)  void png_nsj_set_alpha_mode(png_structrp png_ptr, int mode, double output_gamma);
 void png_set_alpha_mode(png_structrp png_ptr, int mode, double output_gamma)
{
    png_nsj_set_alpha_mode(png_ptr, mode, output_gamma);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_alpha_mode_fixed(png_structrp png_ptr, int mode, png_fixed_point output_gamma);
 void png_set_alpha_mode_fixed(png_structrp png_ptr, int mode, png_fixed_point output_gamma)
{
    png_nsj_set_alpha_mode_fixed(png_ptr, mode, output_gamma);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_strip_alpha(png_structrp png_ptr);
 void png_set_strip_alpha(png_structrp png_ptr)
{
    png_nsj_set_strip_alpha(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_swap_alpha(png_structrp png_ptr);
 void png_set_swap_alpha(png_structrp png_ptr)
{
    png_nsj_set_swap_alpha(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_invert_alpha(png_structrp png_ptr);
 void png_set_invert_alpha(png_structrp png_ptr)
{
    png_nsj_set_invert_alpha(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_filler(png_structrp png_ptr, png_uint_32 filler, int flags);
 void png_set_filler(png_structrp png_ptr, png_uint_32 filler, int flags)
{
    png_nsj_set_filler(png_ptr, filler, flags);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_add_alpha(png_structrp png_ptr, png_uint_32 filler, int flags);
 void png_set_add_alpha(png_structrp png_ptr, png_uint_32 filler, int flags)
{
    png_nsj_set_add_alpha(png_ptr, filler, flags);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_swap(png_structrp png_ptr);
 void png_set_swap(png_structrp png_ptr)
{
    png_nsj_set_swap(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_packing(png_structrp png_ptr);
 void png_set_packing(png_structrp png_ptr)
{
    png_nsj_set_packing(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_packswap(png_structrp png_ptr);
 void png_set_packswap(png_structrp png_ptr)
{
    png_nsj_set_packswap(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_shift(png_structrp png_ptr, png_const_color_8p true_bits);
 void png_set_shift(png_structrp png_ptr, png_const_color_8p true_bits)
{
    png_nsj_set_shift(png_ptr, true_bits);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  int png_nsj_set_interlace_handling(png_structrp png_ptr);
 int png_set_interlace_handling(png_structrp png_ptr)
{
    auto result = png_nsj_set_interlace_handling(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_invert_mono(png_structrp png_ptr);
 void png_set_invert_mono(png_structrp png_ptr)
{
    png_nsj_set_invert_mono(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_background(png_structrp png_ptr, png_const_color_16p background_color, int background_gamma_code, int need_expand, double background_gamma);
 void png_set_background(png_structrp png_ptr, png_const_color_16p background_color, int background_gamma_code, int need_expand, double background_gamma)
{
    png_nsj_set_background(png_ptr, background_color, background_gamma_code, need_expand, background_gamma);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_background_fixed(png_structrp png_ptr, png_const_color_16p background_color, int background_gamma_code, int need_expand, png_fixed_point background_gamma);
 void png_set_background_fixed(png_structrp png_ptr, png_const_color_16p background_color, int background_gamma_code, int need_expand, png_fixed_point background_gamma)
{
    png_nsj_set_background_fixed(png_ptr, background_color, background_gamma_code, need_expand, background_gamma);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_scale_16(png_structrp png_ptr);
 void png_set_scale_16(png_structrp png_ptr)
{
    png_nsj_set_scale_16(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_strip_16(png_structrp png_ptr);
 void png_set_strip_16(png_structrp png_ptr)
{
    png_nsj_set_strip_16(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_quantize(png_structrp png_ptr, png_colorp palette, int num_palette, int maximum_colors, png_const_uint_16p histogram, int full_quantize);
 void png_set_quantize(png_structrp png_ptr, png_colorp palette, int num_palette, int maximum_colors, png_const_uint_16p histogram, int full_quantize)
{
    png_nsj_set_quantize(png_ptr, palette, num_palette, maximum_colors, histogram, full_quantize);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_gamma(png_structrp png_ptr, double screen_gamma, double override_file_gamma);
 void png_set_gamma(png_structrp png_ptr, double screen_gamma, double override_file_gamma)
{
    png_nsj_set_gamma(png_ptr, screen_gamma, override_file_gamma);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_gamma_fixed(png_structrp png_ptr, png_fixed_point screen_gamma, png_fixed_point override_file_gamma);
 void png_set_gamma_fixed(png_structrp png_ptr, png_fixed_point screen_gamma, png_fixed_point override_file_gamma)
{
    png_nsj_set_gamma_fixed(png_ptr, screen_gamma, override_file_gamma);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_flush(png_structrp png_ptr, int nrows);
 void png_set_flush(png_structrp png_ptr, int nrows)
{
    png_nsj_set_flush(png_ptr, nrows);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_flush(png_structrp png_ptr);
 void png_write_flush(png_structrp png_ptr)
{
    png_nsj_write_flush(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_start_read_image(png_structrp png_ptr);
 void png_start_read_image(png_structrp png_ptr)
{
    png_nsj_start_read_image(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_read_update_info(png_structrp png_ptr, png_inforp info_ptr);
 void png_read_update_info(png_structrp png_ptr, png_inforp info_ptr)
{
    png_nsj_read_update_info(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_read_rows(png_structrp png_ptr, png_bytepp row, png_bytepp display_row, png_uint_32 num_rows);
 void png_read_rows(png_structrp png_ptr, png_bytepp row, png_bytepp display_row, png_uint_32 num_rows)
{
    png_nsj_read_rows(png_ptr, row, display_row, num_rows);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_read_row(png_structrp png_ptr, png_bytep row, png_bytep display_row);
 void png_read_row(png_structrp png_ptr, png_bytep row, png_bytep display_row)
{
    png_nsj_read_row(png_ptr, row, display_row);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_read_image(png_structrp png_ptr, png_bytepp image);
 void png_read_image(png_structrp png_ptr, png_bytepp image)
{
    png_nsj_read_image(png_ptr, image);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_row(png_structrp png_ptr, png_const_bytep row);
 void png_write_row(png_structrp png_ptr, png_const_bytep row)
{
    png_nsj_write_row(png_ptr, row);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_rows(png_structrp png_ptr, png_bytepp row, png_uint_32 num_rows);
 void png_write_rows(png_structrp png_ptr, png_bytepp row, png_uint_32 num_rows)
{
    png_nsj_write_rows(png_ptr, row, num_rows);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_image(png_structrp png_ptr, png_bytepp image);
 void png_write_image(png_structrp png_ptr, png_bytepp image)
{
    png_nsj_write_image(png_ptr, image);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_end(png_structrp png_ptr, png_inforp info_ptr);
 void png_write_end(png_structrp png_ptr, png_inforp info_ptr)
{
    png_nsj_write_end(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_read_end(png_structrp png_ptr, png_inforp info_ptr);
 void png_read_end(png_structrp png_ptr, png_inforp info_ptr)
{
    png_nsj_read_end(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_destroy_info_struct(png_const_structrp png_ptr, png_infopp info_ptr_ptr);
 void png_destroy_info_struct(png_const_structrp png_ptr, png_infopp info_ptr_ptr)
{
    png_nsj_destroy_info_struct(png_ptr, info_ptr_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_crc_action(png_structrp png_ptr, int crit_action, int ancil_action);
 void png_set_crc_action(png_structrp png_ptr, int crit_action, int ancil_action)
{
    png_nsj_set_crc_action(png_ptr, crit_action, ancil_action);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_filter(png_structrp png_ptr, int method, int filters);
 void png_set_filter(png_structrp png_ptr, int method, int filters)
{
    png_nsj_set_filter(png_ptr, method, filters);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_filter_heuristics(png_structrp png_ptr, int heuristic_method, int num_weights, png_const_doublep filter_weights, png_const_doublep filter_costs);
 void png_set_filter_heuristics(png_structrp png_ptr, int heuristic_method, int num_weights, png_const_doublep filter_weights, png_const_doublep filter_costs)
{
    png_nsj_set_filter_heuristics(png_ptr, heuristic_method, num_weights, filter_weights, filter_costs);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_filter_heuristics_fixed(png_structrp png_ptr, int heuristic_method, int num_weights, png_const_fixed_point_p filter_weights, png_const_fixed_point_p filter_costs);
 void png_set_filter_heuristics_fixed(png_structrp png_ptr, int heuristic_method, int num_weights, png_const_fixed_point_p filter_weights, png_const_fixed_point_p filter_costs)
{
    png_nsj_set_filter_heuristics_fixed(png_ptr, heuristic_method, num_weights, filter_weights, filter_costs);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_compression_level(png_structrp png_ptr, int level);
 void png_set_compression_level(png_structrp png_ptr, int level)
{
    png_nsj_set_compression_level(png_ptr, level);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_compression_mem_level(png_structrp png_ptr, int mem_level);
 void png_set_compression_mem_level(png_structrp png_ptr, int mem_level)
{
    png_nsj_set_compression_mem_level(png_ptr, mem_level);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_compression_strategy(png_structrp png_ptr, int strategy);
 void png_set_compression_strategy(png_structrp png_ptr, int strategy)
{
    png_nsj_set_compression_strategy(png_ptr, strategy);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_compression_window_bits(png_structrp png_ptr, int window_bits);
 void png_set_compression_window_bits(png_structrp png_ptr, int window_bits)
{
    png_nsj_set_compression_window_bits(png_ptr, window_bits);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_compression_method(png_structrp png_ptr, int method);
 void png_set_compression_method(png_structrp png_ptr, int method)
{
    png_nsj_set_compression_method(png_ptr, method);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_text_compression_level(png_structrp png_ptr, int level);
 void png_set_text_compression_level(png_structrp png_ptr, int level)
{
    png_nsj_set_text_compression_level(png_ptr, level);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_text_compression_mem_level(png_structrp png_ptr, int mem_level);
 void png_set_text_compression_mem_level(png_structrp png_ptr, int mem_level)
{
    png_nsj_set_text_compression_mem_level(png_ptr, mem_level);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_text_compression_strategy(png_structrp png_ptr, int strategy);
 void png_set_text_compression_strategy(png_structrp png_ptr, int strategy)
{
    png_nsj_set_text_compression_strategy(png_ptr, strategy);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_text_compression_window_bits(png_structrp png_ptr, int window_bits);
 void png_set_text_compression_window_bits(png_structrp png_ptr, int window_bits)
{
    png_nsj_set_text_compression_window_bits(png_ptr, window_bits);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_text_compression_method(png_structrp png_ptr, int method);
 void png_set_text_compression_method(png_structrp png_ptr, int method)
{
    png_nsj_set_text_compression_method(png_ptr, method);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_init_io(png_structrp png_ptr, png_FILE_p fp);
 void png_init_io(png_structrp png_ptr, png_FILE_p fp)
{
    png_nsj_init_io(png_ptr, fp);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_voidp png_nsj_get_error_ptr(png_const_structrp png_ptr);
 png_voidp png_get_error_ptr(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_error_ptr(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_write_fn(png_structrp png_ptr, png_voidp io_ptr, png_rw_ptr write_data_fn, png_flush_ptr output_flush_fn);
 void png_set_write_fn(png_structrp png_ptr, png_voidp io_ptr, png_rw_ptr write_data_fn, png_flush_ptr output_flush_fn)
{
    png_nsj_set_write_fn(png_ptr, io_ptr, write_data_fn, output_flush_fn);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_read_fn(png_structrp png_ptr, png_voidp io_ptr, png_rw_ptr read_data_fn);
 void png_set_read_fn(png_structrp png_ptr, png_voidp io_ptr, png_rw_ptr read_data_fn)
{
    png_nsj_set_read_fn(png_ptr, io_ptr, read_data_fn);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_voidp png_nsj_get_io_ptr(png_const_structrp png_ptr);
 png_voidp png_get_io_ptr(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_io_ptr(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_read_status_fn(png_structrp png_ptr, png_read_status_ptr read_row_fn);
 void png_set_read_status_fn(png_structrp png_ptr, png_read_status_ptr read_row_fn)
{
    png_nsj_set_read_status_fn(png_ptr, read_row_fn);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_write_status_fn(png_structrp png_ptr, png_write_status_ptr write_row_fn);
 void png_set_write_status_fn(png_structrp png_ptr, png_write_status_ptr write_row_fn)
{
    png_nsj_set_write_status_fn(png_ptr, write_row_fn);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_mem_fn(png_structrp png_ptr, png_voidp mem_ptr, png_malloc_ptr malloc_fn, png_free_ptr free_fn);
 void png_set_mem_fn(png_structrp png_ptr, png_voidp mem_ptr, png_malloc_ptr malloc_fn, png_free_ptr free_fn)
{
    png_nsj_set_mem_fn(png_ptr, mem_ptr, malloc_fn, free_fn);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_voidp png_nsj_get_mem_ptr(png_const_structrp png_ptr);
 png_voidp png_get_mem_ptr(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_mem_ptr(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_read_user_transform_fn(png_structrp png_ptr, png_user_transform_ptr read_user_transform_fn);
 void png_set_read_user_transform_fn(png_structrp png_ptr, png_user_transform_ptr read_user_transform_fn)
{
    png_nsj_set_read_user_transform_fn(png_ptr, read_user_transform_fn);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_write_user_transform_fn(png_structrp png_ptr, png_user_transform_ptr write_user_transform_fn);
 void png_set_write_user_transform_fn(png_structrp png_ptr, png_user_transform_ptr write_user_transform_fn)
{
    png_nsj_set_write_user_transform_fn(png_ptr, write_user_transform_fn);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_user_transform_info(png_structrp png_ptr, png_voidp user_transform_ptr, int user_transform_depth, int user_transform_channels);
 void png_set_user_transform_info(png_structrp png_ptr, png_voidp user_transform_ptr, int user_transform_depth, int user_transform_channels)
{
    png_nsj_set_user_transform_info(png_ptr, user_transform_ptr, user_transform_depth, user_transform_channels);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_voidp png_nsj_get_user_transform_ptr(png_const_structrp png_ptr);
 png_voidp png_get_user_transform_ptr(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_user_transform_ptr(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_current_row_number(png_const_structrp png_ptr);
 png_uint_32 png_get_current_row_number(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_current_row_number(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_byte png_nsj_get_current_pass_number(png_const_structrp png_ptr);
 png_byte png_get_current_pass_number(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_current_pass_number(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_read_user_chunk_fn(png_structrp png_ptr, png_voidp user_chunk_ptr, png_user_chunk_ptr read_user_chunk_fn);
 void png_set_read_user_chunk_fn(png_structrp png_ptr, png_voidp user_chunk_ptr, png_user_chunk_ptr read_user_chunk_fn)
{
    png_nsj_set_read_user_chunk_fn(png_ptr, user_chunk_ptr, read_user_chunk_fn);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_voidp png_nsj_get_user_chunk_ptr(png_const_structrp png_ptr);
 png_voidp png_get_user_chunk_ptr(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_user_chunk_ptr(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_progressive_read_fn(png_structrp png_ptr, png_voidp progressive_ptr, png_progressive_info_ptr info_fn, png_progressive_row_ptr row_fn, png_progressive_end_ptr end_fn);
 void png_set_progressive_read_fn(png_structrp png_ptr, png_voidp progressive_ptr, png_progressive_info_ptr info_fn, png_progressive_row_ptr row_fn, png_progressive_end_ptr end_fn)
{
    png_nsj_set_progressive_read_fn(png_ptr, progressive_ptr, info_fn, row_fn, end_fn);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_voidp png_nsj_get_progressive_ptr(png_const_structrp png_ptr);
 png_voidp png_get_progressive_ptr(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_progressive_ptr(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_process_data(png_structrp png_ptr, png_inforp info_ptr, png_bytep buffer, size_t buffer_size);
 void png_process_data(png_structrp png_ptr, png_inforp info_ptr, png_bytep buffer, size_t buffer_size)
{
    png_nsj_process_data(png_ptr, info_ptr, buffer, buffer_size);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  size_t png_nsj_process_data_pause(png_structrp png_ptr, int save);
 size_t png_process_data_pause(png_structrp png_ptr, int save)
{
    auto result = png_nsj_process_data_pause(png_ptr, save);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_process_data_skip(png_structrp png_ptr);
 png_uint_32 png_process_data_skip(png_structrp png_ptr)
{
    auto result = png_nsj_process_data_skip(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_progressive_combine_row(png_const_structrp png_ptr, png_bytep old_row, png_const_bytep new_row);
 void png_progressive_combine_row(png_const_structrp png_ptr, png_bytep old_row, png_const_bytep new_row)
{
    png_nsj_progressive_combine_row(png_ptr, old_row, new_row);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_voidp png_nsj_malloc(png_const_structrp png_ptr, png_alloc_size_t size);
 png_voidp png_malloc(png_const_structrp png_ptr, png_alloc_size_t size)
{
    auto result = png_nsj_malloc(png_ptr, size);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_voidp png_nsj_calloc(png_const_structrp png_ptr, png_alloc_size_t size);
 png_voidp png_calloc(png_const_structrp png_ptr, png_alloc_size_t size)
{
    auto result = png_nsj_calloc(png_ptr, size);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_voidp png_nsj_malloc_warn(png_const_structrp png_ptr, png_alloc_size_t size);
 png_voidp png_malloc_warn(png_const_structrp png_ptr, png_alloc_size_t size)
{
    auto result = png_nsj_malloc_warn(png_ptr, size);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_free(png_const_structrp png_ptr, png_voidp ptr);
 void png_free(png_const_structrp png_ptr, png_voidp ptr)
{
    png_nsj_free(png_ptr, ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_free_data(png_const_structrp png_ptr, png_inforp info_ptr, png_uint_32 free_me, int num);
 void png_free_data(png_const_structrp png_ptr, png_inforp info_ptr, png_uint_32 free_me, int num)
{
    png_nsj_free_data(png_ptr, info_ptr, free_me, num);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_data_freer(png_const_structrp png_ptr, png_inforp info_ptr, int freer, png_uint_32 mask);
 void png_data_freer(png_const_structrp png_ptr, png_inforp info_ptr, int freer, png_uint_32 mask)
{
    png_nsj_data_freer(png_ptr, info_ptr, freer, mask);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C) deprecated png_voidp png_nsj_malloc_default(png_const_structrp png_ptr, png_alloc_size_t size);
deprecated png_voidp png_malloc_default(png_const_structrp png_ptr, png_alloc_size_t size)
{
    auto result = png_nsj_malloc_default(png_ptr, size);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C) deprecated void png_nsj_free_default(png_const_structrp png_ptr, png_voidp ptr);
deprecated void png_free_default(png_const_structrp png_ptr, png_voidp ptr)
{
    png_nsj_free_default(png_ptr, ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_error(png_const_structrp png_ptr, png_const_charp error_message);
 void png_error(png_const_structrp png_ptr, png_const_charp error_message)
{
    png_nsj_error(png_ptr, error_message);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_chunk_error(png_const_structrp png_ptr, png_const_charp error_message);
 void png_chunk_error(png_const_structrp png_ptr, png_const_charp error_message)
{
    png_nsj_chunk_error(png_ptr, error_message);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_err(png_const_structrp png_ptr);
 void png_err(png_const_structrp png_ptr)
{
    png_nsj_err(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_warning(png_const_structrp png_ptr, png_const_charp warning_message);
 void png_warning(png_const_structrp png_ptr, png_const_charp warning_message)
{
    png_nsj_warning(png_ptr, warning_message);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_chunk_warning(png_const_structrp png_ptr, png_const_charp warning_message);
 void png_chunk_warning(png_const_structrp png_ptr, png_const_charp warning_message)
{
    png_nsj_chunk_warning(png_ptr, warning_message);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_valid(png_const_structrp png_ptr, png_const_inforp info_ptr, png_uint_32 flag);
 png_uint_32 png_get_valid(png_const_structrp png_ptr, png_const_inforp info_ptr, png_uint_32 flag)
{
    auto result = png_nsj_get_valid(png_ptr, info_ptr, flag);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  size_t png_nsj_get_rowbytes(png_const_structrp png_ptr, png_const_inforp info_ptr);
 size_t png_get_rowbytes(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_rowbytes(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_bytepp png_nsj_get_rows(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_bytepp png_get_rows(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_rows(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_rows(png_const_structrp png_ptr, png_inforp info_ptr, png_bytepp row_pointers);
 void png_set_rows(png_const_structrp png_ptr, png_inforp info_ptr, png_bytepp row_pointers)
{
    png_nsj_set_rows(png_ptr, info_ptr, row_pointers);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_byte png_nsj_get_channels(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_byte png_get_channels(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_channels(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_image_width(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_uint_32 png_get_image_width(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_image_width(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_image_height(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_uint_32 png_get_image_height(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_image_height(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_byte png_nsj_get_bit_depth(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_byte png_get_bit_depth(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_bit_depth(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_byte png_nsj_get_color_type(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_byte png_get_color_type(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_color_type(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_byte png_nsj_get_filter_type(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_byte png_get_filter_type(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_filter_type(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_byte png_nsj_get_interlace_type(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_byte png_get_interlace_type(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_interlace_type(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_byte png_nsj_get_compression_type(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_byte png_get_compression_type(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_compression_type(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_pixels_per_meter(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_uint_32 png_get_pixels_per_meter(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_pixels_per_meter(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_x_pixels_per_meter(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_uint_32 png_get_x_pixels_per_meter(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_x_pixels_per_meter(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_y_pixels_per_meter(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_uint_32 png_get_y_pixels_per_meter(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_y_pixels_per_meter(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  float png_nsj_get_pixel_aspect_ratio(png_const_structrp png_ptr, png_const_inforp info_ptr);
 float png_get_pixel_aspect_ratio(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_pixel_aspect_ratio(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_fixed_point png_nsj_get_pixel_aspect_ratio_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_fixed_point png_get_pixel_aspect_ratio_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_pixel_aspect_ratio_fixed(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_int_32 png_nsj_get_x_offset_pixels(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_int_32 png_get_x_offset_pixels(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_x_offset_pixels(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_int_32 png_nsj_get_y_offset_pixels(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_int_32 png_get_y_offset_pixels(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_y_offset_pixels(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_int_32 png_nsj_get_x_offset_microns(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_int_32 png_get_x_offset_microns(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_x_offset_microns(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_int_32 png_nsj_get_y_offset_microns(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_int_32 png_get_y_offset_microns(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_y_offset_microns(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_const_bytep png_nsj_get_signature(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_const_bytep png_get_signature(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_signature(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_bKGD(png_const_structrp png_ptr, png_inforp info_ptr, png_color_16p * background);
 png_uint_32 png_get_bKGD(png_const_structrp png_ptr, png_inforp info_ptr, png_color_16p * background)
{
    auto result = png_nsj_get_bKGD(png_ptr, info_ptr, background);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_bKGD(png_const_structrp png_ptr, png_inforp info_ptr, png_const_color_16p background);
 void png_set_bKGD(png_const_structrp png_ptr, png_inforp info_ptr, png_const_color_16p background)
{
    png_nsj_set_bKGD(png_ptr, info_ptr, background);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_cHRM(png_const_structrp png_ptr, png_const_inforp info_ptr, double * white_x, double * white_y, double * red_x, double * red_y, double * green_x, double * green_y, double * blue_x, double * blue_y);
 png_uint_32 png_get_cHRM(png_const_structrp png_ptr, png_const_inforp info_ptr, double * white_x, double * white_y, double * red_x, double * red_y, double * green_x, double * green_y, double * blue_x, double * blue_y)
{
    auto result = png_nsj_get_cHRM(png_ptr, info_ptr, white_x, white_y, red_x, red_y, green_x, green_y, blue_x, blue_y);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_cHRM_XYZ(png_const_structrp png_ptr, png_const_inforp info_ptr, double * red_X, double * red_Y, double * red_Z, double * green_X, double * green_Y, double * green_Z, double * blue_X, double * blue_Y, double * blue_Z);
 png_uint_32 png_get_cHRM_XYZ(png_const_structrp png_ptr, png_const_inforp info_ptr, double * red_X, double * red_Y, double * red_Z, double * green_X, double * green_Y, double * green_Z, double * blue_X, double * blue_Y, double * blue_Z)
{
    auto result = png_nsj_get_cHRM_XYZ(png_ptr, info_ptr, red_X, red_Y, red_Z, green_X, green_Y, green_Z, blue_X, blue_Y, blue_Z);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_cHRM_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr, png_fixed_point * int_white_x, png_fixed_point * int_white_y, png_fixed_point * int_red_x, png_fixed_point * int_red_y, png_fixed_point * int_green_x, png_fixed_point * int_green_y, png_fixed_point * int_blue_x, png_fixed_point * int_blue_y);
 png_uint_32 png_get_cHRM_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr, png_fixed_point * int_white_x, png_fixed_point * int_white_y, png_fixed_point * int_red_x, png_fixed_point * int_red_y, png_fixed_point * int_green_x, png_fixed_point * int_green_y, png_fixed_point * int_blue_x, png_fixed_point * int_blue_y)
{
    auto result = png_nsj_get_cHRM_fixed(png_ptr, info_ptr, int_white_x, int_white_y, int_red_x, int_red_y, int_green_x, int_green_y, int_blue_x, int_blue_y);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_cHRM_XYZ_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr, png_fixed_point * int_red_X, png_fixed_point * int_red_Y, png_fixed_point * int_red_Z, png_fixed_point * int_green_X, png_fixed_point * int_green_Y, png_fixed_point * int_green_Z, png_fixed_point * int_blue_X, png_fixed_point * int_blue_Y, png_fixed_point * int_blue_Z);
 png_uint_32 png_get_cHRM_XYZ_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr, png_fixed_point * int_red_X, png_fixed_point * int_red_Y, png_fixed_point * int_red_Z, png_fixed_point * int_green_X, png_fixed_point * int_green_Y, png_fixed_point * int_green_Z, png_fixed_point * int_blue_X, png_fixed_point * int_blue_Y, png_fixed_point * int_blue_Z)
{
    auto result = png_nsj_get_cHRM_XYZ_fixed(png_ptr, info_ptr, int_red_X, int_red_Y, int_red_Z, int_green_X, int_green_Y, int_green_Z, int_blue_X, int_blue_Y, int_blue_Z);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_cHRM(png_const_structrp png_ptr, png_inforp info_ptr, double white_x, double white_y, double red_x, double red_y, double green_x, double green_y, double blue_x, double blue_y);
 void png_set_cHRM(png_const_structrp png_ptr, png_inforp info_ptr, double white_x, double white_y, double red_x, double red_y, double green_x, double green_y, double blue_x, double blue_y)
{
    png_nsj_set_cHRM(png_ptr, info_ptr, white_x, white_y, red_x, red_y, green_x, green_y, blue_x, blue_y);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_cHRM_XYZ(png_const_structrp png_ptr, png_inforp info_ptr, double red_X, double red_Y, double red_Z, double green_X, double green_Y, double green_Z, double blue_X, double blue_Y, double blue_Z);
 void png_set_cHRM_XYZ(png_const_structrp png_ptr, png_inforp info_ptr, double red_X, double red_Y, double red_Z, double green_X, double green_Y, double green_Z, double blue_X, double blue_Y, double blue_Z)
{
    png_nsj_set_cHRM_XYZ(png_ptr, info_ptr, red_X, red_Y, red_Z, green_X, green_Y, green_Z, blue_X, blue_Y, blue_Z);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_cHRM_fixed(png_const_structrp png_ptr, png_inforp info_ptr, png_fixed_point int_white_x, png_fixed_point int_white_y, png_fixed_point int_red_x, png_fixed_point int_red_y, png_fixed_point int_green_x, png_fixed_point int_green_y, png_fixed_point int_blue_x, png_fixed_point int_blue_y);
 void png_set_cHRM_fixed(png_const_structrp png_ptr, png_inforp info_ptr, png_fixed_point int_white_x, png_fixed_point int_white_y, png_fixed_point int_red_x, png_fixed_point int_red_y, png_fixed_point int_green_x, png_fixed_point int_green_y, png_fixed_point int_blue_x, png_fixed_point int_blue_y)
{
    png_nsj_set_cHRM_fixed(png_ptr, info_ptr, int_white_x, int_white_y, int_red_x, int_red_y, int_green_x, int_green_y, int_blue_x, int_blue_y);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_cHRM_XYZ_fixed(png_const_structrp png_ptr, png_inforp info_ptr, png_fixed_point int_red_X, png_fixed_point int_red_Y, png_fixed_point int_red_Z, png_fixed_point int_green_X, png_fixed_point int_green_Y, png_fixed_point int_green_Z, png_fixed_point int_blue_X, png_fixed_point int_blue_Y, png_fixed_point int_blue_Z);
 void png_set_cHRM_XYZ_fixed(png_const_structrp png_ptr, png_inforp info_ptr, png_fixed_point int_red_X, png_fixed_point int_red_Y, png_fixed_point int_red_Z, png_fixed_point int_green_X, png_fixed_point int_green_Y, png_fixed_point int_green_Z, png_fixed_point int_blue_X, png_fixed_point int_blue_Y, png_fixed_point int_blue_Z)
{
    png_nsj_set_cHRM_XYZ_fixed(png_ptr, info_ptr, int_red_X, int_red_Y, int_red_Z, int_green_X, int_green_Y, int_green_Z, int_blue_X, int_blue_Y, int_blue_Z);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_eXIf(png_const_structrp png_ptr, png_inforp info_ptr, png_bytep * exif);
 png_uint_32 png_get_eXIf(png_const_structrp png_ptr, png_inforp info_ptr, png_bytep * exif)
{
    auto result = png_nsj_get_eXIf(png_ptr, info_ptr, exif);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_eXIf(png_const_structrp png_ptr, png_inforp info_ptr, const png_bytep exif);
 void png_set_eXIf(png_const_structrp png_ptr, png_inforp info_ptr, const png_bytep exif)
{
    png_nsj_set_eXIf(png_ptr, info_ptr, exif);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_eXIf_1(png_const_structrp png_ptr, png_const_inforp info_ptr, png_uint_32 * num_exif, png_bytep * exif);
 png_uint_32 png_get_eXIf_1(png_const_structrp png_ptr, png_const_inforp info_ptr, png_uint_32 * num_exif, png_bytep * exif)
{
    auto result = png_nsj_get_eXIf_1(png_ptr, info_ptr, num_exif, exif);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_eXIf_1(png_const_structrp png_ptr, png_inforp info_ptr, const png_uint_32 num_exif, const png_bytep exif);
 void png_set_eXIf_1(png_const_structrp png_ptr, png_inforp info_ptr, const png_uint_32 num_exif, const png_bytep exif)
{
    png_nsj_set_eXIf_1(png_ptr, info_ptr, num_exif, exif);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_gAMA(png_const_structrp png_ptr, png_const_inforp info_ptr, double * file_gamma);
 png_uint_32 png_get_gAMA(png_const_structrp png_ptr, png_const_inforp info_ptr, double * file_gamma)
{
    auto result = png_nsj_get_gAMA(png_ptr, info_ptr, file_gamma);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_gAMA_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr, png_fixed_point * int_file_gamma);
 png_uint_32 png_get_gAMA_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr, png_fixed_point * int_file_gamma)
{
    auto result = png_nsj_get_gAMA_fixed(png_ptr, info_ptr, int_file_gamma);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_gAMA(png_const_structrp png_ptr, png_inforp info_ptr, double file_gamma);
 void png_set_gAMA(png_const_structrp png_ptr, png_inforp info_ptr, double file_gamma)
{
    png_nsj_set_gAMA(png_ptr, info_ptr, file_gamma);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_gAMA_fixed(png_const_structrp png_ptr, png_inforp info_ptr, png_fixed_point int_file_gamma);
 void png_set_gAMA_fixed(png_const_structrp png_ptr, png_inforp info_ptr, png_fixed_point int_file_gamma)
{
    png_nsj_set_gAMA_fixed(png_ptr, info_ptr, int_file_gamma);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_hIST(png_const_structrp png_ptr, png_inforp info_ptr, png_uint_16p * hist);
 png_uint_32 png_get_hIST(png_const_structrp png_ptr, png_inforp info_ptr, png_uint_16p * hist)
{
    auto result = png_nsj_get_hIST(png_ptr, info_ptr, hist);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_hIST(png_const_structrp png_ptr, png_inforp info_ptr, png_const_uint_16p hist);
 void png_set_hIST(png_const_structrp png_ptr, png_inforp info_ptr, png_const_uint_16p hist)
{
    png_nsj_set_hIST(png_ptr, info_ptr, hist);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_IHDR(png_const_structrp png_ptr, png_const_inforp info_ptr, png_uint_32 * width, png_uint_32 * height, int * bit_depth, int * color_type, int * interlace_method, int * compression_method, int * filter_method);
 png_uint_32 png_get_IHDR(png_const_structrp png_ptr, png_const_inforp info_ptr, png_uint_32 * width, png_uint_32 * height, int * bit_depth, int * color_type, int * interlace_method, int * compression_method, int * filter_method)
{
    auto result = png_nsj_get_IHDR(png_ptr, info_ptr, width, height, bit_depth, color_type, interlace_method, compression_method, filter_method);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_IHDR(png_const_structrp png_ptr, png_inforp info_ptr, png_uint_32 width, png_uint_32 height, int bit_depth, int color_type, int interlace_method, int compression_method, int filter_method);
 void png_set_IHDR(png_const_structrp png_ptr, png_inforp info_ptr, png_uint_32 width, png_uint_32 height, int bit_depth, int color_type, int interlace_method, int compression_method, int filter_method)
{
    png_nsj_set_IHDR(png_ptr, info_ptr, width, height, bit_depth, color_type, interlace_method, compression_method, filter_method);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_oFFs(png_const_structrp png_ptr, png_const_inforp info_ptr, png_int_32 * offset_x, png_int_32 * offset_y, int * unit_type);
 png_uint_32 png_get_oFFs(png_const_structrp png_ptr, png_const_inforp info_ptr, png_int_32 * offset_x, png_int_32 * offset_y, int * unit_type)
{
    auto result = png_nsj_get_oFFs(png_ptr, info_ptr, offset_x, offset_y, unit_type);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_oFFs(png_const_structrp png_ptr, png_inforp info_ptr, png_int_32 offset_x, png_int_32 offset_y, int unit_type);
 void png_set_oFFs(png_const_structrp png_ptr, png_inforp info_ptr, png_int_32 offset_x, png_int_32 offset_y, int unit_type)
{
    png_nsj_set_oFFs(png_ptr, info_ptr, offset_x, offset_y, unit_type);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_pCAL(png_const_structrp png_ptr, png_inforp info_ptr, png_charp * purpose, png_int_32 * X0, png_int_32 * X1, int * type, int * nparams, png_charp * units, png_charpp * params);
 png_uint_32 png_get_pCAL(png_const_structrp png_ptr, png_inforp info_ptr, png_charp * purpose, png_int_32 * X0, png_int_32 * X1, int * type, int * nparams, png_charp * units, png_charpp * params)
{
    auto result = png_nsj_get_pCAL(png_ptr, info_ptr, purpose, X0, X1, type, nparams, units, params);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_pCAL(png_const_structrp png_ptr, png_inforp info_ptr, png_const_charp purpose, png_int_32 X0, png_int_32 X1, int type, int nparams, png_const_charp units, png_charpp params);
 void png_set_pCAL(png_const_structrp png_ptr, png_inforp info_ptr, png_const_charp purpose, png_int_32 X0, png_int_32 X1, int type, int nparams, png_const_charp units, png_charpp params)
{
    png_nsj_set_pCAL(png_ptr, info_ptr, purpose, X0, X1, type, nparams, units, params);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_pHYs(png_const_structrp png_ptr, png_const_inforp info_ptr, png_uint_32 * res_x, png_uint_32 * res_y, int * unit_type);
 png_uint_32 png_get_pHYs(png_const_structrp png_ptr, png_const_inforp info_ptr, png_uint_32 * res_x, png_uint_32 * res_y, int * unit_type)
{
    auto result = png_nsj_get_pHYs(png_ptr, info_ptr, res_x, res_y, unit_type);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_pHYs(png_const_structrp png_ptr, png_inforp info_ptr, png_uint_32 res_x, png_uint_32 res_y, int unit_type);
 void png_set_pHYs(png_const_structrp png_ptr, png_inforp info_ptr, png_uint_32 res_x, png_uint_32 res_y, int unit_type)
{
    png_nsj_set_pHYs(png_ptr, info_ptr, res_x, res_y, unit_type);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_PLTE(png_const_structrp png_ptr, png_inforp info_ptr, png_colorp * palette, int * num_palette);
 png_uint_32 png_get_PLTE(png_const_structrp png_ptr, png_inforp info_ptr, png_colorp * palette, int * num_palette)
{
    auto result = png_nsj_get_PLTE(png_ptr, info_ptr, palette, num_palette);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_PLTE(png_structrp png_ptr, png_inforp info_ptr, png_const_colorp palette, int num_palette);
 void png_set_PLTE(png_structrp png_ptr, png_inforp info_ptr, png_const_colorp palette, int num_palette)
{
    png_nsj_set_PLTE(png_ptr, info_ptr, palette, num_palette);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_sBIT(png_const_structrp png_ptr, png_inforp info_ptr, png_color_8p * sig_bit);
 png_uint_32 png_get_sBIT(png_const_structrp png_ptr, png_inforp info_ptr, png_color_8p * sig_bit)
{
    auto result = png_nsj_get_sBIT(png_ptr, info_ptr, sig_bit);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_sBIT(png_const_structrp png_ptr, png_inforp info_ptr, png_const_color_8p sig_bit);
 void png_set_sBIT(png_const_structrp png_ptr, png_inforp info_ptr, png_const_color_8p sig_bit)
{
    png_nsj_set_sBIT(png_ptr, info_ptr, sig_bit);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_sRGB(png_const_structrp png_ptr, png_const_inforp info_ptr, int * file_srgb_intent);
 png_uint_32 png_get_sRGB(png_const_structrp png_ptr, png_const_inforp info_ptr, int * file_srgb_intent)
{
    auto result = png_nsj_get_sRGB(png_ptr, info_ptr, file_srgb_intent);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_sRGB(png_const_structrp png_ptr, png_inforp info_ptr, int srgb_intent);
 void png_set_sRGB(png_const_structrp png_ptr, png_inforp info_ptr, int srgb_intent)
{
    png_nsj_set_sRGB(png_ptr, info_ptr, srgb_intent);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_sRGB_gAMA_and_cHRM(png_const_structrp png_ptr, png_inforp info_ptr, int srgb_intent);
 void png_set_sRGB_gAMA_and_cHRM(png_const_structrp png_ptr, png_inforp info_ptr, int srgb_intent)
{
    png_nsj_set_sRGB_gAMA_and_cHRM(png_ptr, info_ptr, srgb_intent);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_iCCP(png_const_structrp png_ptr, png_inforp info_ptr, png_charpp name, int * compression_type, png_bytepp profile, png_uint_32 * proflen);
 png_uint_32 png_get_iCCP(png_const_structrp png_ptr, png_inforp info_ptr, png_charpp name, int * compression_type, png_bytepp profile, png_uint_32 * proflen)
{
    auto result = png_nsj_get_iCCP(png_ptr, info_ptr, name, compression_type, profile, proflen);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_iCCP(png_const_structrp png_ptr, png_inforp info_ptr, png_const_charp name, int compression_type, png_const_bytep profile, png_uint_32 proflen);
 void png_set_iCCP(png_const_structrp png_ptr, png_inforp info_ptr, png_const_charp name, int compression_type, png_const_bytep profile, png_uint_32 proflen)
{
    png_nsj_set_iCCP(png_ptr, info_ptr, name, compression_type, profile, proflen);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  int png_nsj_get_sPLT(png_const_structrp png_ptr, png_inforp info_ptr, png_sPLT_tpp entries);
 int png_get_sPLT(png_const_structrp png_ptr, png_inforp info_ptr, png_sPLT_tpp entries)
{
    auto result = png_nsj_get_sPLT(png_ptr, info_ptr, entries);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_sPLT(png_const_structrp png_ptr, png_inforp info_ptr, png_const_sPLT_tp entries, int nentries);
 void png_set_sPLT(png_const_structrp png_ptr, png_inforp info_ptr, png_const_sPLT_tp entries, int nentries)
{
    png_nsj_set_sPLT(png_ptr, info_ptr, entries, nentries);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  int png_nsj_get_text(png_const_structrp png_ptr, png_inforp info_ptr, png_textp * text_ptr, int * num_text);
 int png_get_text(png_const_structrp png_ptr, png_inforp info_ptr, png_textp * text_ptr, int * num_text)
{
    auto result = png_nsj_get_text(png_ptr, info_ptr, text_ptr, num_text);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_text(png_const_structrp png_ptr, png_inforp info_ptr, png_const_textp text_ptr, int num_text);
 void png_set_text(png_const_structrp png_ptr, png_inforp info_ptr, png_const_textp text_ptr, int num_text)
{
    png_nsj_set_text(png_ptr, info_ptr, text_ptr, num_text);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_tIME(png_const_structrp png_ptr, png_inforp info_ptr, png_timep * mod_time);
 png_uint_32 png_get_tIME(png_const_structrp png_ptr, png_inforp info_ptr, png_timep * mod_time)
{
    auto result = png_nsj_get_tIME(png_ptr, info_ptr, mod_time);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_tIME(png_const_structrp png_ptr, png_inforp info_ptr, png_const_timep mod_time);
 void png_set_tIME(png_const_structrp png_ptr, png_inforp info_ptr, png_const_timep mod_time)
{
    png_nsj_set_tIME(png_ptr, info_ptr, mod_time);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_tRNS(png_const_structrp png_ptr, png_inforp info_ptr, png_bytep * trans_alpha, int * num_trans, png_color_16p * trans_color);
 png_uint_32 png_get_tRNS(png_const_structrp png_ptr, png_inforp info_ptr, png_bytep * trans_alpha, int * num_trans, png_color_16p * trans_color)
{
    auto result = png_nsj_get_tRNS(png_ptr, info_ptr, trans_alpha, num_trans, trans_color);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_tRNS(png_structrp png_ptr, png_inforp info_ptr, png_const_bytep trans_alpha, int num_trans, png_const_color_16p trans_color);
 void png_set_tRNS(png_structrp png_ptr, png_inforp info_ptr, png_const_bytep trans_alpha, int num_trans, png_const_color_16p trans_color)
{
    png_nsj_set_tRNS(png_ptr, info_ptr, trans_alpha, num_trans, trans_color);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_sCAL(png_const_structrp png_ptr, png_const_inforp info_ptr, int * unit, double * width, double * height);
 png_uint_32 png_get_sCAL(png_const_structrp png_ptr, png_const_inforp info_ptr, int * unit, double * width, double * height)
{
    auto result = png_nsj_get_sCAL(png_ptr, info_ptr, unit, width, height);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_sCAL_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr, int * unit, png_fixed_point * width, png_fixed_point * height);
 png_uint_32 png_get_sCAL_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr, int * unit, png_fixed_point * width, png_fixed_point * height)
{
    auto result = png_nsj_get_sCAL_fixed(png_ptr, info_ptr, unit, width, height);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_sCAL_s(png_const_structrp png_ptr, png_const_inforp info_ptr, int * unit, png_charpp swidth, png_charpp sheight);
 png_uint_32 png_get_sCAL_s(png_const_structrp png_ptr, png_const_inforp info_ptr, int * unit, png_charpp swidth, png_charpp sheight)
{
    auto result = png_nsj_get_sCAL_s(png_ptr, info_ptr, unit, swidth, sheight);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_sCAL(png_const_structrp png_ptr, png_inforp info_ptr, int unit, double width, double height);
 void png_set_sCAL(png_const_structrp png_ptr, png_inforp info_ptr, int unit, double width, double height)
{
    png_nsj_set_sCAL(png_ptr, info_ptr, unit, width, height);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_sCAL_fixed(png_const_structrp png_ptr, png_inforp info_ptr, int unit, png_fixed_point width, png_fixed_point height);
 void png_set_sCAL_fixed(png_const_structrp png_ptr, png_inforp info_ptr, int unit, png_fixed_point width, png_fixed_point height)
{
    png_nsj_set_sCAL_fixed(png_ptr, info_ptr, unit, width, height);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_sCAL_s(png_const_structrp png_ptr, png_inforp info_ptr, int unit, png_const_charp swidth, png_const_charp sheight);
 void png_set_sCAL_s(png_const_structrp png_ptr, png_inforp info_ptr, int unit, png_const_charp swidth, png_const_charp sheight)
{
    png_nsj_set_sCAL_s(png_ptr, info_ptr, unit, swidth, sheight);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_keep_unknown_chunks(png_structrp png_ptr, int keep, png_const_bytep chunk_list, int num_chunks);
 void png_set_keep_unknown_chunks(png_structrp png_ptr, int keep, png_const_bytep chunk_list, int num_chunks)
{
    png_nsj_set_keep_unknown_chunks(png_ptr, keep, chunk_list, num_chunks);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  int png_nsj_handle_as_unknown(png_const_structrp png_ptr, png_const_bytep chunk_name);
 int png_handle_as_unknown(png_const_structrp png_ptr, png_const_bytep chunk_name)
{
    auto result = png_nsj_handle_as_unknown(png_ptr, chunk_name);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_unknown_chunks(png_const_structrp png_ptr, png_inforp info_ptr, png_const_unknown_chunkp unknowns, int num_unknowns);
 void png_set_unknown_chunks(png_const_structrp png_ptr, png_inforp info_ptr, png_const_unknown_chunkp unknowns, int num_unknowns)
{
    png_nsj_set_unknown_chunks(png_ptr, info_ptr, unknowns, num_unknowns);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

   

extern(C)  void png_nsj_set_unknown_chunk_location(png_const_structrp png_ptr, png_inforp info_ptr, int chunk, int location);
 void png_set_unknown_chunk_location(png_const_structrp png_ptr, png_inforp info_ptr, int chunk, int location)
{
    png_nsj_set_unknown_chunk_location(png_ptr, info_ptr, chunk, location);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  int png_nsj_get_unknown_chunks(png_const_structrp png_ptr, png_inforp info_ptr, png_unknown_chunkpp entries);
 int png_get_unknown_chunks(png_const_structrp png_ptr, png_inforp info_ptr, png_unknown_chunkpp entries)
{
    auto result = png_nsj_get_unknown_chunks(png_ptr, info_ptr, entries);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_invalid(png_const_structrp png_ptr, png_inforp info_ptr, int mask);
 void png_set_invalid(png_const_structrp png_ptr, png_inforp info_ptr, int mask)
{
    png_nsj_set_invalid(png_ptr, info_ptr, mask);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_read_png(png_structrp png_ptr, png_inforp info_ptr, int transforms, png_voidp params);
 void png_read_png(png_structrp png_ptr, png_inforp info_ptr, int transforms, png_voidp params)
{
    png_nsj_read_png(png_ptr, info_ptr, transforms, params);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_png(png_structrp png_ptr, png_inforp info_ptr, int transforms, png_voidp params);
 void png_write_png(png_structrp png_ptr, png_inforp info_ptr, int transforms, png_voidp params)
{
    png_nsj_write_png(png_ptr, info_ptr, transforms, params);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_const_charp png_nsj_get_copyright(png_const_structrp png_ptr);
 png_const_charp png_get_copyright(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_copyright(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_const_charp png_nsj_get_header_ver(png_const_structrp png_ptr);
 png_const_charp png_get_header_ver(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_header_ver(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_const_charp png_nsj_get_header_version(png_const_structrp png_ptr);
 png_const_charp png_get_header_version(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_header_version(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_const_charp png_nsj_get_libpng_ver(png_const_structrp png_ptr);
 png_const_charp png_get_libpng_ver(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_libpng_ver(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_permit_mng_features(png_structrp png_ptr, png_uint_32 mng_features_permitted);
 png_uint_32 png_permit_mng_features(png_structrp png_ptr, png_uint_32 mng_features_permitted)
{
    auto result = png_nsj_permit_mng_features(png_ptr, mng_features_permitted);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_strip_error_numbers(png_structrp png_ptr, png_uint_32 strip_mode);
 void png_set_strip_error_numbers(png_structrp png_ptr, png_uint_32 strip_mode)
{
    png_nsj_set_strip_error_numbers(png_ptr, strip_mode);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_user_limits(png_structrp png_ptr, png_uint_32 user_width_max, png_uint_32 user_height_max);
 void png_set_user_limits(png_structrp png_ptr, png_uint_32 user_width_max, png_uint_32 user_height_max)
{
    png_nsj_set_user_limits(png_ptr, user_width_max, user_height_max);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_user_width_max(png_const_structrp png_ptr);
 png_uint_32 png_get_user_width_max(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_user_width_max(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_user_height_max(png_const_structrp png_ptr);
 png_uint_32 png_get_user_height_max(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_user_height_max(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_chunk_cache_max(png_structrp png_ptr, png_uint_32 user_chunk_cache_max);
 void png_set_chunk_cache_max(png_structrp png_ptr, png_uint_32 user_chunk_cache_max)
{
    png_nsj_set_chunk_cache_max(png_ptr, user_chunk_cache_max);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_uint_32 png_nsj_get_chunk_cache_max(png_const_structrp png_ptr);
 png_uint_32 png_get_chunk_cache_max(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_chunk_cache_max(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_set_chunk_malloc_max(png_structrp png_ptr, png_alloc_size_t user_chunk_cache_max);
 void png_set_chunk_malloc_max(png_structrp png_ptr, png_alloc_size_t user_chunk_cache_max)
{
    png_nsj_set_chunk_malloc_max(png_ptr, user_chunk_cache_max);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  png_alloc_size_t png_nsj_get_chunk_malloc_max(png_const_structrp png_ptr);
 png_alloc_size_t png_get_chunk_malloc_max(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_chunk_malloc_max(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_pixels_per_inch(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_uint_32 png_get_pixels_per_inch(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_pixels_per_inch(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_x_pixels_per_inch(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_uint_32 png_get_x_pixels_per_inch(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_x_pixels_per_inch(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_y_pixels_per_inch(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_uint_32 png_get_y_pixels_per_inch(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_y_pixels_per_inch(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  float png_nsj_get_x_offset_inches(png_const_structrp png_ptr, png_const_inforp info_ptr);
 float png_get_x_offset_inches(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_x_offset_inches(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_fixed_point png_nsj_get_x_offset_inches_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_fixed_point png_get_x_offset_inches_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_x_offset_inches_fixed(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  float png_nsj_get_y_offset_inches(png_const_structrp png_ptr, png_const_inforp info_ptr);
 float png_get_y_offset_inches(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_y_offset_inches(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_fixed_point png_nsj_get_y_offset_inches_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr);
 png_fixed_point png_get_y_offset_inches_fixed(png_const_structrp png_ptr, png_const_inforp info_ptr)
{
    auto result = png_nsj_get_y_offset_inches_fixed(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_pHYs_dpi(png_const_structrp png_ptr, png_const_inforp info_ptr, png_uint_32 * res_x, png_uint_32 * res_y, int * unit_type);
 png_uint_32 png_get_pHYs_dpi(png_const_structrp png_ptr, png_const_inforp info_ptr, png_uint_32 * res_x, png_uint_32 * res_y, int * unit_type)
{
    auto result = png_nsj_get_pHYs_dpi(png_ptr, info_ptr, res_x, res_y, unit_type);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_io_state(png_const_structrp png_ptr);
 png_uint_32 png_get_io_state(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_io_state(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

@disable png_const_bytep png_get_io_chunk_name(png_structrp png_ptr)
{
    assert(false, "Attempt to call function 'png_get_io_chunk_name' that was removed from libpng.");
}

extern(C)  png_uint_32 png_nsj_get_io_chunk_type(png_const_structrp png_ptr);
 png_uint_32 png_get_io_chunk_type(png_const_structrp png_ptr)
{
    auto result = png_nsj_get_io_chunk_type(png_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

 

extern(C)  png_uint_32 png_nsj_get_uint_32(libpngCallContextForD* dCallContext, png_const_bytep buf);
 png_uint_32 png_get_uint_32(png_const_bytep buf)
{
    libpngCallContextForD dCallContext;
    auto result = png_nsj_get_uint_32(&dCallContext, buf);
    png_nsj_check_errors(&dCallContext);
    return result;
}

extern(C)  png_uint_16 png_nsj_get_uint_16(libpngCallContextForD* dCallContext, png_const_bytep buf);
 png_uint_16 png_get_uint_16(png_const_bytep buf)
{
    libpngCallContextForD dCallContext;
    auto result = png_nsj_get_uint_16(&dCallContext, buf);
    png_nsj_check_errors(&dCallContext);
    return result;
}

extern(C)  png_int_32 png_nsj_get_int_32(libpngCallContextForD* dCallContext, png_const_bytep buf);
 png_int_32 png_get_int_32(png_const_bytep buf)
{
    libpngCallContextForD dCallContext;
    auto result = png_nsj_get_int_32(&dCallContext, buf);
    png_nsj_check_errors(&dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_uint_31(png_const_structrp png_ptr, png_const_bytep buf);
 png_uint_32 png_get_uint_31(png_const_structrp png_ptr, png_const_bytep buf)
{
    auto result = png_nsj_get_uint_31(png_ptr, buf);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_save_uint_32(libpngCallContextForD* dCallContext, png_bytep buf, png_uint_32 i);
 void png_save_uint_32(png_bytep buf, png_uint_32 i)
{
    libpngCallContextForD dCallContext;
    png_nsj_save_uint_32(&dCallContext, buf, i);
    png_nsj_check_errors(&dCallContext);
    return;
}

extern(C)  void png_nsj_save_int_32(libpngCallContextForD* dCallContext, png_bytep buf, png_int_32 i);
 void png_save_int_32(png_bytep buf, png_int_32 i)
{
    libpngCallContextForD dCallContext;
    png_nsj_save_int_32(&dCallContext, buf, i);
    png_nsj_check_errors(&dCallContext);
    return;
}

extern(C)  void png_nsj_save_uint_16(libpngCallContextForD* dCallContext, png_bytep buf, uint i);
 void png_save_uint_16(png_bytep buf, uint i)
{
    libpngCallContextForD dCallContext;
    png_nsj_save_uint_16(&dCallContext, buf, i);
    png_nsj_check_errors(&dCallContext);
    return;
}

   

   

extern(C)  void png_nsj_set_check_for_invalid_index(png_structrp png_ptr, int allowed);
 void png_set_check_for_invalid_index(png_structrp png_ptr, int allowed)
{
    png_nsj_set_check_for_invalid_index(png_ptr, allowed);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  int png_nsj_get_palette_max(png_const_structp png_ptr, png_const_infop info_ptr);
 int png_get_palette_max(png_const_structp png_ptr, png_const_infop info_ptr)
{
    auto result = png_nsj_get_palette_max(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

   

   

   

   

   

   

   

   

   

   

   

   

   

   

extern(C)  int png_nsj_image_begin_read_from_file(libpngCallContextForD* dCallContext, png_imagep image, const char * file_name);
 int png_image_begin_read_from_file(png_imagep image, const char * file_name)
{
    libpngCallContextForD dCallContext;
    auto result = png_nsj_image_begin_read_from_file(&dCallContext, image, file_name);
    png_nsj_check_errors(&dCallContext);
    return result;
}

   

extern(C)  int png_nsj_image_begin_read_from_stdio(libpngCallContextForD* dCallContext, png_imagep image, FILE* file);
 int png_image_begin_read_from_stdio(png_imagep image, FILE* file)
{
    libpngCallContextForD dCallContext;
    auto result = png_nsj_image_begin_read_from_stdio(&dCallContext, image, file);
    png_nsj_check_errors(&dCallContext);
    return result;
}

   

extern(C)  int png_nsj_image_begin_read_from_memory(libpngCallContextForD* dCallContext, png_imagep image, png_const_voidp memory, size_t size);
 int png_image_begin_read_from_memory(png_imagep image, png_const_voidp memory, size_t size)
{
    libpngCallContextForD dCallContext;
    auto result = png_nsj_image_begin_read_from_memory(&dCallContext, image, memory, size);
    png_nsj_check_errors(&dCallContext);
    return result;
}

   

extern(C)  int png_nsj_image_finish_read(libpngCallContextForD* dCallContext, png_imagep image, png_const_colorp background, void * buffer, png_int_32 row_stride, void * colormap);
 int png_image_finish_read(png_imagep image, png_const_colorp background, void * buffer, png_int_32 row_stride, void * colormap)
{
    libpngCallContextForD dCallContext;
    auto result = png_nsj_image_finish_read(&dCallContext, image, background, buffer, row_stride, colormap);
    png_nsj_check_errors(&dCallContext);
    return result;
}

   

extern(C)  void png_nsj_image_free(libpngCallContextForD* dCallContext, png_imagep image);
 void png_image_free(png_imagep image)
{
    libpngCallContextForD dCallContext;
    png_nsj_image_free(&dCallContext, image);
    png_nsj_check_errors(&dCallContext);
    return;
}

   

extern(C)  int png_nsj_image_write_to_file(libpngCallContextForD* dCallContext, png_imagep image, const char * file, int convert_to_8bit, const void * buffer, png_int_32 row_stride, const void * colormap);
 int png_image_write_to_file(png_imagep image, const char * file, int convert_to_8bit, const void * buffer, png_int_32 row_stride, const void * colormap)
{
    libpngCallContextForD dCallContext;
    auto result = png_nsj_image_write_to_file(&dCallContext, image, file, convert_to_8bit, buffer, row_stride, colormap);
    png_nsj_check_errors(&dCallContext);
    return result;
}

   

extern(C)  int png_nsj_image_write_to_stdio(libpngCallContextForD* dCallContext, png_imagep image, FILE * file, int convert_to_8_bit, const void * buffer, png_int_32 row_stride, const void * colormap);
 int png_image_write_to_stdio(png_imagep image, FILE * file, int convert_to_8_bit, const void * buffer, png_int_32 row_stride, const void * colormap)
{
    libpngCallContextForD dCallContext;
    auto result = png_nsj_image_write_to_stdio(&dCallContext, image, file, convert_to_8_bit, buffer, row_stride, colormap);
    png_nsj_check_errors(&dCallContext);
    return result;
}

   

extern(C)  int png_nsj_image_write_to_memory(libpngCallContextForD* dCallContext, png_imagep image, void * memory, png_alloc_size_t * memory_bytes, int convert_to_8_bit, const void * buffer, png_int_32 row_stride, const void * colormap);
 int png_image_write_to_memory(png_imagep image, void * memory, png_alloc_size_t * memory_bytes, int convert_to_8_bit, const void * buffer, png_int_32 row_stride, const void * colormap)
{
    libpngCallContextForD dCallContext;
    auto result = png_nsj_image_write_to_memory(&dCallContext, image, memory, memory_bytes, convert_to_8_bit, buffer, row_stride, colormap);
    png_nsj_check_errors(&dCallContext);
    return result;
}

   

   

   

   

   

   

   

extern(C)  int png_nsj_set_option(png_structrp png_ptr, int option, int onoff);
 int png_set_option(png_structrp png_ptr, int option, int onoff)
{
    auto result = png_nsj_set_option(png_ptr, option, onoff);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_acTL(png_structp png_ptr, png_infop info_ptr, png_uint_32 * num_frames, png_uint_32 * num_plays);
 png_uint_32 png_get_acTL(png_structp png_ptr, png_infop info_ptr, png_uint_32 * num_frames, png_uint_32 * num_plays)
{
    auto result = png_nsj_get_acTL(png_ptr, info_ptr, num_frames, num_plays);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_set_acTL(png_structp png_ptr, png_infop info_ptr, png_uint_32 num_frames, png_uint_32 num_plays);
 png_uint_32 png_set_acTL(png_structp png_ptr, png_infop info_ptr, png_uint_32 num_frames, png_uint_32 num_plays)
{
    auto result = png_nsj_set_acTL(png_ptr, info_ptr, num_frames, num_plays);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_num_frames(png_structp png_ptr, png_infop info_ptr);
 png_uint_32 png_get_num_frames(png_structp png_ptr, png_infop info_ptr)
{
    auto result = png_nsj_get_num_frames(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_num_plays(png_structp png_ptr, png_infop info_ptr);
 png_uint_32 png_get_num_plays(png_structp png_ptr, png_infop info_ptr)
{
    auto result = png_nsj_get_num_plays(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_next_frame_fcTL(png_structp png_ptr, png_infop info_ptr, png_uint_32 * width, png_uint_32 * height, png_uint_32 * x_offset, png_uint_32 * y_offset, png_uint_16 * delay_num, png_uint_16 * delay_den, png_byte * dispose_op, png_byte * blend_op);
 png_uint_32 png_get_next_frame_fcTL(png_structp png_ptr, png_infop info_ptr, png_uint_32 * width, png_uint_32 * height, png_uint_32 * x_offset, png_uint_32 * y_offset, png_uint_16 * delay_num, png_uint_16 * delay_den, png_byte * dispose_op, png_byte * blend_op)
{
    auto result = png_nsj_get_next_frame_fcTL(png_ptr, info_ptr, width, height, x_offset, y_offset, delay_num, delay_den, dispose_op, blend_op);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_set_next_frame_fcTL(png_structp png_ptr, png_infop info_ptr, png_uint_32 width, png_uint_32 height, png_uint_32 x_offset, png_uint_32 y_offset, png_uint_16 delay_num, png_uint_16 delay_den, png_byte dispose_op, png_byte blend_op);
 png_uint_32 png_set_next_frame_fcTL(png_structp png_ptr, png_infop info_ptr, png_uint_32 width, png_uint_32 height, png_uint_32 x_offset, png_uint_32 y_offset, png_uint_16 delay_num, png_uint_16 delay_den, png_byte dispose_op, png_byte blend_op)
{
    auto result = png_nsj_set_next_frame_fcTL(png_ptr, info_ptr, width, height, x_offset, y_offset, delay_num, delay_den, dispose_op, blend_op);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_next_frame_width(png_structp png_ptr, png_infop info_ptr);
 png_uint_32 png_get_next_frame_width(png_structp png_ptr, png_infop info_ptr)
{
    auto result = png_nsj_get_next_frame_width(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_next_frame_height(png_structp png_ptr, png_infop info_ptr);
 png_uint_32 png_get_next_frame_height(png_structp png_ptr, png_infop info_ptr)
{
    auto result = png_nsj_get_next_frame_height(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_next_frame_x_offset(png_structp png_ptr, png_infop info_ptr);
 png_uint_32 png_get_next_frame_x_offset(png_structp png_ptr, png_infop info_ptr)
{
    auto result = png_nsj_get_next_frame_x_offset(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_get_next_frame_y_offset(png_structp png_ptr, png_infop info_ptr);
 png_uint_32 png_get_next_frame_y_offset(png_structp png_ptr, png_infop info_ptr)
{
    auto result = png_nsj_get_next_frame_y_offset(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_16 png_nsj_get_next_frame_delay_num(png_structp png_ptr, png_infop info_ptr);
 png_uint_16 png_get_next_frame_delay_num(png_structp png_ptr, png_infop info_ptr)
{
    auto result = png_nsj_get_next_frame_delay_num(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_16 png_nsj_get_next_frame_delay_den(png_structp png_ptr, png_infop info_ptr);
 png_uint_16 png_get_next_frame_delay_den(png_structp png_ptr, png_infop info_ptr)
{
    auto result = png_nsj_get_next_frame_delay_den(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_byte png_nsj_get_next_frame_dispose_op(png_structp png_ptr, png_infop info_ptr);
 png_byte png_get_next_frame_dispose_op(png_structp png_ptr, png_infop info_ptr)
{
    auto result = png_nsj_get_next_frame_dispose_op(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_byte png_nsj_get_next_frame_blend_op(png_structp png_ptr, png_infop info_ptr);
 png_byte png_get_next_frame_blend_op(png_structp png_ptr, png_infop info_ptr)
{
    auto result = png_nsj_get_next_frame_blend_op(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_byte png_nsj_get_first_frame_is_hidden(png_structp png_ptr, png_infop info_ptr);
 png_byte png_get_first_frame_is_hidden(png_structp png_ptr, png_infop info_ptr)
{
    auto result = png_nsj_get_first_frame_is_hidden(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  png_uint_32 png_nsj_set_first_frame_is_hidden(png_structp png_ptr, png_infop info_ptr, png_byte is_hidden);
 png_uint_32 png_set_first_frame_is_hidden(png_structp png_ptr, png_infop info_ptr, png_byte is_hidden)
{
    auto result = png_nsj_set_first_frame_is_hidden(png_ptr, info_ptr, is_hidden);
    png_nsj_check_errors(png_ptr.dCallContext);
    return result;
}

extern(C)  void png_nsj_read_frame_head(png_structp png_ptr, png_infop info_ptr);
 void png_read_frame_head(png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_read_frame_head(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_set_progressive_frame_fn(png_structp png_ptr, png_progressive_frame_ptr frame_info_fn, png_progressive_frame_ptr frame_end_fn);
 void png_set_progressive_frame_fn(png_structp png_ptr, png_progressive_frame_ptr frame_info_fn, png_progressive_frame_ptr frame_end_fn)
{
    png_nsj_set_progressive_frame_fn(png_ptr, frame_info_fn, frame_end_fn);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_frame_head(png_structp png_ptr, png_infop info_ptr, png_bytepp row_pointers, png_uint_32 width, png_uint_32 height, png_uint_32 x_offset, png_uint_32 y_offset, png_uint_16 delay_num, png_uint_16 delay_den, png_byte dispose_op, png_byte blend_op);
 void png_write_frame_head(png_structp png_ptr, png_infop info_ptr, png_bytepp row_pointers, png_uint_32 width, png_uint_32 height, png_uint_32 x_offset, png_uint_32 y_offset, png_uint_16 delay_num, png_uint_16 delay_den, png_byte dispose_op, png_byte blend_op)
{
    png_nsj_write_frame_head(png_ptr, info_ptr, row_pointers, width, height, x_offset, y_offset, delay_num, delay_den, dispose_op, blend_op);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

extern(C)  void png_nsj_write_frame_tail(png_structp png_ptr, png_infop info_ptr);
 void png_write_frame_tail(png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_write_frame_tail(png_ptr, info_ptr);
    png_nsj_check_errors(png_ptr.dCallContext);
    return;
}

  

  

