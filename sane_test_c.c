
#include <inttypes.h>
#include <stdlib.h>
#include <sane/sane.h>

uint32_t *sane_reflection_vals = NULL;
uint32_t **sane_reflection_offsets = NULL;

#define SANE_REFL_IDX_BYTE_SIZEOF   0
#define SANE_REFL_IDX_WORD_SIZEOF   1
#define SANE_REFL_IDX_CHAR_SIZEOF   2
#define SANE_REFL_IDX_ENUM_SIZEOF   3
#define SANE_REFL_IDX_DEVICE_SIZEOF 4
#define SANE_REFL_IDX_RANGE_SIZEOF  5
#define SANE_REFL_IDX_OPTION_SIZEOF 6
#define SANE_REFL_IDX_PARAMS_SIZEOF 7
#define SANE_REFL_VALS_LENGTH       8

#define SANE_REFL_IDX_DEVICE_OFFSETS 0
#define SANE_REFL_IDX_RANGE_OFFSETS  1
#define SANE_REFL_IDX_OPTION_OFFSETS 2
#define SANE_REFL_IDX_PARAMS_OFFSETS 3
#define SANE_REFL_OFFSETS_LENGTH     4

#define OFFSET_OF(struct_name, member_name) ((char*)&struct_name.member_name - (char*)&struct_name)

void sane_fill_reflection_info()
{
    sane_reflection_vals = malloc(SANE_REFL_VALS_LENGTH * sizeof(uint32_t));
    sane_reflection_vals[SANE_REFL_IDX_BYTE_SIZEOF] = sizeof(SANE_Byte);
    sane_reflection_vals[SANE_REFL_IDX_WORD_SIZEOF] = sizeof(SANE_Word);
    sane_reflection_vals[SANE_REFL_IDX_CHAR_SIZEOF] = sizeof(SANE_Char);
    sane_reflection_vals[SANE_REFL_IDX_ENUM_SIZEOF] = sizeof(SANE_Status);
    sane_reflection_vals[SANE_REFL_IDX_DEVICE_SIZEOF] = sizeof(SANE_Device);
    sane_reflection_vals[SANE_REFL_IDX_RANGE_SIZEOF]  = sizeof(SANE_Range);
    sane_reflection_vals[SANE_REFL_IDX_OPTION_SIZEOF] = sizeof(SANE_Option_Descriptor);
    sane_reflection_vals[SANE_REFL_IDX_PARAMS_SIZEOF] = sizeof(SANE_Parameters);

    sane_reflection_offsets = malloc(SANE_REFL_OFFSETS_LENGTH * sizeof(uint32_t*));
    sane_reflection_offsets[SANE_REFL_IDX_DEVICE_OFFSETS] = malloc( 4 * sizeof(uint32_t));
    sane_reflection_offsets[SANE_REFL_IDX_RANGE_OFFSETS]  = malloc( 3 * sizeof(uint32_t));
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS] = malloc(12 * sizeof(uint32_t));
    sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS] = malloc( 6 * sizeof(uint32_t));

#if 0
struct SANE_Device
{
    SANE_String_Const name; /* unique device name */
    SANE_String_Const vendor;   /* device vendor string */
    SANE_String_Const model;    /* device model name */
    SANE_String_Const type; /* device type (e.g., "flatbed scanner") */
}
#endif
    SANE_Device device;
    sane_reflection_offsets[SANE_REFL_IDX_DEVICE_OFFSETS][0] = OFFSET_OF(device,name);
    sane_reflection_offsets[SANE_REFL_IDX_DEVICE_OFFSETS][1] = OFFSET_OF(device,vendor);
    sane_reflection_offsets[SANE_REFL_IDX_DEVICE_OFFSETS][2] = OFFSET_OF(device,model);
    sane_reflection_offsets[SANE_REFL_IDX_DEVICE_OFFSETS][3] = OFFSET_OF(device,type);

#if 0
struct SANE_Range
{
    SANE_Word min;      /* minimum (element) value */
    SANE_Word max;      /* maximum (element) value */
    SANE_Word quant;        /* quantization value (0 if none) */
}
#endif
    SANE_Range range;
    sane_reflection_offsets[SANE_REFL_IDX_RANGE_OFFSETS][0] = OFFSET_OF(range,min);
    sane_reflection_offsets[SANE_REFL_IDX_RANGE_OFFSETS][1] = OFFSET_OF(range,max);
    sane_reflection_offsets[SANE_REFL_IDX_RANGE_OFFSETS][2] = OFFSET_OF(range,quant);

#if 0
struct SANE_Option_Descriptor
{
    SANE_String_Const name; /* name of this option (command-line name) */
    SANE_String_Const title;    /* title of this option (single-line) */
    SANE_String_Const desc; /* description of this option (multi-line) */
    SANE_Value_Type type;   /* how are values interpreted? */
    SANE_Unit unit;     /* what is the (physical) unit? */
    SANE_Int size;
    SANE_Int cap;       /* capabilities */

    SANE_Constraint_Type constraint_type;
    union constraint
    {
        const SANE_String_Const *string_list;   /* NULL-terminated list */
        const SANE_Word *word_list; /* first element is list-length */
        const SANE_Range *range;
    }
}
#endif
    SANE_Option_Descriptor option;
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][0]  = OFFSET_OF(option,name);
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][1]  = OFFSET_OF(option,title);
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][2]  = OFFSET_OF(option,desc);
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][3]  = OFFSET_OF(option,type);
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][4]  = OFFSET_OF(option,unit);
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][5]  = OFFSET_OF(option,size);
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][6]  = OFFSET_OF(option,cap);
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][7]  = OFFSET_OF(option,constraint_type);
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][8]  = OFFSET_OF(option,constraint);
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][9]  = OFFSET_OF(option,constraint.string_list);
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][10] = OFFSET_OF(option,constraint.word_list);
    sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS][11] = OFFSET_OF(option,constraint.range);

#if 0
struct SANE_Parameters
{
    SANE_Frame format;
    SANE_Bool last_frame;
    SANE_Int bytes_per_line;
    SANE_Int pixels_per_line;
    SANE_Int lines;
    SANE_Int depth;
}
#endif
    SANE_Parameters params;
    sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][0] = OFFSET_OF(params,format);
    sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][1] = OFFSET_OF(params,last_frame);
    sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][2] = OFFSET_OF(params,bytes_per_line);
    sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][3] = OFFSET_OF(params,pixels_per_line);
    sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][4] = OFFSET_OF(params,lines);
    sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS][5] = OFFSET_OF(params,depth);
}

void sane_free_reflection_info()
{
    if ( sane_reflection_vals != NULL )
    {
        free(sane_reflection_vals);
        sane_reflection_vals = NULL;
    }

    uint32_t *offsets = NULL;
    if ( sane_reflection_offsets != NULL )
    {
        offsets = sane_reflection_offsets[SANE_REFL_IDX_DEVICE_OFFSETS];
        if ( offsets == NULL )
            free(offsets);

        offsets = sane_reflection_offsets[SANE_REFL_IDX_RANGE_OFFSETS];
        if ( offsets == NULL )
            free(offsets);

        offsets = sane_reflection_offsets[SANE_REFL_IDX_OPTION_OFFSETS];
        if ( offsets == NULL )
            free(offsets);

        offsets = sane_reflection_offsets[SANE_REFL_IDX_PARAMS_OFFSETS];
        if ( offsets == NULL )
            free(offsets);

        free(sane_reflection_offsets);
        sane_reflection_offsets = NULL;
    }
}
