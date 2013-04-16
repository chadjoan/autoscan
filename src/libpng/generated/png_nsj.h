#include <png.h>
#include <stdlib.h>
#include "png_wrap_utils.h"

    

  

    

       

 

png_uint_32 png_access_version_number();

void png_nsj_set_sig_bytes(d_png_structp png_ptr, int num_bytes);

int png_sig_cmp(png_const_bytep sig, png_size_t start,
    png_size_t num_to_check);

png_size_t png_nsj_get_compression_buffer_size(d_png_structp png_ptr);

void png_nsj_set_compression_buffer_size(d_png_structp png_ptr,
    png_size_t size);

int png_nsj_reset_zstream(d_png_structp png_ptr);

void png_nsj_write_sig(d_png_structp png_ptr);

void png_nsj_write_chunk(d_png_structp png_ptr, png_const_bytep
    chunk_name, png_const_bytep data, png_size_t length);

void png_nsj_write_chunk_start(d_png_structp png_ptr,
    png_const_bytep chunk_name, png_uint_32 length);

void png_nsj_write_chunk_data(d_png_structp png_ptr,
    png_const_bytep data, png_size_t length);

void png_nsj_write_chunk_end(d_png_structp png_ptr);

png_infop png_nsj_create_info_struct(d_png_structp png_ptr);

void png_info_init_3(png_infopp info_ptr,
    png_size_t png_info_struct_size);

void png_nsj_write_info_before_PLTE(d_png_structp png_ptr, png_infop info_ptr);

void png_nsj_write_info(d_png_structp png_ptr, png_infop info_ptr);

void png_nsj_read_info(d_png_structp png_ptr, png_infop info_ptr);

png_const_charp png_nsj_convert_to_rfc1123(d_png_structp png_ptr,
    png_const_timep ptime);

void png_nsj_convert_from_struct_tm(d_png_glue_struct *d_context, png_timep ptime,
    PNG_CONST struct tm FAR * ttime);

void png_nsj_convert_from_time_t(d_png_glue_struct *d_context, png_timep ptime, time_t ttime);

void png_nsj_set_expand(d_png_structp png_ptr);

void png_nsj_set_expand_gray_1_2_4_to_8(d_png_structp png_ptr);

void png_nsj_set_palette_to_rgb(d_png_structp png_ptr);

void png_nsj_set_tRNS_to_alpha(d_png_structp png_ptr);

void png_nsj_set_expand_16(d_png_structp png_ptr);

void png_nsj_set_bgr(d_png_structp png_ptr);

void png_nsj_set_gray_to_rgb(d_png_structp png_ptr);

void png_nsj_set_rgb_to_gray(d_png_structp png_ptr,
    int error_action, double red, double green);
void png_nsj_set_rgb_to_gray_fixed(d_png_structp png_ptr,
    int error_action, png_fixed_point red, png_fixed_point green);
png_byte png_nsj_get_rgb_to_gray_status(d_png_structp
    png_ptr);

void png_nsj_build_grayscale_palette(d_png_glue_struct *d_context, int bit_depth,
    png_colorp palette);

void png_nsj_set_alpha_mode(d_png_structp png_ptr, int mode,
    double output_gamma);
void png_nsj_set_alpha_mode_fixed(d_png_structp png_ptr,
    int mode, png_fixed_point output_gamma);
void png_nsj_set_strip_alpha(d_png_structp png_ptr);

void png_nsj_set_swap_alpha(d_png_structp png_ptr);

void png_nsj_set_invert_alpha(d_png_structp png_ptr);

void png_nsj_set_filler(d_png_structp png_ptr, png_uint_32 filler,
    int flags);

void png_nsj_set_add_alpha(d_png_structp png_ptr, png_uint_32 filler,
    int flags);

void png_nsj_set_swap(d_png_structp png_ptr);

void png_nsj_set_packing(d_png_structp png_ptr);

void png_nsj_set_packswap(d_png_structp png_ptr);

void png_nsj_set_shift(d_png_structp png_ptr, png_const_color_8p
    true_bits);

int png_nsj_set_interlace_handling(d_png_structp png_ptr);

void png_nsj_set_invert_mono(d_png_structp png_ptr);

void png_nsj_set_background(d_png_structp png_ptr,
    png_const_color_16p background_color, int background_gamma_code,
    int need_expand, double background_gamma);
void png_nsj_set_background_fixed(d_png_structp png_ptr,
    png_const_color_16p background_color, int background_gamma_code,
    int need_expand, png_fixed_point background_gamma);
void png_nsj_set_scale_16(d_png_structp png_ptr);

void png_nsj_set_strip_16(d_png_structp png_ptr);

void png_nsj_set_quantize(d_png_structp png_ptr, png_colorp palette,
    int num_palette, int maximum_colors, png_const_uint_16p histogram,
    int full_quantize);

void png_nsj_set_gamma(d_png_structp png_ptr, double screen_gamma,
    double override_file_gamma);
void png_nsj_set_gamma_fixed(d_png_structp png_ptr,
    png_fixed_point screen_gamma, png_fixed_point override_file_gamma);
void png_nsj_set_flush(d_png_structp png_ptr, int nrows);

void png_nsj_write_flush(d_png_structp png_ptr);

void png_nsj_start_read_image(d_png_structp png_ptr);

void png_nsj_read_update_info(d_png_structp png_ptr, png_infop info_ptr);

void png_nsj_read_rows(d_png_structp png_ptr, png_bytepp row,
    png_bytepp display_row, png_uint_32 num_rows);

void png_nsj_read_row(d_png_structp png_ptr, png_bytep row,
    png_bytep display_row);

void png_nsj_read_image(d_png_structp png_ptr, png_bytepp image);

void png_nsj_write_row(d_png_structp png_ptr, png_const_bytep row);

void png_nsj_write_rows(d_png_structp png_ptr, png_bytepp row,
    png_uint_32 num_rows);

void png_nsj_write_image(d_png_structp png_ptr, png_bytepp image);

void png_nsj_write_end(d_png_structp png_ptr, png_infop info_ptr);

void png_nsj_read_end(d_png_structp png_ptr, png_infop info_ptr);

void png_nsj_destroy_info_struct(d_png_structp png_ptr,
    png_infopp info_ptr_ptr);

void png_nsj_set_crc_action(d_png_structp png_ptr, int crit_action, int ancil_action);

void png_nsj_set_filter(d_png_structp png_ptr, int method, int filters);

void png_nsj_set_filter_heuristics(d_png_structp png_ptr,
    int heuristic_method, int num_weights, png_const_doublep filter_weights,
    png_const_doublep filter_costs);
void png_nsj_set_filter_heuristics_fixed(d_png_structp png_ptr,
    int heuristic_method, int num_weights, png_const_fixed_point_p
    filter_weights, png_const_fixed_point_p filter_costs);
void png_nsj_set_compression_level(d_png_structp png_ptr, int level);

void png_nsj_set_compression_mem_level(d_png_structp png_ptr,
    int mem_level);

void png_nsj_set_compression_strategy(d_png_structp png_ptr,
    int strategy);

void png_nsj_set_compression_window_bits(d_png_structp png_ptr,
    int window_bits);

void png_nsj_set_compression_method(d_png_structp png_ptr,
    int method);

void png_nsj_set_text_compression_level(d_png_structp png_ptr, int level);

void png_nsj_set_text_compression_mem_level(d_png_structp png_ptr,
    int mem_level);

void png_nsj_set_text_compression_strategy(d_png_structp png_ptr,
    int strategy);

void png_nsj_set_text_compression_window_bits(d_png_structp
    png_ptr, int window_bits);

void png_nsj_set_text_compression_method(d_png_structp png_ptr,
    int method);

void png_nsj_init_io(d_png_structp png_ptr, png_FILE_p fp);

png_voidp png_nsj_get_error_ptr(d_png_structp png_ptr);

void png_nsj_set_write_fn(d_png_structp png_ptr, png_voidp io_ptr,
    png_rw_ptr write_data_fn, png_flush_ptr output_flush_fn);

void png_nsj_set_read_fn(d_png_structp png_ptr, png_voidp io_ptr,
    png_rw_ptr read_data_fn);

png_voidp png_nsj_get_io_ptr(d_png_structp png_ptr);

void png_nsj_set_read_status_fn(d_png_structp png_ptr,
    png_read_status_ptr read_row_fn);

void png_nsj_set_write_status_fn(d_png_structp png_ptr,
    png_write_status_ptr write_row_fn);

void png_nsj_set_mem_fn(d_png_structp png_ptr, png_voidp mem_ptr,
    png_malloc_ptr malloc_fn, png_free_ptr free_fn);

png_voidp png_nsj_get_mem_ptr(d_png_structp png_ptr);

void png_nsj_set_read_user_transform_fn(d_png_structp png_ptr,
    png_user_transform_ptr read_user_transform_fn);

void png_nsj_set_write_user_transform_fn(d_png_structp png_ptr,
    png_user_transform_ptr write_user_transform_fn);

void png_nsj_set_user_transform_info(d_png_structp png_ptr,
    png_voidp user_transform_ptr, int user_transform_depth,
    int user_transform_channels);

png_voidp png_nsj_get_user_transform_ptr(d_png_structp png_ptr);

png_uint_32 png_nsj_get_current_row_number(d_png_structp png_ptr);

png_byte png_nsj_get_current_pass_number(d_png_structp png_ptr);

void png_nsj_set_read_user_chunk_fn(d_png_structp png_ptr,
    png_voidp user_chunk_ptr, png_user_chunk_ptr read_user_chunk_fn);

png_voidp png_nsj_get_user_chunk_ptr(d_png_structp png_ptr);

void png_nsj_set_progressive_read_fn(d_png_structp png_ptr,
    png_voidp progressive_ptr, png_progressive_info_ptr info_fn,
    png_progressive_row_ptr row_fn, png_progressive_end_ptr end_fn);

png_voidp png_nsj_get_progressive_ptr(d_png_structp png_ptr);

void png_nsj_process_data(d_png_structp png_ptr, png_infop info_ptr,
    png_bytep buffer, png_size_t buffer_size);

png_size_t png_nsj_process_data_pause(d_png_structp png_ptr, int save);

png_uint_32 png_nsj_process_data_skip(d_png_structp png_ptr);

void png_nsj_progressive_combine_row(d_png_structp png_ptr,
    png_bytep old_row, png_const_bytep new_row);

png_voidp png_nsj_malloc(d_png_structp png_ptr, png_alloc_size_t size);

png_voidp png_nsj_calloc(d_png_structp png_ptr, png_alloc_size_t size);

png_voidp png_nsj_malloc_warn(d_png_structp png_ptr,
    png_alloc_size_t size);

void png_nsj_free(d_png_structp png_ptr, png_voidp ptr);

void png_nsj_free_data(d_png_structp png_ptr, png_infop info_ptr, png_uint_32 free_me, int num);

void png_nsj_data_freer(d_png_structp png_ptr, png_infop info_ptr, int freer, png_uint_32 mask);

png_voidp png_nsj_malloc_default(d_png_structp png_ptr,
    png_alloc_size_t size);

void png_nsj_free_default(d_png_structp png_ptr, png_voidp ptr);

void png_nsj_error(d_png_structp png_ptr, png_const_charp error_message);

void png_nsj_chunk_error(d_png_structp png_ptr,
    png_const_charp error_message);

void png_nsj_err(d_png_structp png_ptr);

void png_nsj_warning(d_png_structp png_ptr,
    png_const_charp warning_message);

void png_nsj_chunk_warning(d_png_structp png_ptr,
    png_const_charp warning_message);

png_uint_32 png_nsj_get_valid(d_png_structp png_ptr, png_const_infop info_ptr,
    png_uint_32 flag);

png_size_t png_nsj_get_rowbytes(d_png_structp png_ptr,
    png_const_infop info_ptr);

png_bytepp png_nsj_get_rows(d_png_structp png_ptr, png_const_infop info_ptr);

void png_nsj_set_rows(d_png_structp png_ptr,
    png_infop info_ptr, png_bytepp row_pointers);

png_byte png_nsj_get_channels(d_png_structp png_ptr, png_const_infop info_ptr);

png_uint_32 png_nsj_get_image_width(d_png_structp png_ptr,
    png_const_infop info_ptr);

png_uint_32 png_nsj_get_image_height(d_png_structp png_ptr,
    png_const_infop info_ptr);

png_byte png_nsj_get_bit_depth(d_png_structp png_ptr, png_const_infop info_ptr);

png_byte png_nsj_get_color_type(d_png_structp png_ptr,
    png_const_infop info_ptr);

png_byte png_nsj_get_filter_type(d_png_structp png_ptr,
    png_const_infop info_ptr);

png_byte png_nsj_get_interlace_type(d_png_structp png_ptr,
    png_const_infop info_ptr);

png_byte png_nsj_get_compression_type(d_png_structp png_ptr,
    png_const_infop info_ptr);

png_uint_32 png_nsj_get_pixels_per_meter(d_png_structp png_ptr, png_const_infop info_ptr);

png_uint_32 png_nsj_get_x_pixels_per_meter(d_png_structp png_ptr, png_const_infop info_ptr);

png_uint_32 png_nsj_get_y_pixels_per_meter(d_png_structp png_ptr, png_const_infop info_ptr);

float png_nsj_get_pixel_aspect_ratio(d_png_structp png_ptr, png_const_infop info_ptr);
png_fixed_point png_nsj_get_pixel_aspect_ratio_fixed(d_png_structp png_ptr, png_const_infop info_ptr);
png_int_32 png_nsj_get_x_offset_pixels(d_png_structp png_ptr, png_const_infop info_ptr);

png_int_32 png_nsj_get_y_offset_pixels(d_png_structp png_ptr, png_const_infop info_ptr);

png_int_32 png_nsj_get_x_offset_microns(d_png_structp png_ptr, png_const_infop info_ptr);

png_int_32 png_nsj_get_y_offset_microns(d_png_structp png_ptr, png_const_infop info_ptr);

png_const_bytep png_nsj_get_signature(d_png_structp png_ptr, png_infop info_ptr);

png_uint_32 png_nsj_get_bKGD(d_png_structp png_ptr, png_infop info_ptr,
    png_color_16p *background);

void png_nsj_set_bKGD(d_png_structp png_ptr, png_infop info_ptr,
    png_const_color_16p background);

png_uint_32 png_nsj_get_cHRM(d_png_structp png_ptr,
   png_const_infop info_ptr, double *white_x, double *white_y, double *red_x,
    double *red_y, double *green_x, double *green_y, double *blue_x,
    double *blue_y);
png_uint_32 png_nsj_get_cHRM_XYZ(d_png_structp png_ptr,
    png_const_infop info_ptr, double *red_X, double *red_Y, double *red_Z,
    double *green_X, double *green_Y, double *green_Z, double *blue_X,
    double *blue_Y, double *blue_Z);
png_uint_32 png_nsj_get_cHRM_fixed(d_png_structp png_ptr,
    png_const_infop info_ptr, png_fixed_point *int_white_x,
    png_fixed_point *int_white_y, png_fixed_point *int_red_x,
    png_fixed_point *int_red_y, png_fixed_point *int_green_x,
    png_fixed_point *int_green_y, png_fixed_point *int_blue_x,
    png_fixed_point *int_blue_y);
png_uint_32 png_nsj_get_cHRM_XYZ_fixed(d_png_structp png_ptr, png_const_infop info_ptr,
    png_fixed_point *int_red_X, png_fixed_point *int_red_Y,
    png_fixed_point *int_red_Z, png_fixed_point *int_green_X,
    png_fixed_point *int_green_Y, png_fixed_point *int_green_Z,
    png_fixed_point *int_blue_X, png_fixed_point *int_blue_Y,
    png_fixed_point *int_blue_Z);
void png_nsj_set_cHRM(d_png_structp png_ptr, png_infop info_ptr,
    double white_x, double white_y, double red_x, double red_y, double green_x,
    double green_y, double blue_x, double blue_y);
void png_nsj_set_cHRM_XYZ(d_png_structp png_ptr,
    png_infop info_ptr, double red_X, double red_Y, double red_Z,
    double green_X, double green_Y, double green_Z, double blue_X,
    double blue_Y, double blue_Z);
void png_nsj_set_cHRM_fixed(d_png_structp png_ptr,
    png_infop info_ptr, png_fixed_point int_white_x,
    png_fixed_point int_white_y, png_fixed_point int_red_x,
    png_fixed_point int_red_y, png_fixed_point int_green_x,
    png_fixed_point int_green_y, png_fixed_point int_blue_x,
    png_fixed_point int_blue_y);
void png_nsj_set_cHRM_XYZ_fixed(d_png_structp png_ptr,
    png_infop info_ptr, png_fixed_point int_red_X, png_fixed_point int_red_Y,
    png_fixed_point int_red_Z, png_fixed_point int_green_X,
    png_fixed_point int_green_Y, png_fixed_point int_green_Z,
    png_fixed_point int_blue_X, png_fixed_point int_blue_Y,
    png_fixed_point int_blue_Z);
png_uint_32 png_nsj_get_gAMA(d_png_structp png_ptr, png_const_infop info_ptr,
    double *file_gamma);
png_uint_32 png_nsj_get_gAMA_fixed(d_png_structp png_ptr, png_const_infop info_ptr,
    png_fixed_point *int_file_gamma);
void png_nsj_set_gAMA(d_png_structp png_ptr,
    png_infop info_ptr, double file_gamma);
void png_nsj_set_gAMA_fixed(d_png_structp png_ptr,
    png_infop info_ptr, png_fixed_point int_file_gamma);
png_uint_32 png_nsj_get_hIST(d_png_structp png_ptr, png_const_infop info_ptr,
    png_uint_16p *hist);

void png_nsj_set_hIST(d_png_structp png_ptr,
    png_infop info_ptr, png_const_uint_16p hist);

png_uint_32 png_nsj_get_IHDR(d_png_structp png_ptr, png_infop info_ptr,
    png_uint_32 *width, png_uint_32 *height, int *bit_depth, int *color_type,
    int *interlace_method, int *compression_method, int *filter_method);

void png_nsj_set_IHDR(d_png_structp png_ptr, png_infop info_ptr,
    png_uint_32 width, png_uint_32 height, int bit_depth, int color_type,
    int interlace_method, int compression_method, int filter_method);

png_uint_32 png_nsj_get_oFFs(d_png_structp png_ptr, png_const_infop info_ptr,
    png_int_32 *offset_x, png_int_32 *offset_y, int *unit_type);

void png_nsj_set_oFFs(d_png_structp png_ptr, png_infop info_ptr,
    png_int_32 offset_x, png_int_32 offset_y, int unit_type);

png_uint_32 png_nsj_get_pCAL(d_png_structp png_ptr, png_const_infop info_ptr,
    png_charp *purpose, png_int_32 *X0, png_int_32 *X1, int *type,
    int *nparams,
    png_charp *units, png_charpp *params);

void png_nsj_set_pCAL(d_png_structp png_ptr,
    png_infop info_ptr,
    png_const_charp purpose, png_int_32 X0, png_int_32 X1, int type,
    int nparams, png_const_charp units, png_charpp params);

png_uint_32 png_nsj_get_pHYs(d_png_structp png_ptr, png_const_infop info_ptr,
    png_uint_32 *res_x, png_uint_32 *res_y, int *unit_type);

void png_nsj_set_pHYs(d_png_structp png_ptr, png_infop info_ptr,
    png_uint_32 res_x, png_uint_32 res_y, int unit_type);

png_uint_32 png_nsj_get_PLTE(d_png_structp png_ptr, png_const_infop info_ptr,
    png_colorp *palette, int *num_palette);

void png_nsj_set_PLTE(d_png_structp png_ptr, png_infop info_ptr,
    png_const_colorp palette, int num_palette);

png_uint_32 png_nsj_get_sBIT(d_png_structp png_ptr, png_infop info_ptr,
    png_color_8p *sig_bit);

void png_nsj_set_sBIT(d_png_structp png_ptr, png_infop info_ptr, png_const_color_8p sig_bit);

png_uint_32 png_nsj_get_sRGB(d_png_structp png_ptr,
    png_const_infop info_ptr, int *file_srgb_intent);

void png_nsj_set_sRGB(d_png_structp png_ptr, png_infop info_ptr, int srgb_intent);

void png_nsj_set_sRGB_gAMA_and_cHRM(d_png_structp png_ptr,
    png_infop info_ptr, int srgb_intent);

png_uint_32 png_nsj_get_iCCP(d_png_structp png_ptr, png_const_infop info_ptr,
    png_charpp name, int *compression_type, png_bytepp profile,
    png_uint_32 *proflen);

void png_nsj_set_iCCP(d_png_structp png_ptr, png_infop info_ptr,
    png_const_charp name, int compression_type, png_const_bytep profile,
    png_uint_32 proflen);

png_uint_32 png_nsj_get_sPLT(d_png_structp png_ptr, png_const_infop info_ptr,
    png_sPLT_tpp entries);

void png_nsj_set_sPLT(d_png_structp png_ptr, png_infop info_ptr,
    png_const_sPLT_tp entries, int nentries);

png_uint_32 png_nsj_get_text(d_png_structp png_ptr, png_const_infop info_ptr,
    png_textp *text_ptr, int *num_text);

void png_nsj_set_text(d_png_structp png_ptr, png_infop info_ptr,
    png_const_textp text_ptr, int num_text);

png_uint_32 png_nsj_get_tIME(d_png_structp png_ptr, png_infop info_ptr, png_timep *mod_time);

void png_nsj_set_tIME(d_png_structp png_ptr, png_infop info_ptr, png_const_timep mod_time);

png_uint_32 png_nsj_get_tRNS(d_png_structp png_ptr, png_infop info_ptr,
    png_bytep *trans_alpha, int *num_trans, png_color_16p *trans_color);

void png_nsj_set_tRNS(d_png_structp png_ptr, png_infop info_ptr,
    png_const_bytep trans_alpha, int num_trans,
    png_const_color_16p trans_color);

png_uint_32 png_nsj_get_sCAL(d_png_structp png_ptr, png_const_infop info_ptr,
    int *unit, double *width, double *height);
png_uint_32 png_nsj_get_sCAL_fixed(d_png_structp png_ptr, png_const_infop info_ptr, int *unit,
    png_fixed_point *width,
    png_fixed_point *height);
png_uint_32 png_nsj_get_sCAL_s(d_png_structp png_ptr, png_const_infop info_ptr,
    int *unit, png_charpp swidth, png_charpp sheight);

void png_nsj_set_sCAL(d_png_structp png_ptr, png_infop info_ptr,
    int unit, double width, double height);
void png_nsj_set_sCAL_fixed(d_png_structp png_ptr,
   png_infop info_ptr, int unit, png_fixed_point width,
   png_fixed_point height);
void png_nsj_set_sCAL_s(d_png_structp png_ptr, png_infop info_ptr,
    int unit, png_const_charp swidth, png_const_charp sheight);

void png_nsj_set_keep_unknown_chunks(d_png_structp png_ptr, int keep,
    png_const_bytep chunk_list, int num_chunks);

int png_nsj_handle_as_unknown(d_png_structp png_ptr,
    png_const_bytep chunk_name);

void png_nsj_set_unknown_chunks(d_png_structp png_ptr,
    png_infop info_ptr, png_const_unknown_chunkp unknowns,
    int num_unknowns);

void png_nsj_set_unknown_chunk_location(d_png_structp png_ptr, png_infop info_ptr, int chunk, int location);

int png_nsj_get_unknown_chunks(d_png_structp png_ptr,
    png_const_infop info_ptr, png_unknown_chunkpp entries);

void png_nsj_set_invalid(d_png_structp png_ptr, png_infop info_ptr, int mask);

void png_nsj_read_png(d_png_structp png_ptr, png_infop info_ptr,
    int transforms, png_voidp params);

void png_nsj_write_png(d_png_structp png_ptr, png_infop info_ptr,
    int transforms, png_voidp params);

png_const_charp png_nsj_get_copyright(d_png_structp png_ptr);

png_const_charp png_nsj_get_header_ver(d_png_structp png_ptr);

png_const_charp png_nsj_get_header_version(d_png_structp png_ptr);

png_const_charp png_nsj_get_libpng_ver(d_png_structp png_ptr);

png_uint_32 png_nsj_permit_mng_features(d_png_structp png_ptr,
    png_uint_32 mng_features_permitted);

void png_nsj_set_strip_error_numbers(d_png_structp png_ptr,
    png_uint_32 strip_mode);

void png_nsj_set_user_limits(d_png_structp png_ptr,
    png_uint_32 user_width_max, png_uint_32 user_height_max);

png_uint_32 png_nsj_get_user_width_max(d_png_structp png_ptr);

png_uint_32 png_nsj_get_user_height_max(d_png_structp png_ptr);

void png_nsj_set_chunk_cache_max(d_png_structp png_ptr,
    png_uint_32 user_chunk_cache_max);

png_uint_32 png_nsj_get_chunk_cache_max(d_png_structp png_ptr);

void png_nsj_set_chunk_malloc_max(d_png_structp png_ptr,
    png_alloc_size_t user_chunk_cache_max);

png_alloc_size_t png_nsj_get_chunk_malloc_max(d_png_structp png_ptr);

png_uint_32 png_nsj_get_pixels_per_inch(d_png_structp png_ptr, png_const_infop info_ptr);

png_uint_32 png_nsj_get_x_pixels_per_inch(d_png_structp png_ptr, png_const_infop info_ptr);

png_uint_32 png_nsj_get_y_pixels_per_inch(d_png_structp png_ptr, png_const_infop info_ptr);

float png_nsj_get_x_offset_inches(d_png_structp png_ptr, png_const_infop info_ptr);
png_fixed_point png_nsj_get_x_offset_inches_fixed(d_png_structp png_ptr, png_const_infop info_ptr);
float png_nsj_get_y_offset_inches(d_png_structp png_ptr,
    png_const_infop info_ptr);
png_fixed_point png_nsj_get_y_offset_inches_fixed(d_png_structp png_ptr, png_const_infop info_ptr);
png_uint_32 png_nsj_get_pHYs_dpi(d_png_structp png_ptr,
    png_const_infop info_ptr, png_uint_32 *res_x, png_uint_32 *res_y,
    int *unit_type);

png_uint_32 png_nsj_get_io_state(d_png_structp png_ptr);

png_const_bytep png_nsj_get_io_chunk_name(d_png_structp png_ptr);

png_uint_32 png_nsj_get_io_chunk_type(d_png_structp png_ptr);

 

png_uint_32 png_nsj_get_uint_32(d_png_glue_struct *d_context, png_const_bytep buf);

png_uint_16 png_nsj_get_uint_16(d_png_glue_struct *d_context, png_const_bytep buf);

png_int_32 png_nsj_get_int_32(d_png_glue_struct *d_context, png_const_bytep buf);

png_uint_32 png_nsj_get_uint_31(d_png_structp png_ptr,
    png_const_bytep buf);

void png_nsj_save_uint_32(d_png_glue_struct *d_context, png_bytep buf, png_uint_32 i);

void png_nsj_save_int_32(d_png_glue_struct *d_context, png_bytep buf, png_int_32 i);

void png_nsj_save_uint_16(d_png_glue_struct *d_context, png_bytep buf, unsigned int i);

   

void png_nsj_set_check_for_invalid_index(d_png_structp png_ptr,
    int allowed);

png_uint_32 png_nsj_get_acTL(d_png_structp png_ptr,
   png_infop info_ptr, png_uint_32 *num_frames, png_uint_32 *num_plays);

png_uint_32 png_nsj_set_acTL(d_png_structp png_ptr,
   png_infop info_ptr, png_uint_32 num_frames, png_uint_32 num_plays);

png_uint_32 png_nsj_get_num_frames(d_png_structp png_ptr,
   png_infop info_ptr);

png_uint_32 png_nsj_get_num_plays(d_png_structp png_ptr,
   png_infop info_ptr);

png_uint_32 png_nsj_get_next_frame_fcTL(d_png_structp png_ptr, png_infop info_ptr, png_uint_32 *width,
   png_uint_32 *height, png_uint_32 *x_offset, png_uint_32 *y_offset,
   png_uint_16 *delay_num, png_uint_16 *delay_den, png_byte *dispose_op,
   png_byte *blend_op);

png_uint_32 png_nsj_set_next_frame_fcTL(d_png_structp png_ptr, png_infop info_ptr, png_uint_32 width,
   png_uint_32 height, png_uint_32 x_offset, png_uint_32 y_offset,
   png_uint_16 delay_num, png_uint_16 delay_den, png_byte dispose_op,
   png_byte blend_op);

png_uint_32 png_nsj_get_next_frame_width(d_png_structp png_ptr, png_infop info_ptr);

png_uint_32 png_nsj_get_next_frame_height(d_png_structp png_ptr, png_infop info_ptr);

png_uint_32 png_nsj_get_next_frame_x_offset(d_png_structp png_ptr, png_infop info_ptr);

png_uint_32 png_nsj_get_next_frame_y_offset(d_png_structp png_ptr, png_infop info_ptr);

png_uint_16 png_nsj_get_next_frame_delay_num(d_png_structp png_ptr, png_infop info_ptr);

png_uint_16 png_nsj_get_next_frame_delay_den(d_png_structp png_ptr, png_infop info_ptr);

png_byte png_nsj_get_next_frame_dispose_op(d_png_structp png_ptr, png_infop info_ptr);

png_byte png_nsj_get_next_frame_blend_op(d_png_structp png_ptr, png_infop info_ptr);

png_byte png_nsj_get_first_frame_is_hidden(d_png_structp png_ptr, png_infop info_ptr);

png_uint_32 png_nsj_set_first_frame_is_hidden(d_png_structp png_ptr, png_infop info_ptr, png_byte is_hidden);

void png_nsj_read_frame_head(d_png_structp png_ptr,
   png_infop info_ptr);

void png_nsj_set_progressive_frame_fn(d_png_structp png_ptr,
   png_progressive_frame_ptr frame_info_fn,
   png_progressive_frame_ptr frame_end_fn);

void png_nsj_write_frame_head(d_png_structp png_ptr,
   png_infop info_ptr, png_bytepp row_pointers,
   png_uint_32 width, png_uint_32 height,
   png_uint_32 x_offset, png_uint_32 y_offset,
   png_uint_16 delay_num, png_uint_16 delay_den, png_byte dispose_op,
   png_byte blend_op);

void png_nsj_write_frame_tail(d_png_structp png_ptr,
   png_infop info_ptr);

  

  

