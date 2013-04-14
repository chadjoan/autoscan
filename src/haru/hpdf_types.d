module haru.hpdf_types;

import haru.hpdf_error;

import enum_enhancers;

/*----------------------------------------------------------------------------*/
/*----- type definition ------------------------------------------------------*/


/*  native OS integer types */
//typedef  signed int          HPDF_INT;
//typedef  unsigned int        HPDF_UINT;
alias int  HPDF_INT;
alias uint HPDF_UINT;

/*  32bit integer types
 */
alias int  HPDF_INT32;
alias uint HPDF_UINT32;
//typedef  signed int          HPDF_INT32;
//typedef  unsigned int        HPDF_UINT32;


/*  16bit integer types
 */
alias short  HPDF_INT16;
alias ushort HPDF_UINT16;
//typedef  signed short        HPDF_INT16;
//typedef  unsigned short      HPDF_UINT16;


/*  8bit integer types
 */
alias byte  HPDF_INT8;
alias ubyte HPDF_UINT8;
//typedef  signed char         HPDF_INT8;
//typedef  unsigned char       HPDF_UINT8;


/*  8bit binary types
 */
alias ubyte HPDF_BYTE;
//typedef  unsigned char       HPDF_BYTE;


/*  float type (32bit IEEE754)
 */
alias float HPDF_REAL;
//typedef  float               HPDF_REAL;


/*  double type (64bit IEEE754)
 */
alias double HPDF_DOUBLE;
//typedef  double              HPDF_DOUBLE;


/*  boolean type (0: False, !0: True)
 */
alias int HPDF_BOOL;
//typedef  signed int          HPDF_BOOL;


/*  error-no type (32bit unsigned integer)
 */
// Defined in hpdf_error.d
//typedef  unsigned long       HPDF_STATUS;


/*  charactor-code type (16bit)
 */
alias HPDF_UINT16  HPDF_CID;
alias HPDF_UINT16  HPDF_UNICODE;


/*  HPDF_Point struct
 */
struct HPDF_Point
{
    HPDF_REAL x;
    HPDF_REAL y;
}

struct HPDF_Rect
{
    HPDF_REAL  left;
    HPDF_REAL  bottom;
    HPDF_REAL  right;
    HPDF_REAL  top;
}

/*  HPDF_Point3D struct
*/
struct HPDF_Point3D
{
    HPDF_REAL  x;
    HPDF_REAL  y;
    HPDF_REAL  z;
}

alias HPDF_Rect HPDF_Box;
//typedef struct _HPDF_Rect HPDF_Box;

/* HPDF_Date struct
 */
struct HPDF_Date
{
    HPDF_INT    year;
    HPDF_INT    month;
    HPDF_INT    day;
    HPDF_INT    hour;
    HPDF_INT    minutes;
    HPDF_INT    seconds;
    ubyte       ind;
    HPDF_INT    off_hour;
    HPDF_INT    off_minutes;
}


mixin dequalifyEnum!HPDF_InfoType;
mixin toStringifyEnum!HPDF_InfoType;
enum HPDF_InfoType
{
    /* date-time type parameters */
    HPDF_INFO_CREATION_DATE = 0,
    HPDF_INFO_MOD_DATE,

    /* string type parameters */
    HPDF_INFO_AUTHOR,
    HPDF_INFO_CREATOR,
    HPDF_INFO_PRODUCER,
    HPDF_INFO_TITLE,
    HPDF_INFO_SUBJECT,
    HPDF_INFO_KEYWORDS,
    HPDF_INFO_TRAPPED,
    HPDF_INFO_GTS_PDFX,
    HPDF_INFO_EOF
}

/* PDF-A Types */

mixin dequalifyEnum!HPDF_PDFA_TYPE;
mixin toStringifyEnum!HPDF_PDFA_TYPE;
enum HPDF_PDFA_TYPE
{
    HPDF_PDFA_1A = 0,
    HPDF_PDFA_1B = 1
}


mixin dequalifyEnum!HPDF_PdfVer;
mixin toStringifyEnum!HPDF_PdfVer;
enum HPDF_PdfVer
{
    HPDF_VER_12 = 0,
    HPDF_VER_13,
    HPDF_VER_14,
    HPDF_VER_15,
    HPDF_VER_16,
    HPDF_VER_17,
    HPDF_VER_EOF
}

mixin dequalifyEnum!HPDF_EncryptMode;
mixin toStringifyEnum!HPDF_EncryptMode;
enum HPDF_EncryptMode
{
    HPDF_ENCRYPT_R2    = 2,
    HPDF_ENCRYPT_R3    = 3
}

/*
typedef void
(HPDF_STDCALL *HPDF_Error_Handler)  (HPDF_STATUS   error_no,
                                     HPDF_STATUS   detail_no,
                                     void         *user_data);

typedef void*
(HPDF_STDCALL *HPDF_Alloc_Func)  (HPDF_UINT  size);


typedef void
(HPDF_STDCALL *HPDF_Free_Func)  (void  *aptr);
*/

alias extern(C)
    void function(
        HPDF_STATUS error_no,
        HPDF_STATUS detail_no,
        void*       user_data)
            HPDF_Error_Handler;

alias extern(C) void* function(HPDF_UINT size) HPDF_Alloc_Func;
alias extern(C) void  function(void* aptr)     HPDF_Free_Func;


/*---------------------------------------------------------------------------*/
/*------ text width struct --------------------------------------------------*/

struct HPDF_TextWidth
{
    HPDF_UINT numchars;

    /* don't use this value (it may be change in the feature).
       use numspace as alternated. */
    HPDF_UINT numwords;

    HPDF_UINT width;
    HPDF_UINT numspace;
}


/*---------------------------------------------------------------------------*/
/*------ dash mode ----------------------------------------------------------*/

struct HPDF_DashMode
{
    HPDF_UINT16[8] ptn;  // TODO: testing.
    HPDF_UINT      num_ptn;
    HPDF_UINT      phase;
}

/*---------------------------------------------------------------------------*/
/*----- HPDF_TransMatrix struct ---------------------------------------------*/

struct HPDF_TransMatrix
{
    HPDF_REAL   a;
    HPDF_REAL   b;
    HPDF_REAL   c;
    HPDF_REAL   d;
    HPDF_REAL   x;
    HPDF_REAL   y;
}

/*---------------------------------------------------------------------------*/

mixin dequalifyEnum!HPDF_ColorSpace;
mixin toStringifyEnum!HPDF_ColorSpace;
enum HPDF_ColorSpace
{
    HPDF_CS_DEVICE_GRAY = 0,
    HPDF_CS_DEVICE_RGB,
    HPDF_CS_DEVICE_CMYK,
    HPDF_CS_CAL_GRAY,
    HPDF_CS_CAL_RGB,
    HPDF_CS_LAB,
    HPDF_CS_ICC_BASED,
    HPDF_CS_SEPARATION,
    HPDF_CS_DEVICE_N,
    HPDF_CS_INDEXED,
    HPDF_CS_PATTERN,
    HPDF_CS_EOF
}

/*---------------------------------------------------------------------------*/
/*----- HPDF_RGBColor struct ------------------------------------------------*/

struct HPDF_RGBColor
{
    HPDF_REAL   r;
    HPDF_REAL   g;
    HPDF_REAL   b;
}

/*---------------------------------------------------------------------------*/
/*----- HPDF_CMYKColor struct -----------------------------------------------*/

struct HPDF_CMYKColor
{
    HPDF_REAL   c;
    HPDF_REAL   m;
    HPDF_REAL   y;
    HPDF_REAL   k;
}

/*---------------------------------------------------------------------------*/
/*------ The line cap style -------------------------------------------------*/

mixin dequalifyEnum!HPDF_LineCap;
mixin toStringifyEnum!HPDF_LineCap;
enum HPDF_LineCap
{
    HPDF_BUTT_END = 0,
    HPDF_ROUND_END,
    HPDF_PROJECTING_SCUARE_END,
    HPDF_LINECAP_EOF
}

/*----------------------------------------------------------------------------*/
/*------ The line join style -------------------------------------------------*/

mixin dequalifyEnum!HPDF_LineJoin;
mixin toStringifyEnum!HPDF_LineJoin;
enum HPDF_LineJoin
{
    HPDF_MITER_JOIN = 0,
    HPDF_ROUND_JOIN,
    HPDF_BEVEL_JOIN,
    HPDF_LINEJOIN_EOF
}

/*----------------------------------------------------------------------------*/
/*------ The text rendering mode ---------------------------------------------*/

mixin dequalifyEnum!HPDF_TextRenderingMode;
mixin toStringifyEnum!HPDF_TextRenderingMode;
enum HPDF_TextRenderingMode
{
    HPDF_FILL = 0,
    HPDF_STROKE,
    HPDF_FILL_THEN_STROKE,
    HPDF_INVISIBLE,
    HPDF_FILL_CLIPPING,
    HPDF_STROKE_CLIPPING,
    HPDF_FILL_STROKE_CLIPPING,
    HPDF_CLIPPING,
    HPDF_RENDERING_MODE_EOF
}

mixin dequalifyEnum!HPDF_WritingMode;
mixin toStringifyEnum!HPDF_WritingMode;
enum HPDF_WritingMode
{
    HPDF_WMODE_HORIZONTAL = 0,
    HPDF_WMODE_VERTICAL,
    HPDF_WMODE_EOF
}

mixin dequalifyEnum!HPDF_PageLayout;
mixin toStringifyEnum!HPDF_PageLayout;
enum HPDF_PageLayout
{
    HPDF_PAGE_LAYOUT_SINGLE = 0,
    HPDF_PAGE_LAYOUT_ONE_COLUMN,
    HPDF_PAGE_LAYOUT_TWO_COLUMN_LEFT,
    HPDF_PAGE_LAYOUT_TWO_COLUMN_RIGHT,
    HPDF_PAGE_LAYOUT_TWO_PAGE_LEFT,
    HPDF_PAGE_LAYOUT_TWO_PAGE_RIGHT,
    HPDF_PAGE_LAYOUT_EOF
}

mixin dequalifyEnum!HPDF_PageMode;
mixin toStringifyEnum!HPDF_PageMode;
enum HPDF_PageMode
{
    HPDF_PAGE_MODE_USE_NONE = 0,
    HPDF_PAGE_MODE_USE_OUTLINE,
    HPDF_PAGE_MODE_USE_THUMBS,
    HPDF_PAGE_MODE_FULL_SCREEN,
/*  HPDF_PAGE_MODE_USE_OC,
    HPDF_PAGE_MODE_USE_ATTACHMENTS,
 */
    HPDF_PAGE_MODE_EOF
}


mixin dequalifyEnum!HPDF_PageNumStyle;
mixin toStringifyEnum!HPDF_PageNumStyle;
enum HPDF_PageNumStyle
{
    HPDF_PAGE_NUM_STYLE_DECIMAL = 0,
    HPDF_PAGE_NUM_STYLE_UPPER_ROMAN,
    HPDF_PAGE_NUM_STYLE_LOWER_ROMAN,
    HPDF_PAGE_NUM_STYLE_UPPER_LETTERS,
    HPDF_PAGE_NUM_STYLE_LOWER_LETTERS,
    HPDF_PAGE_NUM_STYLE_EOF
}


mixin dequalifyEnum!HPDF_DestinationType;
mixin toStringifyEnum!HPDF_DestinationType;
enum HPDF_DestinationType
{
    HPDF_XYZ = 0,
    HPDF_FIT,
    HPDF_FIT_H,
    HPDF_FIT_V,
    HPDF_FIT_R,
    HPDF_FIT_B,
    HPDF_FIT_BH,
    HPDF_FIT_BV,
    HPDF_DST_EOF
}


mixin dequalifyEnum!HPDF_AnnotType;
mixin toStringifyEnum!HPDF_AnnotType;
enum HPDF_AnnotType
{
    HPDF_ANNOT_TEXT_NOTES,
    HPDF_ANNOT_LINK,
    HPDF_ANNOT_SOUND,
    HPDF_ANNOT_FREE_TEXT,
    HPDF_ANNOT_STAMP,
    HPDF_ANNOT_SQUARE,
    HPDF_ANNOT_CIRCLE,
    HPDF_ANNOT_STRIKE_OUT,
    HPDF_ANNOT_HIGHTLIGHT,
    HPDF_ANNOT_UNDERLINE,
    HPDF_ANNOT_INK,
    HPDF_ANNOT_FILE_ATTACHMENT,
    HPDF_ANNOT_POPUP,
    HPDF_ANNOT_3D,
    HPDF_ANNOT_SQUIGGLY,
    HPDF_ANNOT_LINE,
    HPDF_ANNOT_PROJECTION
}


mixin dequalifyEnum!HPDF_AnnotFlgs;
mixin toStringifyEnum!HPDF_AnnotFlgs;
enum HPDF_AnnotFlgs
{
    HPDF_ANNOT_INVISIBLE,
    HPDF_ANNOT_HIDDEN,
    HPDF_ANNOT_PRINT,
    HPDF_ANNOT_NOZOOM,
    HPDF_ANNOT_NOROTATE,
    HPDF_ANNOT_NOVIEW,
    HPDF_ANNOT_READONLY
}


mixin dequalifyEnum!HPDF_AnnotHighlightMode;
mixin toStringifyEnum!HPDF_AnnotHighlightMode;
enum HPDF_AnnotHighlightMode
{
    HPDF_ANNOT_NO_HIGHTLIGHT = 0,
    HPDF_ANNOT_INVERT_BOX,
    HPDF_ANNOT_INVERT_BORDER,
    HPDF_ANNOT_DOWN_APPEARANCE,
    HPDF_ANNOT_HIGHTLIGHT_MODE_EOF
}


mixin dequalifyEnum!HPDF_AnnotIcon;
mixin toStringifyEnum!HPDF_AnnotIcon;
enum HPDF_AnnotIcon
{
    HPDF_ANNOT_ICON_COMMENT = 0,
    HPDF_ANNOT_ICON_KEY,
    HPDF_ANNOT_ICON_NOTE,
    HPDF_ANNOT_ICON_HELP,
    HPDF_ANNOT_ICON_NEW_PARAGRAPH,
    HPDF_ANNOT_ICON_PARAGRAPH,
    HPDF_ANNOT_ICON_INSERT,
    HPDF_ANNOT_ICON_EOF
}

mixin dequalifyEnum!HPDF_AnnotIntent;
mixin toStringifyEnum!HPDF_AnnotIntent;
enum HPDF_AnnotIntent
{
    HPDF_ANNOT_INTENT_FREETEXTCALLOUT = 0,
    HPDF_ANNOT_INTENT_FREETEXTTYPEWRITER,
    HPDF_ANNOT_INTENT_LINEARROW,
    HPDF_ANNOT_INTENT_LINEDIMENSION,
    HPDF_ANNOT_INTENT_POLYGONCLOUD,
    HPDF_ANNOT_INTENT_POLYLINEDIMENSION,
    HPDF_ANNOT_INTENT_POLYGONDIMENSION
}

mixin dequalifyEnum!HPDF_LineAnnotEndingStyle;
mixin toStringifyEnum!HPDF_LineAnnotEndingStyle;
enum HPDF_LineAnnotEndingStyle
{
    HPDF_LINE_ANNOT_NONE = 0,
    HPDF_LINE_ANNOT_SQUARE,
    HPDF_LINE_ANNOT_CIRCLE,
    HPDF_LINE_ANNOT_DIAMOND,
    HPDF_LINE_ANNOT_OPENARROW,
    HPDF_LINE_ANNOT_CLOSEDARROW,
    HPDF_LINE_ANNOT_BUTT,
    HPDF_LINE_ANNOT_ROPENARROW,
    HPDF_LINE_ANNOT_RCLOSEDARROW,
    HPDF_LINE_ANNOT_SLASH
}

mixin dequalifyEnum!HPDF_LineAnnotCapPosition;
mixin toStringifyEnum!HPDF_LineAnnotCapPosition;
enum HPDF_LineAnnotCapPosition
{
    HPDF_LINE_ANNOT_CAP_INLINE = 0,
    HPDF_LINE_ANNOT_CAP_TOP
}

mixin dequalifyEnum!HPDF_StampAnnotName;
mixin toStringifyEnum!HPDF_StampAnnotName;
enum HPDF_StampAnnotName
{
    HPDF_STAMP_ANNOT_APPROVED = 0,
    HPDF_STAMP_ANNOT_EXPERIMENTAL,
    HPDF_STAMP_ANNOT_NOTAPPROVED,
    HPDF_STAMP_ANNOT_ASIS,
    HPDF_STAMP_ANNOT_EXPIRED,
    HPDF_STAMP_ANNOT_NOTFORPUBLICRELEASE,
    HPDF_STAMP_ANNOT_CONFIDENTIAL,
    HPDF_STAMP_ANNOT_FINAL,
    HPDF_STAMP_ANNOT_SOLD,
    HPDF_STAMP_ANNOT_DEPARTMENTAL,
    HPDF_STAMP_ANNOT_FORCOMMENT,
    HPDF_STAMP_ANNOT_TOPSECRET,
    HPDF_STAMP_ANNOT_DRAFT,
    HPDF_STAMP_ANNOT_FORPUBLICRELEASE
}

/*----------------------------------------------------------------------------*/
/*------ border stype --------------------------------------------------------*/

mixin dequalifyEnum!HPDF_BSSubtype;
mixin toStringifyEnum!HPDF_BSSubtype;
enum HPDF_BSSubtype
{
    HPDF_BS_SOLID,
    HPDF_BS_DASHED,
    HPDF_BS_BEVELED,
    HPDF_BS_INSET,
    HPDF_BS_UNDERLINED
}


/*----- blend modes ----------------------------------------------------------*/

mixin dequalifyEnum!HPDF_BlendMode;
mixin toStringifyEnum!HPDF_BlendMode;
enum HPDF_BlendMode
{
    HPDF_BM_NORMAL,
    HPDF_BM_MULTIPLY,
    HPDF_BM_SCREEN,
    HPDF_BM_OVERLAY,
    HPDF_BM_DARKEN,
    HPDF_BM_LIGHTEN,
    HPDF_BM_COLOR_DODGE,
    HPDF_BM_COLOR_BUM,
    HPDF_BM_HARD_LIGHT,
    HPDF_BM_SOFT_LIGHT,
    HPDF_BM_DIFFERENCE,
    HPDF_BM_EXCLUSHON,
    HPDF_BM_EOF
}

/*----- slide show -----------------------------------------------------------*/

mixin dequalifyEnum!HPDF_TransitionStyle;
mixin toStringifyEnum!HPDF_TransitionStyle;
enum HPDF_TransitionStyle
{
    HPDF_TS_WIPE_RIGHT = 0,
    HPDF_TS_WIPE_UP,
    HPDF_TS_WIPE_LEFT,
    HPDF_TS_WIPE_DOWN,
    HPDF_TS_BARN_DOORS_HORIZONTAL_OUT,
    HPDF_TS_BARN_DOORS_HORIZONTAL_IN,
    HPDF_TS_BARN_DOORS_VERTICAL_OUT,
    HPDF_TS_BARN_DOORS_VERTICAL_IN,
    HPDF_TS_BOX_OUT,
    HPDF_TS_BOX_IN,
    HPDF_TS_BLINDS_HORIZONTAL,
    HPDF_TS_BLINDS_VERTICAL,
    HPDF_TS_DISSOLVE,
    HPDF_TS_GLITTER_RIGHT,
    HPDF_TS_GLITTER_DOWN,
    HPDF_TS_GLITTER_TOP_LEFT_TO_BOTTOM_RIGHT,
    HPDF_TS_REPLACE,
    HPDF_TS_EOF
}

/*----------------------------------------------------------------------------*/

mixin dequalifyEnum!HPDF_PageSizes;
mixin toStringifyEnum!HPDF_PageSizes;
enum HPDF_PageSizes
{
    HPDF_PAGE_SIZE_LETTER = 0,
    HPDF_PAGE_SIZE_LEGAL,
    HPDF_PAGE_SIZE_A3,
    HPDF_PAGE_SIZE_A4,
    HPDF_PAGE_SIZE_A5,
    HPDF_PAGE_SIZE_B4,
    HPDF_PAGE_SIZE_B5,
    HPDF_PAGE_SIZE_EXECUTIVE,
    HPDF_PAGE_SIZE_US4x6,
    HPDF_PAGE_SIZE_US4x8,
    HPDF_PAGE_SIZE_US5x7,
    HPDF_PAGE_SIZE_COMM10,
    HPDF_PAGE_SIZE_EOF
}


mixin dequalifyEnum!HPDF_PageDirection;
mixin toStringifyEnum!HPDF_PageDirection;
enum HPDF_PageDirection
{
    HPDF_PAGE_PORTRAIT = 0,
    HPDF_PAGE_LANDSCAPE
}


mixin dequalifyEnum!HPDF_EncoderType;
mixin toStringifyEnum!HPDF_EncoderType;
enum HPDF_EncoderType
{
    HPDF_ENCODER_TYPE_SINGLE_BYTE,
    HPDF_ENCODER_TYPE_DOUBLE_BYTE,
    HPDF_ENCODER_TYPE_UNINITIALIZED,
    HPDF_ENCODER_UNKNOWN
}


mixin dequalifyEnum!HPDF_ByteType;
mixin toStringifyEnum!HPDF_ByteType;
enum HPDF_ByteType
{
    HPDF_BYTE_TYPE_SINGLE = 0,
    HPDF_BYTE_TYPE_LEAD,
    HPDF_BYTE_TYPE_TRIAL,
    HPDF_BYTE_TYPE_UNKNOWN
}


mixin dequalifyEnum!HPDF_TextAlignment;
mixin toStringifyEnum!HPDF_TextAlignment;
enum HPDF_TextAlignment
{
    HPDF_TALIGN_LEFT = 0,
    HPDF_TALIGN_RIGHT,
    HPDF_TALIGN_CENTER,
    HPDF_TALIGN_JUSTIFY
}

/*----------------------------------------------------------------------------*/

/* Name Dictionary values -- see PDF reference section 7.7.4 */
mixin dequalifyEnum!HPDF_NameDictKey;
mixin toStringifyEnum!HPDF_NameDictKey;
enum HPDF_NameDictKey
{
    HPDF_NAME_EMBEDDED_FILES = 0,    /* TODO the rest */
    HPDF_NAME_EOF
}
