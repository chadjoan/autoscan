module sane.sane_test;

import sane.sane;
import std.stdio;

extern(C) extern __gshared uint* sane_reflection_vals;
extern(C) extern __gshared uint** sane_reflection_offsets;

enum SANE_REFL_IDX_BYTE_SIZEOF   = 0;
enum SANE_REFL_IDX_WORD_SIZEOF   = 1;
enum SANE_REFL_IDX_CHAR_SIZEOF   = 2;
enum SANE_REFL_IDX_ENUM_SIZEOF   = 3;
enum SANE_REFL_IDX_DEVICE_SIZEOF = 4;
enum SANE_REFL_IDX_RANGE_SIZEOF  = 5;
enum SANE_REFL_IDX_OPTION_SIZEOF = 6;
enum SANE_REFL_IDX_PARAMS_SIZEOF = 7;
enum SANE_REFL_VALS_LENGTH       = 8;

enum SANE_REFL_IDX_DEVICE_OFFSETS = 0;
enum SANE_REFL_IDX_RANGE_OFFSETS  = 1;
enum SANE_REFL_IDX_OPTION_OFFSETS = 2;
enum SANE_REFL_IDX_PARAMS_OFFSETS = 3;
enum SANE_REFL_OFFSETS_LENGTH     = 4;

extern(C) void sane_fill_reflection_info();
extern(C) void sane_free_reflection_info();

/* This exists to get around unions.
Union members always have a .offsetof of 0, but we want the non-zero offset
to the enclosing struct. */
private ptrdiff_t offset(T,U)(ref T agg, ref U member)
{
    return cast(ubyte*)&member - cast(ubyte*)&agg;
}

void sane_test_binary_compat()
{
    sane_fill_reflection_info();
    scope(exit) sane_free_reflection_info();

    assert(sane_reflection_vals[SANE_REFL_IDX_BYTE_SIZEOF] == SANE_Byte.sizeof);
    assert(sane_reflection_vals[SANE_REFL_IDX_WORD_SIZEOF] == SANE_Word.sizeof);
    assert(sane_reflection_vals[SANE_REFL_IDX_CHAR_SIZEOF] == SANE_Char.sizeof);
    assert(sane_reflection_vals[SANE_REFL_IDX_ENUM_SIZEOF] == SANE_Status.sizeof);
    assert(sane_reflection_vals[SANE_REFL_IDX_DEVICE_SIZEOF] == SANE_Device.sizeof);
    assert(sane_reflection_vals[SANE_REFL_IDX_RANGE_SIZEOF] == SANE_Range.sizeof);
    //writefln("C sizeof(%s), D sizeof(%s)", sane_reflection_vals[SANE_REFL_IDX_OPTION_SIZEOF], SANE_Option_Descriptor.sizeof);
    assert(sane_reflection_vals[SANE_REFL_IDX_OPTION_SIZEOF] == SANE_Option_Descriptor.sizeof);
    assert(sane_reflection_vals[SANE_REFL_IDX_PARAMS_SIZEOF] == SANE_Parameters.sizeof);

    assert(sane_reflection_offsets[SANE_REFL_IDX_DEVICE_OFFSETS][0] == SANE_Device.name.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_DEVICE_OFFSETS][1] == SANE_Device.vendor.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_DEVICE_OFFSETS][2] == SANE_Device.model.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_DEVICE_OFFSETS][3] == SANE_Device.type.offsetof);

    assert(sane_reflection_offsets[SANE_REFL_IDX_RANGE_OFFSETS][0] == SANE_Range.min.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_RANGE_OFFSETS][1] == SANE_Range.max.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_RANGE_OFFSETS][2] == SANE_Range.quant.offsetof);

    SANE_Option_Descriptor option;
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][0]  == SANE_Option_Descriptor.name.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][1]  == SANE_Option_Descriptor.title.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][2]  == SANE_Option_Descriptor.desc.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][3]  == SANE_Option_Descriptor.type.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][4]  == SANE_Option_Descriptor.unit.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][5]  == SANE_Option_Descriptor.size.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][6]  == SANE_Option_Descriptor.cap.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][7]  == SANE_Option_Descriptor.constraint_type.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][8]  == SANE_Option_Descriptor.constraint.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][9]  == offset(option, option.constraint.string_list));
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][10] == offset(option, option.constraint.word_list));
    assert(sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][11] == offset(option, option.constraint.range));

    assert(sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][0] == SANE_Parameters.format.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][1] == SANE_Parameters.last_frame.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][2] == SANE_Parameters.bytes_per_line.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][3] == SANE_Parameters.pixels_per_line.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][4] == SANE_Parameters.lines.offsetof);
    assert(sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][5] == SANE_Parameters.depth.offsetof);
}

unittest
{
    sane_test_binary_compat();
}
