module haru.hpdf_error;

import std.string : format;
import enum_enhancers;

mixin dequalifyEnum!HPDF_STATUS;
mixin toStringifyEnum!HPDF_STATUS;
enum HPDF_STATUS
{

/* error-codes */
    HPDF_ARRAY_COUNT_ERR                      = 0x1001,
    HPDF_ARRAY_ITEM_NOT_FOUND                 = 0x1002,
    HPDF_ARRAY_ITEM_UNEXPECTED_TYPE           = 0x1003,
    HPDF_BINARY_LENGTH_ERR                    = 0x1004,
    HPDF_CANNOT_GET_PALLET                    = 0x1005,
/*                                              0x1006 */
    HPDF_DICT_COUNT_ERR                       = 0x1007,
    HPDF_DICT_ITEM_NOT_FOUND                  = 0x1008,
    HPDF_DICT_ITEM_UNEXPECTED_TYPE            = 0x1009,
    HPDF_DICT_STREAM_LENGTH_NOT_FOUND         = 0x100A,
    HPDF_DOC_ENCRYPTDICT_NOT_FOUND            = 0x100B,
    HPDF_DOC_INVALID_OBJECT                   = 0x100C,
/*                                              0x100D */
    HPDF_DUPLICATE_REGISTRATION               = 0x100E,
    HPDF_EXCEED_JWW_CODE_NUM_LIMIT            = 0x100F,
/*                                              0x1010 */
    HPDF_ENCRYPT_INVALID_PASSWORD             = 0x1011,
/*                                              0x1012 */
    HPDF_ERR_UNKNOWN_CLASS                    = 0x1013,
    HPDF_EXCEED_GSTATE_LIMIT                  = 0x1014,
    HPDF_FAILD_TO_ALLOC_MEM                   = 0x1015,
    HPDF_FILE_IO_ERROR                        = 0x1016,
    HPDF_FILE_OPEN_ERROR                      = 0x1017,
/*                                              0x1018 */
    HPDF_FONT_EXISTS                          = 0x1019,
    HPDF_FONT_INVALID_WIDTHS_TABLE            = 0x101A,
    HPDF_INVALID_AFM_HEADER                   = 0x101B,
    HPDF_INVALID_ANNOTATION                   = 0x101C,
/*                                              0x101D */
    HPDF_INVALID_BIT_PER_COMPONENT            = 0x101E,
    HPDF_INVALID_CHAR_MATRICS_DATA            = 0x101F,
    HPDF_INVALID_COLOR_SPACE                  = 0x1020,
    HPDF_INVALID_COMPRESSION_MODE             = 0x1021,
    HPDF_INVALID_DATE_TIME                    = 0x1022,
    HPDF_INVALID_DESTINATION                  = 0x1023,
/*                                              0x1024 */
    HPDF_INVALID_DOCUMENT                     = 0x1025,
    HPDF_INVALID_DOCUMENT_STATE               = 0x1026,
    HPDF_INVALID_ENCODER                      = 0x1027,
    HPDF_INVALID_ENCODER_TYPE                 = 0x1028,
/*                                              0x1029 */
/*                                              0x102A */
    HPDF_INVALID_ENCODING_NAME                = 0x102B,
    HPDF_INVALID_ENCRYPT_KEY_LEN              = 0x102C,
    HPDF_INVALID_FONTDEF_DATA                 = 0x102D,
    HPDF_INVALID_FONTDEF_TYPE                 = 0x102E,
    HPDF_INVALID_FONT_NAME                    = 0x102F,
    HPDF_INVALID_IMAGE                        = 0x1030,
    HPDF_INVALID_JPEG_DATA                    = 0x1031,
    HPDF_INVALID_N_DATA                       = 0x1032,
    HPDF_INVALID_OBJECT                       = 0x1033,
    HPDF_INVALID_OBJ_ID                       = 0x1034,
    HPDF_INVALID_OPERATION                    = 0x1035,
    HPDF_INVALID_OUTLINE                      = 0x1036,
    HPDF_INVALID_PAGE                         = 0x1037,
    HPDF_INVALID_PAGES                        = 0x1038,
    HPDF_INVALID_PARAMETER                    = 0x1039,
/*                                              0x103A */
    HPDF_INVALID_PNG_IMAGE                    = 0x103B,
    HPDF_INVALID_STREAM                       = 0x103C,
    HPDF_MISSING_FILE_NAME_ENTRY              = 0x103D,
/*                                              0x103E */
    HPDF_INVALID_TTC_FILE                     = 0x103F,
    HPDF_INVALID_TTC_INDEX                    = 0x1040,
    HPDF_INVALID_WX_DATA                      = 0x1041,
    HPDF_ITEM_NOT_FOUND                       = 0x1042,
    HPDF_LIBPNG_ERROR                         = 0x1043,
    HPDF_NAME_INVALID_VALUE                   = 0x1044,
    HPDF_NAME_OUT_OF_RANGE                    = 0x1045,
/*                                              0x1046 */
/*                                              0x1047 */
    HPDF_PAGE_INVALID_PARAM_COUNT             = 0x1048,
    HPDF_PAGES_MISSING_KIDS_ENTRY             = 0x1049,
    HPDF_PAGE_CANNOT_FIND_OBJECT              = 0x104A,
    HPDF_PAGE_CANNOT_GET_ROOT_PAGES           = 0x104B,
    HPDF_PAGE_CANNOT_RESTORE_GSTATE           = 0x104C,
    HPDF_PAGE_CANNOT_SET_PARENT               = 0x104D,
    HPDF_PAGE_FONT_NOT_FOUND                  = 0x104E,
    HPDF_PAGE_INVALID_FONT                    = 0x104F,
    HPDF_PAGE_INVALID_FONT_SIZE               = 0x1050,
    HPDF_PAGE_INVALID_GMODE                   = 0x1051,
    HPDF_PAGE_INVALID_INDEX                   = 0x1052,
    HPDF_PAGE_INVALID_ROTATE_VALUE            = 0x1053,
    HPDF_PAGE_INVALID_SIZE                    = 0x1054,
    HPDF_PAGE_INVALID_XOBJECT                 = 0x1055,
    HPDF_PAGE_OUT_OF_RANGE                    = 0x1056,
    HPDF_REAL_OUT_OF_RANGE                    = 0x1057,
    HPDF_STREAM_EOF                           = 0x1058,
    HPDF_STREAM_READLN_CONTINUE               = 0x1059,
/*                                              0x105A */
    HPDF_STRING_OUT_OF_RANGE                  = 0x105B,
    HPDF_THIS_FUNC_WAS_SKIPPED                = 0x105C,
    HPDF_TTF_CANNOT_EMBEDDING_FONT            = 0x105D,
    HPDF_TTF_INVALID_CMAP                     = 0x105E,
    HPDF_TTF_INVALID_FOMAT                    = 0x105F,
    HPDF_TTF_MISSING_TABLE                    = 0x1060,
    HPDF_UNSUPPORTED_FONT_TYPE                = 0x1061,
    HPDF_UNSUPPORTED_FUNC                     = 0x1062,
    HPDF_UNSUPPORTED_JPEG_FORMAT              = 0x1063,
    HPDF_UNSUPPORTED_TYPE1_FONT               = 0x1064,
    HPDF_XREF_COUNT_ERR                       = 0x1065,
    HPDF_ZLIB_ERROR                           = 0x1066,
    HPDF_INVALID_PAGE_INDEX                   = 0x1067,
    HPDF_INVALID_URI                          = 0x1068,
    HPDF_PAGE_LAYOUT_OUT_OF_RANGE             = 0x1069,
    HPDF_PAGE_MODE_OUT_OF_RANGE               = 0x1070,
    HPDF_PAGE_NUM_STYLE_OUT_OF_RANGE          = 0x1071,
    HPDF_ANNOT_INVALID_ICON                   = 0x1072,
    HPDF_ANNOT_INVALID_BORDER_STYLE           = 0x1073,
    HPDF_PAGE_INVALID_DIRECTION               = 0x1074,
    HPDF_INVALID_FONT                         = 0x1075,
    HPDF_PAGE_INSUFFICIENT_SPACE              = 0x1076,
    HPDF_PAGE_INVALID_DISPLAY_TIME            = 0x1077,
    HPDF_PAGE_INVALID_TRANSITION_TIME         = 0x1078,
    HPDF_INVALID_PAGE_SLIDESHOW_TYPE          = 0x1079,
    HPDF_EXT_GSTATE_OUT_OF_RANGE              = 0x1080,
    HPDF_INVALID_EXT_GSTATE                   = 0x1081,
    HPDF_EXT_GSTATE_READ_ONLY                 = 0x1082,
    HPDF_INVALID_U3D_DATA                     = 0x1083,
    HPDF_NAME_CANNOT_GET_NAMES                = 0x1084,
    HPDF_INVALID_ICC_COMPONENT_NUM            = 0x1085,

}

pure nothrow string toMessage(HPDF_STATUS status)
{
    final switch(status)
    {
        case HPDF_ARRAY_COUNT_ERR: return "Internal error. The consistency of the data was lost.";
        case HPDF_ARRAY_ITEM_NOT_FOUND: return "Internal error. The consistency of the data was lost.";
        case HPDF_ARRAY_ITEM_UNEXPECTED_TYPE: return "Internal error. The consistency of the data was lost.";
        case HPDF_BINARY_LENGTH_ERR: return "The length of the data exceeds HPDF_LIMIT_MAX_STRING_LEN.";
        case HPDF_CANNOT_GET_PALLET: return "Cannot get a pallet data from PNG image.";
        case HPDF_DICT_COUNT_ERR: return "The count of elements of a dictionary exceeds HPDF_LIMIT_MAX_DICT_ELEMENT";
        case HPDF_DICT_ITEM_NOT_FOUND: return "Internal error. The consistency of the data was lost.";
        case HPDF_DICT_ITEM_UNEXPECTED_TYPE: return "Internal error. The consistency of the data was lost.";
        case HPDF_DICT_STREAM_LENGTH_NOT_FOUND: return "Internal error. The consistency of the data was lost.";
        case HPDF_DOC_ENCRYPTDICT_NOT_FOUND: return "HPDF_SetPermission() OR HPDF_SetEncryptMode() was called before a password is set.";
        case HPDF_DOC_INVALID_OBJECT: return "Internal error. The consistency of the data was lost.";
        case HPDF_DUPLICATE_REGISTRATION: return "Tried to register a font that has been registered.";
        case HPDF_EXCEED_JWW_CODE_NUM_LIMIT: return "Cannot register a character to the japanese word wrap characters list.";
        case HPDF_ENCRYPT_INVALID_PASSWORD: return "Tried to set the owner password to NULL. The owner password and user password is the same.";
        case HPDF_ERR_UNKNOWN_CLASS: return "Internal error. The consistency of the data was lost.";
        case HPDF_EXCEED_GSTATE_LIMIT: return "The depth of the stack exceeded HPDF_LIMIT_MAX_GSTATE.";
        case HPDF_FAILD_TO_ALLOC_MEM: return "Memory allocation failed.";
        case HPDF_FILE_IO_ERROR: return "File processing failed. (A detailed code is set.)";
        case HPDF_FILE_OPEN_ERROR: return "Cannot open a file. (A detailed code is set.)";
        case HPDF_FONT_EXISTS: return "Tried to load a font that has been registered.";
        case HPDF_FONT_INVALID_WIDTHS_TABLE: return "The format of a font-file is invalid. Internal error. The consistency of the data was lost.";
        case HPDF_INVALID_AFM_HEADER: return "Cannot recognize a header of an afm file.";
        case HPDF_INVALID_ANNOTATION: return "The specified annotation handle is invalid.";
        case HPDF_INVALID_BIT_PER_COMPONENT: return "Bit-per-component of a image which was set as mask-image is invalid.";
        case HPDF_INVALID_CHAR_MATRICS_DATA: return "Cannot recognize char-matrics-data  of an afm file.";
        case HPDF_INVALID_COLOR_SPACE: return "1. The color_space parameter of HPDF_LoadRawImage is invalid.  2. Color-space of a image which was set as mask-image is invalid.  3. The function which is invalid in the present color-space was invoked.";
        case HPDF_INVALID_COMPRESSION_MODE: return "Invalid value was set when invoking HPDF_SetCommpressionMode().";
        case HPDF_INVALID_DATE_TIME: return "An invalid date-time value was set.";
        case HPDF_INVALID_DESTINATION: return "An invalid destination handle was set.";
        case HPDF_INVALID_DOCUMENT: return "An invalid document handle is set.";
        case HPDF_INVALID_DOCUMENT_STATE: return "The function which is invalid in the present state was invoked.";
        case HPDF_INVALID_ENCODER: return "An invalid encoder handle is set.";
        case HPDF_INVALID_ENCODER_TYPE: return "A combination between font and encoder is wrong.";
        case HPDF_INVALID_ENCODING_NAME: return "An Invalid encoding name is specified.";
        case HPDF_INVALID_ENCRYPT_KEY_LEN: return "The lengh of the key of encryption is invalid.";
        case HPDF_INVALID_FONTDEF_DATA: return "1. An invalid font handle was set.  2. Unsupported font format.";
        case HPDF_INVALID_FONTDEF_TYPE: return "Internal error. The consistency of the data was lost.";
        case HPDF_INVALID_FONT_NAME: return "A font which has the specified name is not found.";
        case HPDF_INVALID_IMAGE: return "Unsupported image format.";
        case HPDF_INVALID_JPEG_DATA: return "Unsupported image format.";
        case HPDF_INVALID_N_DATA: return "Cannot read a postscript-name from an afm file.";
        case HPDF_INVALID_OBJECT: return "1. An invalid object is set.2. Internal error. The consistency of the data was lost.";
        case HPDF_INVALID_OBJ_ID: return "Internal error. The consistency of the data was lost.";
        case HPDF_INVALID_OPERATION: return "1. Invoked HPDF_Image_SetColorMask() against the image-object which was set a mask-image.";
        case HPDF_INVALID_OUTLINE: return "An invalid outline-handle was specified.";
        case HPDF_INVALID_PAGE: return "An invalid page-handle was specified.";
        case HPDF_INVALID_PAGES: return "An invalid pages-handle was specified. (internel error)";
        case HPDF_INVALID_PARAMETER: return "An invalid value is set.";
        case HPDF_INVALID_PNG_IMAGE: return "Invalid PNG image format.";
        case HPDF_INVALID_STREAM: return "Internal error. The consistency of the data was lost.";
        case HPDF_MISSING_FILE_NAME_ENTRY: return "Internal error. The \"_FILE_NAME\" entry for delayed loading is missing.";
        case HPDF_INVALID_TTC_FILE: return "Invalid .TTC file format.";
        case HPDF_INVALID_TTC_INDEX: return "The index parameter was exceed the number of included fonts";
        case HPDF_INVALID_WX_DATA: return "Cannot read a width-data from an afm file.";
        case HPDF_ITEM_NOT_FOUND: return "Internal error. The consistency of the data was lost.";
        case HPDF_LIBPNG_ERROR: return "An error has returned from PNGLIB while loading an image.";
        case HPDF_NAME_INVALID_VALUE: return "Internal error. The consistency of the data was lost.";
        case HPDF_NAME_OUT_OF_RANGE: return "Internal error. The consistency of the data was lost.";
        case HPDF_PAGES_MISSING_KIDS_ENTRY: return "Internal error. The consistency of the data was lost.";
        case HPDF_PAGE_CANNOT_FIND_OBJECT: return "Internal error. The consistency of the data was lost.";
        case HPDF_PAGE_CANNOT_GET_ROOT_PAGES: return "Internal error. The consistency of the data was lost.";
        case HPDF_PAGE_CANNOT_RESTORE_GSTATE: return "There are no graphics-states to be restored.";
        case HPDF_PAGE_CANNOT_SET_PARENT: return "Internal error. The consistency of the data was lost.";
        case HPDF_PAGE_FONT_NOT_FOUND: return "The current font is not set.";
        case HPDF_PAGE_INVALID_FONT: return "An invalid font-handle was spacified.";
        case HPDF_PAGE_INVALID_FONT_SIZE: return "An invalid font-size was set.";
        case HPDF_PAGE_INVALID_GMODE: return "See Graphics mode.";
        case HPDF_PAGE_INVALID_INDEX: return "Internal error. The consistency of the data was lost.";
        case HPDF_PAGE_INVALID_ROTATE_VALUE: return "The specified value is not a multiple of 90.";
        case HPDF_PAGE_INVALID_SIZE: return "An invalid page-size was set.";
        case HPDF_PAGE_INVALID_XOBJECT: return "An invalid image-handle was set.";
        case HPDF_PAGE_OUT_OF_RANGE: return "The specified value is out of range.";
        case HPDF_REAL_OUT_OF_RANGE: return "The specified value is out of range.";
        case HPDF_STREAM_EOF: return "Unexpected EOF marker was detected.";
        case HPDF_STREAM_READLN_CONTINUE: return "Internal error. The consistency of the data was lost.";
        case HPDF_STRING_OUT_OF_RANGE: return "The length of the specified text is too long.";
        case HPDF_THIS_FUNC_WAS_SKIPPED: return "The execution of a function was skipped because of other errors.";
        case HPDF_TTF_CANNOT_EMBEDDING_FONT: return "This font cannot be embedded. (restricted by license)";
        case HPDF_TTF_INVALID_CMAP: return "Unsupported ttf format. (cannot find unicode cmap.)";
        case HPDF_TTF_INVALID_FOMAT: return "Unsupported ttf format.";
        case HPDF_TTF_MISSING_TABLE: return "Unsupported ttf format. (cannot find a necessary table)";
        case HPDF_UNSUPPORTED_FONT_TYPE: return "Internal error. The consistency of the data was lost.";
        case HPDF_UNSUPPORTED_FUNC: return "1. The library is not configured to use PNGLIB.  2. Internal error. The consistency of the data was lost.";
        case HPDF_UNSUPPORTED_JPEG_FORMAT: return "Unsupported Jpeg format.";
        case HPDF_UNSUPPORTED_TYPE1_FONT: return "Failed to parse .PFB file.";
        case HPDF_XREF_COUNT_ERR: return "Internal error. The consistency of the data was lost.";
        case HPDF_ZLIB_ERROR: return "An error has occurred while executing a function of Zlib.";
        case HPDF_INVALID_PAGE_INDEX: return "An error returned from Zlib.";
        case HPDF_INVALID_URI: return "An invalid URI was set.";
        case HPDF_PAGE_LAYOUT_OUT_OF_RANGE: return "An invalid page-layout was set.";
        case HPDF_PAGE_MODE_OUT_OF_RANGE: return "An invalid page-mode was set.";
        case HPDF_PAGE_NUM_STYLE_OUT_OF_RANGE: return "An invalid page-num-style was set.";
        case HPDF_ANNOT_INVALID_ICON: return "An invalid icon was set.";
        case HPDF_ANNOT_INVALID_BORDER_STYLE: return "An invalid border-style was set.";
        case HPDF_PAGE_INVALID_DIRECTION: return "An invalid page-direction was set.";
        case HPDF_INVALID_FONT: return "An invalid font-handle was specified.";

        /* Longer descriptions weren't provided for these on the webpage: */
        /* http://libharu.sourceforge.net/error_handling.html */
        case HPDF_PAGE_INVALID_PARAM_COUNT: return "HPDF_PAGE_INVALID_PARAM_COUNT";
        case HPDF_PAGE_INSUFFICIENT_SPACE: return "HPDF_PAGE_INSUFFICIENT_SPACE";
        case HPDF_PAGE_INVALID_DISPLAY_TIME: return "HPDF_PAGE_INVALID_DISPLAY_TIME";
        case HPDF_PAGE_INVALID_TRANSITION_TIME: return "HPDF_PAGE_INVALID_TRANSITION_TIME";
        case HPDF_INVALID_PAGE_SLIDESHOW_TYPE: return "HPDF_INVALID_PAGE_SLIDESHOW_TYPE";
        case HPDF_EXT_GSTATE_OUT_OF_RANGE: return "HPDF_EXT_GSTATE_OUT_OF_RANGE";
        case HPDF_INVALID_EXT_GSTATE: return "HPDF_INVALID_EXT_GSTATE";
        case HPDF_EXT_GSTATE_READ_ONLY: return "HPDF_EXT_GSTATE_READ_ONLY";
        case HPDF_INVALID_U3D_DATA: return "HPDF_INVALID_U3D_DATA";
        case HPDF_NAME_CANNOT_GET_NAMES: return "HPDF_NAME_CANNOT_GET_NAMES";
        case HPDF_INVALID_ICC_COMPONENT_NUM: return "HPDF_INVALID_ICC_COMPONENT_NUM";
    }
    assert(0);
}

class HpdfException : Exception
{
    this(HPDF_STATUS status)
    {
        super(format("%s (%04X): %s", .toString(status), status, .toMessage(status) ));
    }
}

void throwOnError(HPDF_STATUS status)
{
    if ( status )
        throw new HpdfException(status);
}

