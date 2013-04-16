#include <png.h>
#include <stdlib.h>
#include "png_wrap_utils.h"

#include "png_nsj.h"

#ifndef PNGLCONF_H
    
#   include "pnglibconf.h"
#endif

#ifndef PNG_VERSION_INFO_ONLY
#  ifndef PNG_BUILDING_SYMBOL_TABLE
  
#    ifdef PNG_SETJMP_SUPPORTED
#      include <setjmp.h>
#    endif

    
#    ifdef PNG_CONVERT_tIME_SUPPORTED
       
#      include <time.h>
#    endif
#  endif

#  include "pngconf.h"
#endif

#ifdef PNG_USER_PRIVATEBUILD 

#else
#  ifdef PNG_LIBPNG_SPECIALBUILD

#  else

#  endif
#endif

#ifndef PNG_VERSION_INFO_ONLY

 

#ifdef PNG_APNG_SUPPORTED

#endif 

#ifdef PNG_TEXT_SUPPORTED

#endif

#if defined(PNG_UNKNOWN_CHUNKS_SUPPORTED) || \
    defined(PNG_HANDLE_AS_UNKNOWN_SUPPORTED)

#endif

#ifdef PNG_APNG_SUPPORTED

#endif

#ifdef PNG_PROGRESSIVE_READ_SUPPORTED

#ifdef PNG_APNG_SUPPORTED

#endif

#endif

#if defined(PNG_READ_USER_TRANSFORM_SUPPORTED) || \
    defined(PNG_WRITE_USER_TRANSFORM_SUPPORTED)

#endif

#ifdef PNG_USER_CHUNKS_SUPPORTED

#endif
#ifdef PNG_UNKNOWN_CHUNKS_SUPPORTED

#endif

#ifdef PNG_SETJMP_SUPPORTED

#endif

#define PNG_NSJ_png_access_version_number_IS_DEFINED 1

#define PNG_NSJ_png_set_sig_bytes_IS_DEFINED 1

#define PNG_NSJ_png_sig_cmp_IS_DEFINED 1

#define PNG_NSJ_png_create_read_struct_IS_DEFINED 1

#define PNG_NSJ_png_create_write_struct_IS_DEFINED 1

#define PNG_NSJ_png_get_compression_buffer_size_IS_DEFINED 1

#define PNG_NSJ_png_set_compression_buffer_size_IS_DEFINED 1

#ifdef PNG_SETJMP_SUPPORTED

#define PNG_NSJ_png_set_longjmp_fn_IS_DEFINED 1

#else

#endif

#define PNG_NSJ_png_longjmp_IS_DEFINED 1

#ifdef PNG_READ_SUPPORTED

#define PNG_NSJ_png_reset_zstream_IS_DEFINED 1

#endif

#ifdef PNG_USER_MEM_SUPPORTED
#define PNG_NSJ_png_create_read_struct_2_IS_DEFINED 1

#define PNG_NSJ_png_create_write_struct_2_IS_DEFINED 1

#endif

#define PNG_NSJ_png_write_sig_IS_DEFINED 1

#define PNG_NSJ_png_write_chunk_IS_DEFINED 1

#define PNG_NSJ_png_write_chunk_start_IS_DEFINED 1

#define PNG_NSJ_png_write_chunk_data_IS_DEFINED 1

#define PNG_NSJ_png_write_chunk_end_IS_DEFINED 1

#define PNG_NSJ_png_create_info_struct_IS_DEFINED 1

#define PNG_NSJ_png_info_init_3_IS_DEFINED 1

#define PNG_NSJ_png_write_info_before_PLTE_IS_DEFINED 1

#define PNG_NSJ_png_write_info_IS_DEFINED 1

#ifdef PNG_SEQUENTIAL_READ_SUPPORTED

#define PNG_NSJ_png_read_info_IS_DEFINED 1

#endif

#ifdef PNG_TIME_RFC1123_SUPPORTED
#define PNG_NSJ_png_convert_to_rfc1123_IS_DEFINED 1

#endif

#ifdef PNG_CONVERT_tIME_SUPPORTED

#define PNG_NSJ_png_convert_from_struct_tm_IS_DEFINED 1

#define PNG_NSJ_png_convert_from_time_t_IS_DEFINED 1

#endif 

#ifdef PNG_READ_EXPAND_SUPPORTED

#define PNG_NSJ_png_set_expand_IS_DEFINED 1

#define PNG_NSJ_png_set_expand_gray_1_2_4_to_8_IS_DEFINED 1

#define PNG_NSJ_png_set_palette_to_rgb_IS_DEFINED 1

#define PNG_NSJ_png_set_tRNS_to_alpha_IS_DEFINED 1

#endif

#ifdef PNG_READ_EXPAND_16_SUPPORTED

#define PNG_NSJ_png_set_expand_16_IS_DEFINED 1

#endif

#if defined(PNG_READ_BGR_SUPPORTED) || defined(PNG_WRITE_BGR_SUPPORTED)

#define PNG_NSJ_png_set_bgr_IS_DEFINED 1

#endif

#ifdef PNG_READ_GRAY_TO_RGB_SUPPORTED

#define PNG_NSJ_png_set_gray_to_rgb_IS_DEFINED 1

#endif

#ifdef PNG_READ_RGB_TO_GRAY_SUPPORTED

#define PNG_NSJ_png_set_rgb_to_gray_IS_DEFINED 1
#define PNG_NSJ_png_set_rgb_to_gray_fixed_IS_DEFINED 1
#define PNG_NSJ_png_get_rgb_to_gray_status_IS_DEFINED 1

#endif

#ifdef PNG_BUILD_GRAYSCALE_PALETTE_SUPPORTED
#define PNG_NSJ_png_build_grayscale_palette_IS_DEFINED 1

#endif

#ifdef PNG_READ_ALPHA_MODE_SUPPORTED

#define PNG_NSJ_png_set_alpha_mode_IS_DEFINED 1
#define PNG_NSJ_png_set_alpha_mode_fixed_IS_DEFINED 1
#endif

#if defined(PNG_READ_GAMMA_SUPPORTED) || defined(PNG_READ_ALPHA_MODE_SUPPORTED)

#endif

#ifdef PNG_READ_STRIP_ALPHA_SUPPORTED
#define PNG_NSJ_png_set_strip_alpha_IS_DEFINED 1

#endif

#if defined(PNG_READ_SWAP_ALPHA_SUPPORTED) || \
    defined(PNG_WRITE_SWAP_ALPHA_SUPPORTED)
#define PNG_NSJ_png_set_swap_alpha_IS_DEFINED 1

#endif

#if defined(PNG_READ_INVERT_ALPHA_SUPPORTED) || \
    defined(PNG_WRITE_INVERT_ALPHA_SUPPORTED)
#define PNG_NSJ_png_set_invert_alpha_IS_DEFINED 1

#endif

#if defined(PNG_READ_FILLER_SUPPORTED) || defined(PNG_WRITE_FILLER_SUPPORTED)

#define PNG_NSJ_png_set_filler_IS_DEFINED 1

#define PNG_NSJ_png_set_add_alpha_IS_DEFINED 1

#endif 

#if defined(PNG_READ_SWAP_SUPPORTED) || defined(PNG_WRITE_SWAP_SUPPORTED)

#define PNG_NSJ_png_set_swap_IS_DEFINED 1

#endif

#if defined(PNG_READ_PACK_SUPPORTED) || defined(PNG_WRITE_PACK_SUPPORTED)

#define PNG_NSJ_png_set_packing_IS_DEFINED 1

#endif

#if defined(PNG_READ_PACKSWAP_SUPPORTED) || \
    defined(PNG_WRITE_PACKSWAP_SUPPORTED)

#define PNG_NSJ_png_set_packswap_IS_DEFINED 1

#endif

#if defined(PNG_READ_SHIFT_SUPPORTED) || defined(PNG_WRITE_SHIFT_SUPPORTED)

#define PNG_NSJ_png_set_shift_IS_DEFINED 1

#endif

#if defined(PNG_READ_INTERLACING_SUPPORTED) || \
    defined(PNG_WRITE_INTERLACING_SUPPORTED)

#define PNG_NSJ_png_set_interlace_handling_IS_DEFINED 1

#endif

#if defined(PNG_READ_INVERT_SUPPORTED) || defined(PNG_WRITE_INVERT_SUPPORTED)

#define PNG_NSJ_png_set_invert_mono_IS_DEFINED 1

#endif

#ifdef PNG_READ_BACKGROUND_SUPPORTED

#define PNG_NSJ_png_set_background_IS_DEFINED 1
#define PNG_NSJ_png_set_background_fixed_IS_DEFINED 1
#endif
#ifdef PNG_READ_BACKGROUND_SUPPORTED

#endif

#ifdef PNG_READ_SCALE_16_TO_8_SUPPORTED

#define PNG_NSJ_png_set_scale_16_IS_DEFINED 1

#endif

#ifdef PNG_READ_STRIP_16_TO_8_SUPPORTED

#define PNG_NSJ_png_set_strip_16_IS_DEFINED 1

#endif

#ifdef PNG_READ_QUANTIZE_SUPPORTED

#define PNG_NSJ_png_set_quantize_IS_DEFINED 1

#endif

#ifdef PNG_READ_GAMMA_SUPPORTED

#define PNG_NSJ_png_set_gamma_IS_DEFINED 1
#define PNG_NSJ_png_set_gamma_fixed_IS_DEFINED 1
#endif

#ifdef PNG_WRITE_FLUSH_SUPPORTED

#define PNG_NSJ_png_set_flush_IS_DEFINED 1

#define PNG_NSJ_png_write_flush_IS_DEFINED 1

#endif

#define PNG_NSJ_png_start_read_image_IS_DEFINED 1

#define PNG_NSJ_png_read_update_info_IS_DEFINED 1

#ifdef PNG_SEQUENTIAL_READ_SUPPORTED

#define PNG_NSJ_png_read_rows_IS_DEFINED 1

#endif

#ifdef PNG_SEQUENTIAL_READ_SUPPORTED

#define PNG_NSJ_png_read_row_IS_DEFINED 1

#endif

#ifdef PNG_SEQUENTIAL_READ_SUPPORTED

#define PNG_NSJ_png_read_image_IS_DEFINED 1

#endif

#define PNG_NSJ_png_write_row_IS_DEFINED 1

#define PNG_NSJ_png_write_rows_IS_DEFINED 1

#define PNG_NSJ_png_write_image_IS_DEFINED 1

#define PNG_NSJ_png_write_end_IS_DEFINED 1

#ifdef PNG_SEQUENTIAL_READ_SUPPORTED

#define PNG_NSJ_png_read_end_IS_DEFINED 1

#endif

#define PNG_NSJ_png_destroy_info_struct_IS_DEFINED 1

#define PNG_NSJ_png_destroy_read_struct_IS_DEFINED 1

#define PNG_NSJ_png_destroy_write_struct_IS_DEFINED 1

#define PNG_NSJ_png_set_crc_action_IS_DEFINED 1

#define PNG_NSJ_png_set_filter_IS_DEFINED 1

#ifdef PNG_WRITE_WEIGHTED_FILTER_SUPPORTED 

#define PNG_NSJ_png_set_filter_heuristics_IS_DEFINED 1
#define PNG_NSJ_png_set_filter_heuristics_fixed_IS_DEFINED 1
#endif 

#ifdef PNG_WRITE_SUPPORTED

#define PNG_NSJ_png_set_compression_level_IS_DEFINED 1

#define PNG_NSJ_png_set_compression_mem_level_IS_DEFINED 1

#define PNG_NSJ_png_set_compression_strategy_IS_DEFINED 1

#define PNG_NSJ_png_set_compression_window_bits_IS_DEFINED 1

#define PNG_NSJ_png_set_compression_method_IS_DEFINED 1

#endif

#ifdef PNG_WRITE_CUSTOMIZE_ZTXT_COMPRESSION_SUPPORTED

#define PNG_NSJ_png_set_text_compression_level_IS_DEFINED 1

#define PNG_NSJ_png_set_text_compression_mem_level_IS_DEFINED 1

#define PNG_NSJ_png_set_text_compression_strategy_IS_DEFINED 1

#define PNG_NSJ_png_set_text_compression_window_bits_IS_DEFINED 1

#define PNG_NSJ_png_set_text_compression_method_IS_DEFINED 1

#endif 

#ifdef PNG_STDIO_SUPPORTED

#define PNG_NSJ_png_init_io_IS_DEFINED 1

#endif

#define PNG_NSJ_png_set_error_fn_IS_DEFINED 1

#define PNG_NSJ_png_get_error_ptr_IS_DEFINED 1

#define PNG_NSJ_png_set_write_fn_IS_DEFINED 1

#define PNG_NSJ_png_set_read_fn_IS_DEFINED 1

#define PNG_NSJ_png_get_io_ptr_IS_DEFINED 1

#define PNG_NSJ_png_set_read_status_fn_IS_DEFINED 1

#define PNG_NSJ_png_set_write_status_fn_IS_DEFINED 1

#ifdef PNG_USER_MEM_SUPPORTED

#define PNG_NSJ_png_set_mem_fn_IS_DEFINED 1

#define PNG_NSJ_png_get_mem_ptr_IS_DEFINED 1

#endif

#ifdef PNG_READ_USER_TRANSFORM_SUPPORTED
#define PNG_NSJ_png_set_read_user_transform_fn_IS_DEFINED 1

#endif

#ifdef PNG_WRITE_USER_TRANSFORM_SUPPORTED
#define PNG_NSJ_png_set_write_user_transform_fn_IS_DEFINED 1

#endif

#ifdef PNG_USER_TRANSFORM_PTR_SUPPORTED
#define PNG_NSJ_png_set_user_transform_info_IS_DEFINED 1

#define PNG_NSJ_png_get_user_transform_ptr_IS_DEFINED 1

#endif

#ifdef PNG_USER_TRANSFORM_INFO_SUPPORTED

#define PNG_NSJ_png_get_current_row_number_IS_DEFINED 1

#define PNG_NSJ_png_get_current_pass_number_IS_DEFINED 1

#endif

#ifdef PNG_USER_CHUNKS_SUPPORTED
#define PNG_NSJ_png_set_read_user_chunk_fn_IS_DEFINED 1

#define PNG_NSJ_png_get_user_chunk_ptr_IS_DEFINED 1

#endif

#ifdef PNG_PROGRESSIVE_READ_SUPPORTED

#define PNG_NSJ_png_set_progressive_read_fn_IS_DEFINED 1

#define PNG_NSJ_png_get_progressive_ptr_IS_DEFINED 1

#define PNG_NSJ_png_process_data_IS_DEFINED 1

#define PNG_NSJ_png_process_data_pause_IS_DEFINED 1

#define PNG_NSJ_png_process_data_skip_IS_DEFINED 1

#ifdef PNG_READ_INTERLACING_SUPPORTED

#define PNG_NSJ_png_progressive_combine_row_IS_DEFINED 1

#endif 
#endif 

#define PNG_NSJ_png_malloc_IS_DEFINED 1

#define PNG_NSJ_png_calloc_IS_DEFINED 1

#define PNG_NSJ_png_malloc_warn_IS_DEFINED 1

#define PNG_NSJ_png_free_IS_DEFINED 1

#define PNG_NSJ_png_free_data_IS_DEFINED 1

#define PNG_NSJ_png_data_freer_IS_DEFINED 1

#ifdef PNG_USER_MEM_SUPPORTED
#define PNG_NSJ_png_malloc_default_IS_DEFINED 1

#define PNG_NSJ_png_free_default_IS_DEFINED 1

#endif

#ifdef PNG_ERROR_TEXT_SUPPORTED

#define PNG_NSJ_png_error_IS_DEFINED 1

#define PNG_NSJ_png_chunk_error_IS_DEFINED 1

#else

#define PNG_NSJ_png_err_IS_DEFINED 1

#endif

#ifdef PNG_WARNINGS_SUPPORTED

#define PNG_NSJ_png_warning_IS_DEFINED 1

#define PNG_NSJ_png_chunk_warning_IS_DEFINED 1

#endif

#ifdef PNG_BENIGN_ERRORS_SUPPORTED

#define PNG_NSJ_png_benign_error_IS_DEFINED 1

#define PNG_NSJ_png_chunk_benign_error_IS_DEFINED 1

#define PNG_NSJ_png_set_benign_errors_IS_DEFINED 1

#else
#  ifdef PNG_ALLOW_BENIGN_ERRORS

#  else

#  endif
#endif

#define PNG_NSJ_png_get_valid_IS_DEFINED 1

#define PNG_NSJ_png_get_rowbytes_IS_DEFINED 1

#ifdef PNG_INFO_IMAGE_SUPPORTED

#define PNG_NSJ_png_get_rows_IS_DEFINED 1

#define PNG_NSJ_png_set_rows_IS_DEFINED 1

#endif

#define PNG_NSJ_png_get_channels_IS_DEFINED 1

#ifdef PNG_EASY_ACCESS_SUPPORTED

#define PNG_NSJ_png_get_image_width_IS_DEFINED 1

#define PNG_NSJ_png_get_image_height_IS_DEFINED 1

#define PNG_NSJ_png_get_bit_depth_IS_DEFINED 1

#define PNG_NSJ_png_get_color_type_IS_DEFINED 1

#define PNG_NSJ_png_get_filter_type_IS_DEFINED 1

#define PNG_NSJ_png_get_interlace_type_IS_DEFINED 1

#define PNG_NSJ_png_get_compression_type_IS_DEFINED 1

#define PNG_NSJ_png_get_pixels_per_meter_IS_DEFINED 1

#define PNG_NSJ_png_get_x_pixels_per_meter_IS_DEFINED 1

#define PNG_NSJ_png_get_y_pixels_per_meter_IS_DEFINED 1

#define PNG_NSJ_png_get_pixel_aspect_ratio_IS_DEFINED 1
#define PNG_NSJ_png_get_pixel_aspect_ratio_fixed_IS_DEFINED 1
#define PNG_NSJ_png_get_x_offset_pixels_IS_DEFINED 1

#define PNG_NSJ_png_get_y_offset_pixels_IS_DEFINED 1

#define PNG_NSJ_png_get_x_offset_microns_IS_DEFINED 1

#define PNG_NSJ_png_get_y_offset_microns_IS_DEFINED 1

#endif 

#define PNG_NSJ_png_get_signature_IS_DEFINED 1

#ifdef PNG_bKGD_SUPPORTED
#define PNG_NSJ_png_get_bKGD_IS_DEFINED 1

#endif

#ifdef PNG_bKGD_SUPPORTED
#define PNG_NSJ_png_set_bKGD_IS_DEFINED 1

#endif

#ifdef PNG_cHRM_SUPPORTED
#define PNG_NSJ_png_get_cHRM_IS_DEFINED 1
#define PNG_NSJ_png_get_cHRM_XYZ_IS_DEFINED 1
#ifdef PNG_FIXED_POINT_SUPPORTED 
#define PNG_NSJ_png_get_cHRM_fixed_IS_DEFINED 1
#endif
#define PNG_NSJ_png_get_cHRM_XYZ_fixed_IS_DEFINED 1
#endif

#ifdef PNG_cHRM_SUPPORTED
#define PNG_NSJ_png_set_cHRM_IS_DEFINED 1
#define PNG_NSJ_png_set_cHRM_XYZ_IS_DEFINED 1
#define PNG_NSJ_png_set_cHRM_fixed_IS_DEFINED 1
#define PNG_NSJ_png_set_cHRM_XYZ_fixed_IS_DEFINED 1
#endif

#ifdef PNG_gAMA_SUPPORTED
#define PNG_NSJ_png_get_gAMA_IS_DEFINED 1
#define PNG_NSJ_png_get_gAMA_fixed_IS_DEFINED 1
#endif

#ifdef PNG_gAMA_SUPPORTED
#define PNG_NSJ_png_set_gAMA_IS_DEFINED 1
#define PNG_NSJ_png_set_gAMA_fixed_IS_DEFINED 1
#endif

#ifdef PNG_hIST_SUPPORTED
#define PNG_NSJ_png_get_hIST_IS_DEFINED 1

#endif

#ifdef PNG_hIST_SUPPORTED
#define PNG_NSJ_png_set_hIST_IS_DEFINED 1

#endif

#define PNG_NSJ_png_get_IHDR_IS_DEFINED 1

#define PNG_NSJ_png_set_IHDR_IS_DEFINED 1

#ifdef PNG_oFFs_SUPPORTED
#define PNG_NSJ_png_get_oFFs_IS_DEFINED 1

#endif

#ifdef PNG_oFFs_SUPPORTED
#define PNG_NSJ_png_set_oFFs_IS_DEFINED 1

#endif

#ifdef PNG_pCAL_SUPPORTED
#define PNG_NSJ_png_get_pCAL_IS_DEFINED 1

#endif

#ifdef PNG_pCAL_SUPPORTED
#define PNG_NSJ_png_set_pCAL_IS_DEFINED 1

#endif

#ifdef PNG_pHYs_SUPPORTED
#define PNG_NSJ_png_get_pHYs_IS_DEFINED 1

#endif

#ifdef PNG_pHYs_SUPPORTED
#define PNG_NSJ_png_set_pHYs_IS_DEFINED 1

#endif

#define PNG_NSJ_png_get_PLTE_IS_DEFINED 1

#define PNG_NSJ_png_set_PLTE_IS_DEFINED 1

#ifdef PNG_sBIT_SUPPORTED
#define PNG_NSJ_png_get_sBIT_IS_DEFINED 1

#endif

#ifdef PNG_sBIT_SUPPORTED
#define PNG_NSJ_png_set_sBIT_IS_DEFINED 1

#endif

#ifdef PNG_sRGB_SUPPORTED
#define PNG_NSJ_png_get_sRGB_IS_DEFINED 1

#endif

#ifdef PNG_sRGB_SUPPORTED
#define PNG_NSJ_png_set_sRGB_IS_DEFINED 1

#define PNG_NSJ_png_set_sRGB_gAMA_and_cHRM_IS_DEFINED 1

#endif

#ifdef PNG_iCCP_SUPPORTED
#define PNG_NSJ_png_get_iCCP_IS_DEFINED 1

#endif

#ifdef PNG_iCCP_SUPPORTED
#define PNG_NSJ_png_set_iCCP_IS_DEFINED 1

#endif

#ifdef PNG_sPLT_SUPPORTED
#define PNG_NSJ_png_get_sPLT_IS_DEFINED 1

#endif

#ifdef PNG_sPLT_SUPPORTED
#define PNG_NSJ_png_set_sPLT_IS_DEFINED 1

#endif

#ifdef PNG_TEXT_SUPPORTED

#define PNG_NSJ_png_get_text_IS_DEFINED 1

#endif

#ifdef PNG_TEXT_SUPPORTED
#define PNG_NSJ_png_set_text_IS_DEFINED 1

#endif

#ifdef PNG_tIME_SUPPORTED
#define PNG_NSJ_png_get_tIME_IS_DEFINED 1

#endif

#ifdef PNG_tIME_SUPPORTED
#define PNG_NSJ_png_set_tIME_IS_DEFINED 1

#endif

#ifdef PNG_tRNS_SUPPORTED
#define PNG_NSJ_png_get_tRNS_IS_DEFINED 1

#endif

#ifdef PNG_tRNS_SUPPORTED
#define PNG_NSJ_png_set_tRNS_IS_DEFINED 1

#endif

#ifdef PNG_sCAL_SUPPORTED
#define PNG_NSJ_png_get_sCAL_IS_DEFINED 1
#ifdef PNG_FLOATING_ARITHMETIC_SUPPORTED

#define PNG_NSJ_png_get_sCAL_fixed_IS_DEFINED 1
#endif
#define PNG_NSJ_png_get_sCAL_s_IS_DEFINED 1

#define PNG_NSJ_png_set_sCAL_IS_DEFINED 1
#define PNG_NSJ_png_set_sCAL_fixed_IS_DEFINED 1
#define PNG_NSJ_png_set_sCAL_s_IS_DEFINED 1

#endif 

#ifdef PNG_HANDLE_AS_UNKNOWN_SUPPORTED

#define PNG_NSJ_png_set_keep_unknown_chunks_IS_DEFINED 1

#define PNG_NSJ_png_handle_as_unknown_IS_DEFINED 1

#endif
#ifdef PNG_UNKNOWN_CHUNKS_SUPPORTED
#define PNG_NSJ_png_set_unknown_chunks_IS_DEFINED 1

#define PNG_NSJ_png_set_unknown_chunk_location_IS_DEFINED 1

#define PNG_NSJ_png_get_unknown_chunks_IS_DEFINED 1

#endif

#define PNG_NSJ_png_set_invalid_IS_DEFINED 1

#ifdef PNG_INFO_IMAGE_SUPPORTED

#define PNG_NSJ_png_read_png_IS_DEFINED 1

#define PNG_NSJ_png_write_png_IS_DEFINED 1

#endif

#define PNG_NSJ_png_get_copyright_IS_DEFINED 1

#define PNG_NSJ_png_get_header_ver_IS_DEFINED 1

#define PNG_NSJ_png_get_header_version_IS_DEFINED 1

#define PNG_NSJ_png_get_libpng_ver_IS_DEFINED 1

#ifdef PNG_MNG_FEATURES_SUPPORTED
#define PNG_NSJ_png_permit_mng_features_IS_DEFINED 1

#endif

#ifdef PNG_ERROR_NUMBERS_SUPPORTED
#define PNG_NSJ_png_set_strip_error_numbers_IS_DEFINED 1

#endif

#ifdef PNG_SET_USER_LIMITS_SUPPORTED
#define PNG_NSJ_png_set_user_limits_IS_DEFINED 1

#define PNG_NSJ_png_get_user_width_max_IS_DEFINED 1

#define PNG_NSJ_png_get_user_height_max_IS_DEFINED 1

#define PNG_NSJ_png_set_chunk_cache_max_IS_DEFINED 1

#define PNG_NSJ_png_get_chunk_cache_max_IS_DEFINED 1

#define PNG_NSJ_png_set_chunk_malloc_max_IS_DEFINED 1

#define PNG_NSJ_png_get_chunk_malloc_max_IS_DEFINED 1

#endif

#if defined(PNG_INCH_CONVERSIONS_SUPPORTED)
#define PNG_NSJ_png_get_pixels_per_inch_IS_DEFINED 1

#define PNG_NSJ_png_get_x_pixels_per_inch_IS_DEFINED 1

#define PNG_NSJ_png_get_y_pixels_per_inch_IS_DEFINED 1

#define PNG_NSJ_png_get_x_offset_inches_IS_DEFINED 1
#ifdef PNG_FIXED_POINT_SUPPORTED 
#define PNG_NSJ_png_get_x_offset_inches_fixed_IS_DEFINED 1
#endif

#define PNG_NSJ_png_get_y_offset_inches_IS_DEFINED 1
#ifdef PNG_FIXED_POINT_SUPPORTED 
#define PNG_NSJ_png_get_y_offset_inches_fixed_IS_DEFINED 1
#endif

#  ifdef PNG_pHYs_SUPPORTED
#define PNG_NSJ_png_get_pHYs_dpi_IS_DEFINED 1

#  endif 
#endif  

#ifdef PNG_IO_STATE_SUPPORTED
#define PNG_NSJ_png_get_io_state_IS_DEFINED 1

#define PNG_NSJ_png_get_io_chunk_name_IS_DEFINED 1

#define PNG_NSJ_png_get_io_chunk_type_IS_DEFINED 1

#endif 

#ifdef PNG_READ_COMPOSITE_NODIV_SUPPORTED

 

#else  

#endif 

#ifdef PNG_READ_INT_FUNCTIONS_SUPPORTED
#define PNG_NSJ_png_get_uint_32_IS_DEFINED 1

#define PNG_NSJ_png_get_uint_16_IS_DEFINED 1

#define PNG_NSJ_png_get_int_32_IS_DEFINED 1

#endif

#define PNG_NSJ_png_get_uint_31_IS_DEFINED 1

#ifdef PNG_WRITE_INT_FUNCTIONS_SUPPORTED
#define PNG_NSJ_png_save_uint_32_IS_DEFINED 1

#endif
#ifdef PNG_SAVE_INT_32_SUPPORTED
#define PNG_NSJ_png_save_int_32_IS_DEFINED 1

#endif

#ifdef PNG_WRITE_INT_FUNCTIONS_SUPPORTED
#define PNG_NSJ_png_save_uint_16_IS_DEFINED 1

#endif

#ifdef PNG_USE_READ_MACROS

   

#endif

#if defined(PNG_READ_CHECK_FOR_INVALID_INDEX_SUPPORTED) || \
    defined(PNG_WRITE_CHECK_FOR_INVALID_INDEX_SUPPORTED)
#define PNG_NSJ_png_set_check_for_invalid_index_IS_DEFINED 1

#endif

#ifdef PNG_APNG_SUPPORTED
#define PNG_NSJ_png_get_acTL_IS_DEFINED 1

#define PNG_NSJ_png_set_acTL_IS_DEFINED 1

#define PNG_NSJ_png_get_num_frames_IS_DEFINED 1

#define PNG_NSJ_png_get_num_plays_IS_DEFINED 1

#define PNG_NSJ_png_get_next_frame_fcTL_IS_DEFINED 1

#define PNG_NSJ_png_set_next_frame_fcTL_IS_DEFINED 1

#define PNG_NSJ_png_get_next_frame_width_IS_DEFINED 1

#define PNG_NSJ_png_get_next_frame_height_IS_DEFINED 1

#define PNG_NSJ_png_get_next_frame_x_offset_IS_DEFINED 1

#define PNG_NSJ_png_get_next_frame_y_offset_IS_DEFINED 1

#define PNG_NSJ_png_get_next_frame_delay_num_IS_DEFINED 1

#define PNG_NSJ_png_get_next_frame_delay_den_IS_DEFINED 1

#define PNG_NSJ_png_get_next_frame_dispose_op_IS_DEFINED 1

#define PNG_NSJ_png_get_next_frame_blend_op_IS_DEFINED 1

#define PNG_NSJ_png_get_first_frame_is_hidden_IS_DEFINED 1

#define PNG_NSJ_png_set_first_frame_is_hidden_IS_DEFINED 1

#ifdef PNG_READ_APNG_SUPPORTED
#define PNG_NSJ_png_read_frame_head_IS_DEFINED 1

#ifdef PNG_PROGRESSIVE_READ_SUPPORTED
#define PNG_NSJ_png_set_progressive_frame_fn_IS_DEFINED 1

#endif 
#endif 

#ifdef PNG_WRITE_APNG_SUPPORTED
#define PNG_NSJ_png_write_frame_head_IS_DEFINED 1

#define PNG_NSJ_png_write_frame_tail_IS_DEFINED 1

#endif 
#endif 

#ifdef PNG_EXPORT_LAST_ORDINAL
#ifdef PNG_APNG_SUPPORTED
  
#else
  
#endif 
#endif

#endif 

    

  

    

       

 

void png_nsj_set_sig_bytes(d_png_structp png_ptr, int num_bytes)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_sig_bytes_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_sig_bytes(png_ptr->png_ptr, num_bytes);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_size_t png_nsj_get_compression_buffer_size(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_compression_buffer_size_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_compression_buffer_size(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_compression_buffer_size(d_png_structp png_ptr,
    png_size_t size)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_compression_buffer_size_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_compression_buffer_size(png_ptr->png_ptr, size);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

int png_nsj_reset_zstream(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_reset_zstream_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_reset_zstream(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_write_sig(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_sig_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_sig(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_chunk(d_png_structp png_ptr, png_const_bytep
    chunk_name, png_const_bytep data, png_size_t length)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_chunk_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_chunk(png_ptr->png_ptr, chunk_name, data, length);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_chunk_start(d_png_structp png_ptr,
    png_const_bytep chunk_name, png_uint_32 length)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_chunk_start_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_chunk_start(png_ptr->png_ptr, chunk_name, length);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_chunk_data(d_png_structp png_ptr,
    png_const_bytep data, png_size_t length)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_chunk_data_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_chunk_data(png_ptr->png_ptr, data, length);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_chunk_end(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_chunk_end_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_chunk_end(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_infop png_nsj_create_info_struct(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_create_info_struct_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_create_info_struct(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_write_info_before_PLTE(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_info_before_PLTE_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_info_before_PLTE(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_info(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_info_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_info(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_read_info(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_read_info_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_read_info(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_const_charp png_nsj_convert_to_rfc1123(d_png_structp png_ptr,
    png_const_timep ptime)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_convert_to_rfc1123_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_convert_to_rfc1123(png_ptr->png_ptr, ptime);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_convert_from_struct_tm(d_png_glue_struct *d_context, png_timep ptime,
    PNG_CONST struct tm FAR * ttime)
{
#   if PNG_NSJ_png_convert_from_struct_tm_IS_DEFINED == 1
        png_nsj_clear_errors(d_context);
        png_convert_from_struct_tm(ptime, ttime);
#   else
        png_nsj_set_missing_fn_err(d_context);
        return;
#   endif
}

void png_nsj_convert_from_time_t(d_png_glue_struct *d_context, png_timep ptime, time_t ttime)
{
#   if PNG_NSJ_png_convert_from_time_t_IS_DEFINED == 1
        png_nsj_clear_errors(d_context);
        png_convert_from_time_t(ptime, ttime);
#   else
        png_nsj_set_missing_fn_err(d_context);
        return;
#   endif
}

void png_nsj_set_expand(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_expand_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_expand(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_expand_gray_1_2_4_to_8(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_expand_gray_1_2_4_to_8_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_expand_gray_1_2_4_to_8(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_palette_to_rgb(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_palette_to_rgb_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_palette_to_rgb(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_tRNS_to_alpha(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_tRNS_to_alpha_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_tRNS_to_alpha(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_expand_16(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_expand_16_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_expand_16(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_bgr(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_bgr_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_bgr(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_gray_to_rgb(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_gray_to_rgb_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_gray_to_rgb(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_rgb_to_gray(d_png_structp png_ptr,
    int error_action, double red, double green)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_rgb_to_gray_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_rgb_to_gray(png_ptr->png_ptr, error_action, red, green);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_rgb_to_gray_fixed(d_png_structp png_ptr,
    int error_action, png_fixed_point red, png_fixed_point green)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_rgb_to_gray_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_rgb_to_gray_fixed(png_ptr->png_ptr, error_action, red, green);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
png_byte png_nsj_get_rgb_to_gray_status(d_png_structp
    png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_rgb_to_gray_status_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_rgb_to_gray_status(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_build_grayscale_palette(d_png_glue_struct *d_context, int bit_depth,
    png_colorp palette)
{
#   if PNG_NSJ_png_build_grayscale_palette_IS_DEFINED == 1
        png_nsj_clear_errors(d_context);
        png_build_grayscale_palette(bit_depth, palette);
#   else
        png_nsj_set_missing_fn_err(d_context);
        return;
#   endif
}

void png_nsj_set_alpha_mode(d_png_structp png_ptr, int mode,
    double output_gamma)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_alpha_mode_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_alpha_mode(png_ptr->png_ptr, mode, output_gamma);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_alpha_mode_fixed(d_png_structp png_ptr,
    int mode, png_fixed_point output_gamma)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_alpha_mode_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_alpha_mode_fixed(png_ptr->png_ptr, mode, output_gamma);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_strip_alpha(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_strip_alpha_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_strip_alpha(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_swap_alpha(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_swap_alpha_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_swap_alpha(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_invert_alpha(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_invert_alpha_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_invert_alpha(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_filler(d_png_structp png_ptr, png_uint_32 filler,
    int flags)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_filler_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_filler(png_ptr->png_ptr, filler, flags);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_add_alpha(d_png_structp png_ptr, png_uint_32 filler,
    int flags)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_add_alpha_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_add_alpha(png_ptr->png_ptr, filler, flags);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_swap(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_swap_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_swap(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_packing(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_packing_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_packing(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_packswap(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_packswap_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_packswap(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_shift(d_png_structp png_ptr, png_const_color_8p
    true_bits)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_shift_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_shift(png_ptr->png_ptr, true_bits);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

int png_nsj_set_interlace_handling(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_interlace_handling_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_set_interlace_handling(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_invert_mono(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_invert_mono_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_invert_mono(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_background(d_png_structp png_ptr,
    png_const_color_16p background_color, int background_gamma_code,
    int need_expand, double background_gamma)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_background_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_background(png_ptr->png_ptr, background_color, background_gamma_code, need_expand, background_gamma);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_background_fixed(d_png_structp png_ptr,
    png_const_color_16p background_color, int background_gamma_code,
    int need_expand, png_fixed_point background_gamma)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_background_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_background_fixed(png_ptr->png_ptr, background_color, background_gamma_code, need_expand, background_gamma);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_scale_16(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_scale_16_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_scale_16(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_strip_16(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_strip_16_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_strip_16(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_quantize(d_png_structp png_ptr, png_colorp palette,
    int num_palette, int maximum_colors, png_const_uint_16p histogram,
    int full_quantize)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_quantize_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_quantize(png_ptr->png_ptr, palette, num_palette, maximum_colors, histogram, full_quantize);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_gamma(d_png_structp png_ptr, double screen_gamma,
    double override_file_gamma)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_gamma_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_gamma(png_ptr->png_ptr, screen_gamma, override_file_gamma);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_gamma_fixed(d_png_structp png_ptr,
    png_fixed_point screen_gamma, png_fixed_point override_file_gamma)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_gamma_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_gamma_fixed(png_ptr->png_ptr, screen_gamma, override_file_gamma);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_flush(d_png_structp png_ptr, int nrows)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_flush_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_flush(png_ptr->png_ptr, nrows);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_flush(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_flush_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_flush(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_start_read_image(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_start_read_image_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_start_read_image(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_read_update_info(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_read_update_info_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_read_update_info(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_read_rows(d_png_structp png_ptr, png_bytepp row,
    png_bytepp display_row, png_uint_32 num_rows)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_read_rows_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_read_rows(png_ptr->png_ptr, row, display_row, num_rows);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_read_row(d_png_structp png_ptr, png_bytep row,
    png_bytep display_row)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_read_row_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_read_row(png_ptr->png_ptr, row, display_row);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_read_image(d_png_structp png_ptr, png_bytepp image)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_read_image_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_read_image(png_ptr->png_ptr, image);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_row(d_png_structp png_ptr, png_const_bytep row)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_row_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_row(png_ptr->png_ptr, row);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_rows(d_png_structp png_ptr, png_bytepp row,
    png_uint_32 num_rows)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_rows_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_rows(png_ptr->png_ptr, row, num_rows);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_image(d_png_structp png_ptr, png_bytepp image)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_image_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_image(png_ptr->png_ptr, image);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_end(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_end_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_end(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_read_end(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_read_end_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_read_end(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_destroy_info_struct(d_png_structp png_ptr,
    png_infopp info_ptr_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_destroy_info_struct_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_destroy_info_struct(png_ptr->png_ptr, info_ptr_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_crc_action(d_png_structp png_ptr, int crit_action, int ancil_action)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_crc_action_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_crc_action(png_ptr->png_ptr, crit_action, ancil_action);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_filter(d_png_structp png_ptr, int method, int filters)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_filter_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_filter(png_ptr->png_ptr, method, filters);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_filter_heuristics(d_png_structp png_ptr,
    int heuristic_method, int num_weights, png_const_doublep filter_weights,
    png_const_doublep filter_costs)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_filter_heuristics_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_filter_heuristics(png_ptr->png_ptr, heuristic_method, num_weights, filter_weights, filter_costs);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_filter_heuristics_fixed(d_png_structp png_ptr,
    int heuristic_method, int num_weights, png_const_fixed_point_p
    filter_weights, png_const_fixed_point_p filter_costs)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_filter_heuristics_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_filter_heuristics_fixed(png_ptr->png_ptr, heuristic_method, num_weights, filter_weights, filter_costs);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_compression_level(d_png_structp png_ptr, int level)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_compression_level_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_compression_level(png_ptr->png_ptr, level);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_compression_mem_level(d_png_structp png_ptr,
    int mem_level)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_compression_mem_level_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_compression_mem_level(png_ptr->png_ptr, mem_level);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_compression_strategy(d_png_structp png_ptr,
    int strategy)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_compression_strategy_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_compression_strategy(png_ptr->png_ptr, strategy);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_compression_window_bits(d_png_structp png_ptr,
    int window_bits)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_compression_window_bits_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_compression_window_bits(png_ptr->png_ptr, window_bits);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_compression_method(d_png_structp png_ptr,
    int method)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_compression_method_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_compression_method(png_ptr->png_ptr, method);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_text_compression_level(d_png_structp png_ptr, int level)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_text_compression_level_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_text_compression_level(png_ptr->png_ptr, level);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_text_compression_mem_level(d_png_structp png_ptr,
    int mem_level)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_text_compression_mem_level_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_text_compression_mem_level(png_ptr->png_ptr, mem_level);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_text_compression_strategy(d_png_structp png_ptr,
    int strategy)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_text_compression_strategy_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_text_compression_strategy(png_ptr->png_ptr, strategy);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_text_compression_window_bits(d_png_structp
    png_ptr, int window_bits)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_text_compression_window_bits_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_text_compression_window_bits(png_ptr->png_ptr, window_bits);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_text_compression_method(d_png_structp png_ptr,
    int method)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_text_compression_method_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_text_compression_method(png_ptr->png_ptr, method);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_init_io(d_png_structp png_ptr, png_FILE_p fp)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_init_io_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_init_io(png_ptr->png_ptr, fp);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_voidp png_nsj_get_error_ptr(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_error_ptr_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_error_ptr(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_write_fn(d_png_structp png_ptr, png_voidp io_ptr,
    png_rw_ptr write_data_fn, png_flush_ptr output_flush_fn)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_write_fn_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_write_fn(png_ptr->png_ptr, io_ptr, write_data_fn, output_flush_fn);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_read_fn(d_png_structp png_ptr, png_voidp io_ptr,
    png_rw_ptr read_data_fn)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_read_fn_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_read_fn(png_ptr->png_ptr, io_ptr, read_data_fn);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_voidp png_nsj_get_io_ptr(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_io_ptr_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_io_ptr(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_read_status_fn(d_png_structp png_ptr,
    png_read_status_ptr read_row_fn)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_read_status_fn_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_read_status_fn(png_ptr->png_ptr, read_row_fn);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_write_status_fn(d_png_structp png_ptr,
    png_write_status_ptr write_row_fn)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_write_status_fn_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_write_status_fn(png_ptr->png_ptr, write_row_fn);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_mem_fn(d_png_structp png_ptr, png_voidp mem_ptr,
    png_malloc_ptr malloc_fn, png_free_ptr free_fn)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_mem_fn_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_mem_fn(png_ptr->png_ptr, mem_ptr, malloc_fn, free_fn);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_voidp png_nsj_get_mem_ptr(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_mem_ptr_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_mem_ptr(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_read_user_transform_fn(d_png_structp png_ptr,
    png_user_transform_ptr read_user_transform_fn)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_read_user_transform_fn_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_read_user_transform_fn(png_ptr->png_ptr, read_user_transform_fn);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_write_user_transform_fn(d_png_structp png_ptr,
    png_user_transform_ptr write_user_transform_fn)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_write_user_transform_fn_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_write_user_transform_fn(png_ptr->png_ptr, write_user_transform_fn);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_user_transform_info(d_png_structp png_ptr,
    png_voidp user_transform_ptr, int user_transform_depth,
    int user_transform_channels)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_user_transform_info_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_user_transform_info(png_ptr->png_ptr, user_transform_ptr, user_transform_depth, user_transform_channels);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_voidp png_nsj_get_user_transform_ptr(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_user_transform_ptr_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_user_transform_ptr(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_current_row_number(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_current_row_number_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_current_row_number(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_byte png_nsj_get_current_pass_number(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_current_pass_number_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_current_pass_number(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_read_user_chunk_fn(d_png_structp png_ptr,
    png_voidp user_chunk_ptr, png_user_chunk_ptr read_user_chunk_fn)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_read_user_chunk_fn_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_read_user_chunk_fn(png_ptr->png_ptr, user_chunk_ptr, read_user_chunk_fn);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_voidp png_nsj_get_user_chunk_ptr(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_user_chunk_ptr_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_user_chunk_ptr(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_progressive_read_fn(d_png_structp png_ptr,
    png_voidp progressive_ptr, png_progressive_info_ptr info_fn,
    png_progressive_row_ptr row_fn, png_progressive_end_ptr end_fn)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_progressive_read_fn_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_progressive_read_fn(png_ptr->png_ptr, progressive_ptr, info_fn, row_fn, end_fn);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_voidp png_nsj_get_progressive_ptr(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_progressive_ptr_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_progressive_ptr(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_process_data(d_png_structp png_ptr, png_infop info_ptr,
    png_bytep buffer, png_size_t buffer_size)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_process_data_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_process_data(png_ptr->png_ptr, info_ptr, buffer, buffer_size);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_size_t png_nsj_process_data_pause(d_png_structp png_ptr, int save)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_process_data_pause_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_process_data_pause(png_ptr->png_ptr, save);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_process_data_skip(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_process_data_skip_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_process_data_skip(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_progressive_combine_row(d_png_structp png_ptr,
    png_bytep old_row, png_const_bytep new_row)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_progressive_combine_row_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_progressive_combine_row(png_ptr->png_ptr, old_row, new_row);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_voidp png_nsj_malloc(d_png_structp png_ptr, png_alloc_size_t size)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_malloc_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_malloc(png_ptr->png_ptr, size);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_voidp png_nsj_calloc(d_png_structp png_ptr, png_alloc_size_t size)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_calloc_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_calloc(png_ptr->png_ptr, size);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_voidp png_nsj_malloc_warn(d_png_structp png_ptr,
    png_alloc_size_t size)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_malloc_warn_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_malloc_warn(png_ptr->png_ptr, size);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_free(d_png_structp png_ptr, png_voidp ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_free_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_free(png_ptr->png_ptr, ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_free_data(d_png_structp png_ptr, png_infop info_ptr, png_uint_32 free_me, int num)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_free_data_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_free_data(png_ptr->png_ptr, info_ptr, free_me, num);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_data_freer(d_png_structp png_ptr, png_infop info_ptr, int freer, png_uint_32 mask)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_data_freer_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_data_freer(png_ptr->png_ptr, info_ptr, freer, mask);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_voidp png_nsj_malloc_default(d_png_structp png_ptr,
    png_alloc_size_t size)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_malloc_default_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_malloc_default(png_ptr->png_ptr, size);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_free_default(d_png_structp png_ptr, png_voidp ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_free_default_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_free_default(png_ptr->png_ptr, ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_error(d_png_structp png_ptr, png_const_charp error_message)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_error_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_error(png_ptr->png_ptr, error_message);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_chunk_error(d_png_structp png_ptr,
    png_const_charp error_message)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_chunk_error_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_chunk_error(png_ptr->png_ptr, error_message);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_err(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_err_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_err(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_warning(d_png_structp png_ptr,
    png_const_charp warning_message)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_warning_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_warning(png_ptr->png_ptr, warning_message);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_chunk_warning(d_png_structp png_ptr,
    png_const_charp warning_message)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_chunk_warning_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_chunk_warning(png_ptr->png_ptr, warning_message);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_valid(d_png_structp png_ptr, png_const_infop info_ptr,
    png_uint_32 flag)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_valid_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_valid(png_ptr->png_ptr, info_ptr, flag);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_size_t png_nsj_get_rowbytes(d_png_structp png_ptr,
    png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_rowbytes_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_rowbytes(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_bytepp png_nsj_get_rows(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_rows_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_rows(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_rows(d_png_structp png_ptr,
    png_infop info_ptr, png_bytepp row_pointers)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_rows_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_rows(png_ptr->png_ptr, info_ptr, row_pointers);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_byte png_nsj_get_channels(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_channels_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_channels(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_image_width(d_png_structp png_ptr,
    png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_image_width_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_image_width(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_image_height(d_png_structp png_ptr,
    png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_image_height_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_image_height(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_byte png_nsj_get_bit_depth(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_bit_depth_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_bit_depth(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_byte png_nsj_get_color_type(d_png_structp png_ptr,
    png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_color_type_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_color_type(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_byte png_nsj_get_filter_type(d_png_structp png_ptr,
    png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_filter_type_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_filter_type(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_byte png_nsj_get_interlace_type(d_png_structp png_ptr,
    png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_interlace_type_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_interlace_type(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_byte png_nsj_get_compression_type(d_png_structp png_ptr,
    png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_compression_type_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_compression_type(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_pixels_per_meter(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_pixels_per_meter_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_pixels_per_meter(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_x_pixels_per_meter(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_x_pixels_per_meter_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_x_pixels_per_meter(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_y_pixels_per_meter(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_y_pixels_per_meter_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_y_pixels_per_meter(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

float png_nsj_get_pixel_aspect_ratio(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_pixel_aspect_ratio_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_pixel_aspect_ratio(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
png_fixed_point png_nsj_get_pixel_aspect_ratio_fixed(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_pixel_aspect_ratio_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_pixel_aspect_ratio_fixed(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
png_int_32 png_nsj_get_x_offset_pixels(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_x_offset_pixels_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_x_offset_pixels(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_int_32 png_nsj_get_y_offset_pixels(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_y_offset_pixels_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_y_offset_pixels(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_int_32 png_nsj_get_x_offset_microns(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_x_offset_microns_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_x_offset_microns(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_int_32 png_nsj_get_y_offset_microns(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_y_offset_microns_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_y_offset_microns(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_const_bytep png_nsj_get_signature(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_signature_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_signature(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_bKGD(d_png_structp png_ptr, png_infop info_ptr,
    png_color_16p *background)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_bKGD_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_bKGD(png_ptr->png_ptr, info_ptr, background);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_bKGD(d_png_structp png_ptr, png_infop info_ptr,
    png_const_color_16p background)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_bKGD_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_bKGD(png_ptr->png_ptr, info_ptr, background);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_cHRM(d_png_structp png_ptr,
   png_const_infop info_ptr, double *white_x, double *white_y, double *red_x,
    double *red_y, double *green_x, double *green_y, double *blue_x,
    double *blue_y)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_cHRM_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_cHRM(png_ptr->png_ptr, info_ptr, white_x, white_y, red_x, red_y, green_x, green_y, blue_x, blue_y);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
png_uint_32 png_nsj_get_cHRM_XYZ(d_png_structp png_ptr,
    png_const_infop info_ptr, double *red_X, double *red_Y, double *red_Z,
    double *green_X, double *green_Y, double *green_Z, double *blue_X,
    double *blue_Y, double *blue_Z)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_cHRM_XYZ_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_cHRM_XYZ(png_ptr->png_ptr, info_ptr, red_X, red_Y, red_Z, green_X, green_Y, green_Z, blue_X, blue_Y, blue_Z);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
png_uint_32 png_nsj_get_cHRM_fixed(d_png_structp png_ptr,
    png_const_infop info_ptr, png_fixed_point *int_white_x,
    png_fixed_point *int_white_y, png_fixed_point *int_red_x,
    png_fixed_point *int_red_y, png_fixed_point *int_green_x,
    png_fixed_point *int_green_y, png_fixed_point *int_blue_x,
    png_fixed_point *int_blue_y)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_cHRM_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_cHRM_fixed(png_ptr->png_ptr, info_ptr, int_white_x, int_white_y, int_red_x, int_red_y, int_green_x, int_green_y, int_blue_x, int_blue_y);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
png_uint_32 png_nsj_get_cHRM_XYZ_fixed(d_png_structp png_ptr, png_const_infop info_ptr,
    png_fixed_point *int_red_X, png_fixed_point *int_red_Y,
    png_fixed_point *int_red_Z, png_fixed_point *int_green_X,
    png_fixed_point *int_green_Y, png_fixed_point *int_green_Z,
    png_fixed_point *int_blue_X, png_fixed_point *int_blue_Y,
    png_fixed_point *int_blue_Z)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_cHRM_XYZ_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_cHRM_XYZ_fixed(png_ptr->png_ptr, info_ptr, int_red_X, int_red_Y, int_red_Z, int_green_X, int_green_Y, int_green_Z, int_blue_X, int_blue_Y, int_blue_Z);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
void png_nsj_set_cHRM(d_png_structp png_ptr, png_infop info_ptr,
    double white_x, double white_y, double red_x, double red_y, double green_x,
    double green_y, double blue_x, double blue_y)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_cHRM_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_cHRM(png_ptr->png_ptr, info_ptr, white_x, white_y, red_x, red_y, green_x, green_y, blue_x, blue_y);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_cHRM_XYZ(d_png_structp png_ptr,
    png_infop info_ptr, double red_X, double red_Y, double red_Z,
    double green_X, double green_Y, double green_Z, double blue_X,
    double blue_Y, double blue_Z)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_cHRM_XYZ_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_cHRM_XYZ(png_ptr->png_ptr, info_ptr, red_X, red_Y, red_Z, green_X, green_Y, green_Z, blue_X, blue_Y, blue_Z);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_cHRM_fixed(d_png_structp png_ptr,
    png_infop info_ptr, png_fixed_point int_white_x,
    png_fixed_point int_white_y, png_fixed_point int_red_x,
    png_fixed_point int_red_y, png_fixed_point int_green_x,
    png_fixed_point int_green_y, png_fixed_point int_blue_x,
    png_fixed_point int_blue_y)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_cHRM_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_cHRM_fixed(png_ptr->png_ptr, info_ptr, int_white_x, int_white_y, int_red_x, int_red_y, int_green_x, int_green_y, int_blue_x, int_blue_y);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_cHRM_XYZ_fixed(d_png_structp png_ptr,
    png_infop info_ptr, png_fixed_point int_red_X, png_fixed_point int_red_Y,
    png_fixed_point int_red_Z, png_fixed_point int_green_X,
    png_fixed_point int_green_Y, png_fixed_point int_green_Z,
    png_fixed_point int_blue_X, png_fixed_point int_blue_Y,
    png_fixed_point int_blue_Z)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_cHRM_XYZ_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_cHRM_XYZ_fixed(png_ptr->png_ptr, info_ptr, int_red_X, int_red_Y, int_red_Z, int_green_X, int_green_Y, int_green_Z, int_blue_X, int_blue_Y, int_blue_Z);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
png_uint_32 png_nsj_get_gAMA(d_png_structp png_ptr, png_const_infop info_ptr,
    double *file_gamma)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_gAMA_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_gAMA(png_ptr->png_ptr, info_ptr, file_gamma);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
png_uint_32 png_nsj_get_gAMA_fixed(d_png_structp png_ptr, png_const_infop info_ptr,
    png_fixed_point *int_file_gamma)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_gAMA_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_gAMA_fixed(png_ptr->png_ptr, info_ptr, int_file_gamma);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
void png_nsj_set_gAMA(d_png_structp png_ptr,
    png_infop info_ptr, double file_gamma)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_gAMA_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_gAMA(png_ptr->png_ptr, info_ptr, file_gamma);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_gAMA_fixed(d_png_structp png_ptr,
    png_infop info_ptr, png_fixed_point int_file_gamma)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_gAMA_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_gAMA_fixed(png_ptr->png_ptr, info_ptr, int_file_gamma);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
png_uint_32 png_nsj_get_hIST(d_png_structp png_ptr, png_const_infop info_ptr,
    png_uint_16p *hist)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_hIST_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_hIST(png_ptr->png_ptr, info_ptr, hist);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_hIST(d_png_structp png_ptr,
    png_infop info_ptr, png_const_uint_16p hist)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_hIST_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_hIST(png_ptr->png_ptr, info_ptr, hist);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_IHDR(d_png_structp png_ptr, png_infop info_ptr,
    png_uint_32 *width, png_uint_32 *height, int *bit_depth, int *color_type,
    int *interlace_method, int *compression_method, int *filter_method)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_IHDR_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_IHDR(png_ptr->png_ptr, info_ptr, width, height, bit_depth, color_type, interlace_method, compression_method, filter_method);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_IHDR(d_png_structp png_ptr, png_infop info_ptr,
    png_uint_32 width, png_uint_32 height, int bit_depth, int color_type,
    int interlace_method, int compression_method, int filter_method)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_IHDR_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_IHDR(png_ptr->png_ptr, info_ptr, width, height, bit_depth, color_type, interlace_method, compression_method, filter_method);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_oFFs(d_png_structp png_ptr, png_const_infop info_ptr,
    png_int_32 *offset_x, png_int_32 *offset_y, int *unit_type)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_oFFs_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_oFFs(png_ptr->png_ptr, info_ptr, offset_x, offset_y, unit_type);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_oFFs(d_png_structp png_ptr, png_infop info_ptr,
    png_int_32 offset_x, png_int_32 offset_y, int unit_type)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_oFFs_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_oFFs(png_ptr->png_ptr, info_ptr, offset_x, offset_y, unit_type);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_pCAL(d_png_structp png_ptr, png_const_infop info_ptr,
    png_charp *purpose, png_int_32 *X0, png_int_32 *X1, int *type,
    int *nparams,
    png_charp *units, png_charpp *params)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_pCAL_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_pCAL(png_ptr->png_ptr, info_ptr, purpose, X0, X1, type, nparams, units, params);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_pCAL(d_png_structp png_ptr,
    png_infop info_ptr,
    png_const_charp purpose, png_int_32 X0, png_int_32 X1, int type,
    int nparams, png_const_charp units, png_charpp params)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_pCAL_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_pCAL(png_ptr->png_ptr, info_ptr, purpose, X0, X1, type, nparams, units, params);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_pHYs(d_png_structp png_ptr, png_const_infop info_ptr,
    png_uint_32 *res_x, png_uint_32 *res_y, int *unit_type)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_pHYs_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_pHYs(png_ptr->png_ptr, info_ptr, res_x, res_y, unit_type);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_pHYs(d_png_structp png_ptr, png_infop info_ptr,
    png_uint_32 res_x, png_uint_32 res_y, int unit_type)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_pHYs_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_pHYs(png_ptr->png_ptr, info_ptr, res_x, res_y, unit_type);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_PLTE(d_png_structp png_ptr, png_const_infop info_ptr,
    png_colorp *palette, int *num_palette)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_PLTE_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_PLTE(png_ptr->png_ptr, info_ptr, palette, num_palette);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_PLTE(d_png_structp png_ptr, png_infop info_ptr,
    png_const_colorp palette, int num_palette)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_PLTE_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_PLTE(png_ptr->png_ptr, info_ptr, palette, num_palette);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_sBIT(d_png_structp png_ptr, png_infop info_ptr,
    png_color_8p *sig_bit)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_sBIT_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_sBIT(png_ptr->png_ptr, info_ptr, sig_bit);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_sBIT(d_png_structp png_ptr, png_infop info_ptr, png_const_color_8p sig_bit)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_sBIT_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_sBIT(png_ptr->png_ptr, info_ptr, sig_bit);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_sRGB(d_png_structp png_ptr,
    png_const_infop info_ptr, int *file_srgb_intent)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_sRGB_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_sRGB(png_ptr->png_ptr, info_ptr, file_srgb_intent);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_sRGB(d_png_structp png_ptr, png_infop info_ptr, int srgb_intent)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_sRGB_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_sRGB(png_ptr->png_ptr, info_ptr, srgb_intent);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_sRGB_gAMA_and_cHRM(d_png_structp png_ptr,
    png_infop info_ptr, int srgb_intent)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_sRGB_gAMA_and_cHRM_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_sRGB_gAMA_and_cHRM(png_ptr->png_ptr, info_ptr, srgb_intent);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_iCCP(d_png_structp png_ptr, png_const_infop info_ptr,
    png_charpp name, int *compression_type, png_bytepp profile,
    png_uint_32 *proflen)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_iCCP_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_iCCP(png_ptr->png_ptr, info_ptr, name, compression_type, profile, proflen);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_iCCP(d_png_structp png_ptr, png_infop info_ptr,
    png_const_charp name, int compression_type, png_const_bytep profile,
    png_uint_32 proflen)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_iCCP_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_iCCP(png_ptr->png_ptr, info_ptr, name, compression_type, profile, proflen);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_sPLT(d_png_structp png_ptr, png_const_infop info_ptr,
    png_sPLT_tpp entries)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_sPLT_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_sPLT(png_ptr->png_ptr, info_ptr, entries);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_sPLT(d_png_structp png_ptr, png_infop info_ptr,
    png_const_sPLT_tp entries, int nentries)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_sPLT_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_sPLT(png_ptr->png_ptr, info_ptr, entries, nentries);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_text(d_png_structp png_ptr, png_const_infop info_ptr,
    png_textp *text_ptr, int *num_text)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_text_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_text(png_ptr->png_ptr, info_ptr, text_ptr, num_text);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_text(d_png_structp png_ptr, png_infop info_ptr,
    png_const_textp text_ptr, int num_text)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_text_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_text(png_ptr->png_ptr, info_ptr, text_ptr, num_text);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_tIME(d_png_structp png_ptr, png_infop info_ptr, png_timep *mod_time)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_tIME_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_tIME(png_ptr->png_ptr, info_ptr, mod_time);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_tIME(d_png_structp png_ptr, png_infop info_ptr, png_const_timep mod_time)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_tIME_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_tIME(png_ptr->png_ptr, info_ptr, mod_time);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_tRNS(d_png_structp png_ptr, png_infop info_ptr,
    png_bytep *trans_alpha, int *num_trans, png_color_16p *trans_color)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_tRNS_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_tRNS(png_ptr->png_ptr, info_ptr, trans_alpha, num_trans, trans_color);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_tRNS(d_png_structp png_ptr, png_infop info_ptr,
    png_const_bytep trans_alpha, int num_trans,
    png_const_color_16p trans_color)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_tRNS_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_tRNS(png_ptr->png_ptr, info_ptr, trans_alpha, num_trans, trans_color);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_sCAL(d_png_structp png_ptr, png_const_infop info_ptr,
    int *unit, double *width, double *height)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_sCAL_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_sCAL(png_ptr->png_ptr, info_ptr, unit, width, height);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
png_uint_32 png_nsj_get_sCAL_fixed(d_png_structp png_ptr, png_const_infop info_ptr, int *unit,
    png_fixed_point *width,
    png_fixed_point *height)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_sCAL_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_sCAL_fixed(png_ptr->png_ptr, info_ptr, unit, width, height);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
png_uint_32 png_nsj_get_sCAL_s(d_png_structp png_ptr, png_const_infop info_ptr,
    int *unit, png_charpp swidth, png_charpp sheight)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_sCAL_s_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_sCAL_s(png_ptr->png_ptr, info_ptr, unit, swidth, sheight);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_sCAL(d_png_structp png_ptr, png_infop info_ptr,
    int unit, double width, double height)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_sCAL_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_sCAL(png_ptr->png_ptr, info_ptr, unit, width, height);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_sCAL_fixed(d_png_structp png_ptr,
   png_infop info_ptr, int unit, png_fixed_point width,
   png_fixed_point height)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_sCAL_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_sCAL_fixed(png_ptr->png_ptr, info_ptr, unit, width, height);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}
void png_nsj_set_sCAL_s(d_png_structp png_ptr, png_infop info_ptr,
    int unit, png_const_charp swidth, png_const_charp sheight)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_sCAL_s_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_sCAL_s(png_ptr->png_ptr, info_ptr, unit, swidth, sheight);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_keep_unknown_chunks(d_png_structp png_ptr, int keep,
    png_const_bytep chunk_list, int num_chunks)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_keep_unknown_chunks_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_keep_unknown_chunks(png_ptr->png_ptr, keep, chunk_list, num_chunks);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

int png_nsj_handle_as_unknown(d_png_structp png_ptr,
    png_const_bytep chunk_name)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_handle_as_unknown_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_handle_as_unknown(png_ptr->png_ptr, chunk_name);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_unknown_chunks(d_png_structp png_ptr,
    png_infop info_ptr, png_const_unknown_chunkp unknowns,
    int num_unknowns)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_unknown_chunks_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_unknown_chunks(png_ptr->png_ptr, info_ptr, unknowns, num_unknowns);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_unknown_chunk_location(d_png_structp png_ptr, png_infop info_ptr, int chunk, int location)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_unknown_chunk_location_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_unknown_chunk_location(png_ptr->png_ptr, info_ptr, chunk, location);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

int png_nsj_get_unknown_chunks(d_png_structp png_ptr,
    png_const_infop info_ptr, png_unknown_chunkpp entries)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_unknown_chunks_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_unknown_chunks(png_ptr->png_ptr, info_ptr, entries);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_invalid(d_png_structp png_ptr, png_infop info_ptr, int mask)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_invalid_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_invalid(png_ptr->png_ptr, info_ptr, mask);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_read_png(d_png_structp png_ptr, png_infop info_ptr,
    int transforms, png_voidp params)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_read_png_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_read_png(png_ptr->png_ptr, info_ptr, transforms, params);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_png(d_png_structp png_ptr, png_infop info_ptr,
    int transforms, png_voidp params)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_png_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_png(png_ptr->png_ptr, info_ptr, transforms, params);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_const_charp png_nsj_get_copyright(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_copyright_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_copyright(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_const_charp png_nsj_get_header_ver(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_header_ver_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_header_ver(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_const_charp png_nsj_get_header_version(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_header_version_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_header_version(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_const_charp png_nsj_get_libpng_ver(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_libpng_ver_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_libpng_ver(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_permit_mng_features(d_png_structp png_ptr,
    png_uint_32 mng_features_permitted)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_permit_mng_features_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_permit_mng_features(png_ptr->png_ptr, mng_features_permitted);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_strip_error_numbers(d_png_structp png_ptr,
    png_uint_32 strip_mode)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_strip_error_numbers_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_strip_error_numbers(png_ptr->png_ptr, strip_mode);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_user_limits(d_png_structp png_ptr,
    png_uint_32 user_width_max, png_uint_32 user_height_max)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_user_limits_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_user_limits(png_ptr->png_ptr, user_width_max, user_height_max);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_user_width_max(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_user_width_max_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_user_width_max(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_user_height_max(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_user_height_max_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_user_height_max(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_chunk_cache_max(d_png_structp png_ptr,
    png_uint_32 user_chunk_cache_max)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_chunk_cache_max_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_chunk_cache_max(png_ptr->png_ptr, user_chunk_cache_max);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_chunk_cache_max(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_chunk_cache_max_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_chunk_cache_max(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_set_chunk_malloc_max(d_png_structp png_ptr,
    png_alloc_size_t user_chunk_cache_max)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_chunk_malloc_max_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_chunk_malloc_max(png_ptr->png_ptr, user_chunk_cache_max);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_alloc_size_t png_nsj_get_chunk_malloc_max(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_chunk_malloc_max_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_chunk_malloc_max(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_pixels_per_inch(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_pixels_per_inch_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_pixels_per_inch(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_x_pixels_per_inch(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_x_pixels_per_inch_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_x_pixels_per_inch(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_y_pixels_per_inch(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_y_pixels_per_inch_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_y_pixels_per_inch(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

float png_nsj_get_x_offset_inches(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_x_offset_inches_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_x_offset_inches(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
png_fixed_point png_nsj_get_x_offset_inches_fixed(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_x_offset_inches_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_x_offset_inches_fixed(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
float png_nsj_get_y_offset_inches(d_png_structp png_ptr,
    png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_y_offset_inches_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_y_offset_inches(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
png_fixed_point png_nsj_get_y_offset_inches_fixed(d_png_structp png_ptr, png_const_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_y_offset_inches_fixed_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_y_offset_inches_fixed(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}
png_uint_32 png_nsj_get_pHYs_dpi(d_png_structp png_ptr,
    png_const_infop info_ptr, png_uint_32 *res_x, png_uint_32 *res_y,
    int *unit_type)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_pHYs_dpi_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_pHYs_dpi(png_ptr->png_ptr, info_ptr, res_x, res_y, unit_type);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_io_state(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_io_state_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_io_state(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_const_bytep png_nsj_get_io_chunk_name(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_io_chunk_name_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_io_chunk_name(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_io_chunk_type(d_png_structp png_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_io_chunk_type_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_io_chunk_type(png_ptr->png_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

 

png_uint_32 png_nsj_get_uint_32(d_png_glue_struct *d_context, png_const_bytep buf)
{
#   if PNG_NSJ_png_get_uint_32_IS_DEFINED == 1
        png_nsj_clear_errors(d_context);
        return png_get_uint_32(buf);
#   else
        png_nsj_set_missing_fn_err(d_context);
        return 0;
#   endif
}

png_uint_16 png_nsj_get_uint_16(d_png_glue_struct *d_context, png_const_bytep buf)
{
#   if PNG_NSJ_png_get_uint_16_IS_DEFINED == 1
        png_nsj_clear_errors(d_context);
        return png_get_uint_16(buf);
#   else
        png_nsj_set_missing_fn_err(d_context);
        return 0;
#   endif
}

png_int_32 png_nsj_get_int_32(d_png_glue_struct *d_context, png_const_bytep buf)
{
#   if PNG_NSJ_png_get_int_32_IS_DEFINED == 1
        png_nsj_clear_errors(d_context);
        return png_get_int_32(buf);
#   else
        png_nsj_set_missing_fn_err(d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_uint_31(d_png_structp png_ptr,
    png_const_bytep buf)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_uint_31_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_uint_31(png_ptr->png_ptr, buf);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_save_uint_32(d_png_glue_struct *d_context, png_bytep buf, png_uint_32 i)
{
#   if PNG_NSJ_png_save_uint_32_IS_DEFINED == 1
        png_nsj_clear_errors(d_context);
        png_save_uint_32(buf, i);
#   else
        png_nsj_set_missing_fn_err(d_context);
        return;
#   endif
}

void png_nsj_save_int_32(d_png_glue_struct *d_context, png_bytep buf, png_int_32 i)
{
#   if PNG_NSJ_png_save_int_32_IS_DEFINED == 1
        png_nsj_clear_errors(d_context);
        png_save_int_32(buf, i);
#   else
        png_nsj_set_missing_fn_err(d_context);
        return;
#   endif
}

void png_nsj_save_uint_16(d_png_glue_struct *d_context, png_bytep buf, unsigned int i)
{
#   if PNG_NSJ_png_save_uint_16_IS_DEFINED == 1
        png_nsj_clear_errors(d_context);
        png_save_uint_16(buf, i);
#   else
        png_nsj_set_missing_fn_err(d_context);
        return;
#   endif
}

   

void png_nsj_set_check_for_invalid_index(d_png_structp png_ptr,
    int allowed)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_check_for_invalid_index_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_check_for_invalid_index(png_ptr->png_ptr, allowed);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

png_uint_32 png_nsj_get_acTL(d_png_structp png_ptr,
   png_infop info_ptr, png_uint_32 *num_frames, png_uint_32 *num_plays)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_acTL_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_acTL(png_ptr->png_ptr, info_ptr, num_frames, num_plays);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_set_acTL(d_png_structp png_ptr,
   png_infop info_ptr, png_uint_32 num_frames, png_uint_32 num_plays)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_acTL_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_set_acTL(png_ptr->png_ptr, info_ptr, num_frames, num_plays);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_num_frames(d_png_structp png_ptr,
   png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_num_frames_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_num_frames(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_num_plays(d_png_structp png_ptr,
   png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_num_plays_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_num_plays(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_next_frame_fcTL(d_png_structp png_ptr, png_infop info_ptr, png_uint_32 *width,
   png_uint_32 *height, png_uint_32 *x_offset, png_uint_32 *y_offset,
   png_uint_16 *delay_num, png_uint_16 *delay_den, png_byte *dispose_op,
   png_byte *blend_op)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_next_frame_fcTL_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_next_frame_fcTL(png_ptr->png_ptr, info_ptr, width, height, x_offset, y_offset, delay_num, delay_den, dispose_op, blend_op);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_set_next_frame_fcTL(d_png_structp png_ptr, png_infop info_ptr, png_uint_32 width,
   png_uint_32 height, png_uint_32 x_offset, png_uint_32 y_offset,
   png_uint_16 delay_num, png_uint_16 delay_den, png_byte dispose_op,
   png_byte blend_op)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_next_frame_fcTL_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_set_next_frame_fcTL(png_ptr->png_ptr, info_ptr, width, height, x_offset, y_offset, delay_num, delay_den, dispose_op, blend_op);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_next_frame_width(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_next_frame_width_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_next_frame_width(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_next_frame_height(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_next_frame_height_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_next_frame_height(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_next_frame_x_offset(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_next_frame_x_offset_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_next_frame_x_offset(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_get_next_frame_y_offset(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_next_frame_y_offset_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_next_frame_y_offset(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_16 png_nsj_get_next_frame_delay_num(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_next_frame_delay_num_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_next_frame_delay_num(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_16 png_nsj_get_next_frame_delay_den(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_next_frame_delay_den_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_next_frame_delay_den(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_byte png_nsj_get_next_frame_dispose_op(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_next_frame_dispose_op_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_next_frame_dispose_op(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_byte png_nsj_get_next_frame_blend_op(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_next_frame_blend_op_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_next_frame_blend_op(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_byte png_nsj_get_first_frame_is_hidden(d_png_structp png_ptr, png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_get_first_frame_is_hidden_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_get_first_frame_is_hidden(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

png_uint_32 png_nsj_set_first_frame_is_hidden(d_png_structp png_ptr, png_infop info_ptr, png_byte is_hidden)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_first_frame_is_hidden_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return 0;
        }
        return png_set_first_frame_is_hidden(png_ptr->png_ptr, info_ptr, is_hidden);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return 0;
#   endif
}

void png_nsj_read_frame_head(d_png_structp png_ptr,
   png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_read_frame_head_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_read_frame_head(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_set_progressive_frame_fn(d_png_structp png_ptr,
   png_progressive_frame_ptr frame_info_fn,
   png_progressive_frame_ptr frame_end_fn)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_set_progressive_frame_fn_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_set_progressive_frame_fn(png_ptr->png_ptr, frame_info_fn, frame_end_fn);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_frame_head(d_png_structp png_ptr,
   png_infop info_ptr, png_bytepp row_pointers,
   png_uint_32 width, png_uint_32 height,
   png_uint_32 x_offset, png_uint_32 y_offset,
   png_uint_16 delay_num, png_uint_16 delay_den, png_byte dispose_op,
   png_byte blend_op)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_frame_head_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_frame_head(png_ptr->png_ptr, info_ptr, row_pointers, width, height, x_offset, y_offset, delay_num, delay_den, dispose_op, blend_op);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

void png_nsj_write_frame_tail(d_png_structp png_ptr,
   png_infop info_ptr)
{
    png_nsj_clear_errors(&png_ptr->d_context);

#   if PNG_NSJ_png_write_frame_tail_IS_DEFINED == 1
        jmp_buf d_jmp_buf;
        png_ptr->d_context.d_jmp_buf_ptr = &d_jmp_buf;
        if ( setjmp(d_jmp_buf) ) {
            return;
        }
        png_write_frame_tail(png_ptr->png_ptr, info_ptr);
#   else
        png_nsj_set_missing_fn_err(&png_ptr->d_context);
        return;
#   endif
}

  

  

