module tesseract.capi;

import enum_enhancers;
import leptonica.pix;

import core.sys.posix.stdio; // For FILE* and related funcs.

alias int BOOL;

struct TessBaseAPI;


/**
 * Class to iterate over tesseract page structure, providing access to all
 * levels of the page hierarchy, without including any tesseract headers or
 * having to handle any tesseract structures.
 * WARNING! This class points to data held within the TessBaseAPI class, and
 * therefore can only be used while the TessBaseAPI class still exists and
 * has not been subjected to a call of Init, SetImage, Recognize, Clear, End
 * DetectOS, or anything else that changes the internal PAGE_RES.
 * See apitypes.h for the definition of PageIteratorLevel.
 * See also ResultIterator, derived from PageIterator, which adds in the
 * ability to access OCR output with text-specific methods.
 */
struct TessPageIterator;

struct TessResultIterator;
struct TessMutableIterator;

alias int TessOcrEngineMode;
enum
{
    OEM_TESSERACT_ONLY,
    OEM_CUBE_ONLY,
    OEM_TESSERACT_CUBE_COMBINED,
    OEM_DEFAULT
}

alias int TessPageSegMode;
enum
{
    PSM_OSD_ONLY,
    PSM_AUTO_OSD,
    PSM_AUTO_ONLY,
    PSM_AUTO,
    PSM_SINGLE_COLUMN,
    PSM_SINGLE_BLOCK_VERT_TEXT,
    PSM_SINGLE_BLOCK,
    PSM_SINGLE_LINE,
    PSM_SINGLE_WORD,
    PSM_CIRCLE_WORD,
    PSM_SINGLE_CHAR,
    PSM_COUNT
}

mixin toStringifyEnum!TessPageIteratorLevel;
mixin dequalifyEnum!TessPageIteratorLevel;
enum TessPageIteratorLevel
{
    RIL_BLOCK,
    RIL_PARA,
    RIL_TEXTLINE,
    RIL_WORD,
    RIL_SYMBOL
}

alias int TessPolyBlockType;
enum
{
    PT_UNKNOWN,
    PT_FLOWING_TEXT,
    PT_HEADING_TEXT,
    PT_PULLOUT_TEXT,
    PT_TABLE,
    PT_VERTICAL_TEXT,
    PT_CAPTION_TEXT,
    PT_FLOWING_IMAGE,
    PT_HEADING_IMAGE,
    PT_PULLOUT_IMAGE,
    PT_HORZ_LINE,
    PT_VERT_LINE,
    PT_NOISE,
    PT_COUNT
}

alias int TessOrientation;
enum
{
    ORIENTATION_PAGE_UP,
    ORIENTATION_PAGE_RIGHT,
    ORIENTATION_PAGE_DOWN,
    ORIENTATION_PAGE_LEFT
}

alias int TessWritingDirection;
enum
{
    WRITING_DIRECTION_LEFT_TO_RIGHT,
    WRITING_DIRECTION_RIGHT_TO_LEFT,
    WRITING_DIRECTION_TOP_TO_BOTTOM
}

alias int TessTextlineOrder;
enum
{
    TEXTLINE_ORDER_LEFT_TO_RIGHT,
    TEXTLINE_ORDER_RIGHT_TO_LEFT,
    TEXTLINE_ORDER_TOP_TO_BOTTOM
}

struct ETEXT_DESC;
//struct Pix;
struct Boxa;
struct Pixa;

/* General free functions */
extern(C):

const(char)* TessVersion();
void  TessDeleteText(char* text);
void  TessDeleteTextArray(char** arr);
void  TessDeleteIntArray(int* arr);
/+#ifdef TESS_CAPI_INCLUDE_BASEAPI
void  TessDeleteBlockList(BLOCK_LIST* block_list);
#endif+/

/* Base API */

TessBaseAPI* TessBaseAPICreate();
void  TessBaseAPIDelete(TessBaseAPI* handle);

void  TessBaseAPISetInputName( TessBaseAPI* handle, const(char)* name);
void  TessBaseAPISetOutputName(TessBaseAPI* handle, const(char)* name);

BOOL  TessBaseAPISetVariable(TessBaseAPI* handle, const(char)* name, const(char)* value);
BOOL  TessBaseAPISetDebugVariable(TessBaseAPI* handle, const(char)* name, const(char)* value);

BOOL  TessBaseAPIGetIntVariable(   const(TessBaseAPI)* handle, const(char)* name, int* value);
BOOL  TessBaseAPIGetBoolVariable(  const(TessBaseAPI)* handle, const(char)* name, BOOL* value);
BOOL  TessBaseAPIGetDoubleVariable(const(TessBaseAPI)* handle, const(char)* name, double* value);
const(char)* TessBaseAPIGetStringVariable(const(TessBaseAPI)* handle, const(char)* name);

void  TessBaseAPIPrintVariables(      const(TessBaseAPI)* handle, FILE* fp);
BOOL  TessBaseAPIPrintVariablesToFile(const(TessBaseAPI)* handle, const(char)* filename);
/+#ifdef TESS_CAPI_INCLUDE_BASEAPI
BOOL  TessBaseAPIGetVariableAsString(TessBaseAPI* handle, const(char)* name, STRING* val);
#endif+/

/+#ifdef TESS_CAPI_INCLUDE_BASEAPI
int   TessBaseAPIInit(TessBaseAPI* handle, const(char)* datapath, const(char)* language,
                                         TessOcrEngineMode mode, char** configs, int configs_size,
                                         const(STRING)* vars_vec, size_t vars_vec_size,
                                         const(STRING)* vars_values, size_t vars_values_size, BOOL set_only_init_params);
#endif+/
int   TessBaseAPIInit1(TessBaseAPI* handle, const(char)* datapath, const(char)* language, TessOcrEngineMode oem,
                                          char** configs, int configs_size);
int   TessBaseAPIInit2(TessBaseAPI* handle, const(char)* datapath, const(char)* language, TessOcrEngineMode oem);
int   TessBaseAPIInit3(TessBaseAPI* handle, const(char)* datapath, const(char)* language);

const(char)* TessBaseAPIGetInitLanguagesAsString(const(TessBaseAPI)* handle);
char**      TessBaseAPIGetLoadedLanguagesAsVector(const(TessBaseAPI)* handle);
char**      TessBaseAPIGetAvailableLanguagesAsVector(const(TessBaseAPI)* handle);

int   TessBaseAPIInitLangMod(TessBaseAPI* handle, const(char)* datapath, const(char)* language);
void  TessBaseAPIInitForAnalysePage(TessBaseAPI* handle);

void  TessBaseAPIReadConfigFile(TessBaseAPI* handle, const(char)* filename);
void  TessBaseAPIReadDebugConfigFile(TessBaseAPI* handle, const(char)* filename);

void  TessBaseAPISetPageSegMode(TessBaseAPI* handle, TessPageSegMode mode);
TessPageSegMode TessBaseAPIGetPageSegMode(const(TessBaseAPI)* handle);

char* TessBaseAPIRect(TessBaseAPI* handle, const(ubyte)* imagedata,
                                         int bytes_per_pixel, int bytes_per_line,
                                         int left, int top, int width, int height);

void  TessBaseAPIClearAdaptiveClassifier(TessBaseAPI* handle);

void  TessBaseAPISetImage(TessBaseAPI* handle, const(ubyte)* imagedata, int width, int height,
                                             int bytes_per_pixel, int bytes_per_line);
void  TessBaseAPISetImage2(TessBaseAPI* handle, const(Pix)* pix);

void TessBaseAPISetSourceResolution(TessBaseAPI* handle, int ppi);

void  TessBaseAPISetRectangle(TessBaseAPI* handle, int left, int top, int width, int height);

/+#ifdef TESS_CAPI_INCLUDE_BASEAPI
void  TessBaseAPISetThresholder(TessBaseAPI* handle, TessImageThresholder* thresholder);
#endif+/

Pix*  TessBaseAPIGetThresholdedImage(   TessBaseAPI* handle);
Boxa* TessBaseAPIGetRegions(            TessBaseAPI* handle, Pixa** pixa);
Boxa* TessBaseAPIGetTextlines(          TessBaseAPI* handle, Pixa** pixa, int** blockids);
Boxa* TessBaseAPIGetStrips(             TessBaseAPI* handle, Pixa** pixa, int** blockids);
Boxa* TessBaseAPIGetWords(              TessBaseAPI* handle, Pixa** pixa);
Boxa* TessBaseAPIGetConnectedComponents(TessBaseAPI* handle, Pixa** cc);
Boxa* TessBaseAPIGetComponentImages(    TessBaseAPI* handle, TessPageIteratorLevel level, BOOL text_only, Pixa** pixa, int** blockids);

int   TessBaseAPIGetThresholdedImageScaleFactor(const(TessBaseAPI)* handle);

void  TessBaseAPIDumpPGM(TessBaseAPI* handle, const(char)* filename);

TessPageIterator* TessBaseAPIAnalyseLayout(TessBaseAPI* handle);

int   TessBaseAPIRecognize(TessBaseAPI* handle, ETEXT_DESC* monitor);
int   TessBaseAPIRecognizeForChopTest(TessBaseAPI* handle, ETEXT_DESC* monitor);
char* TessBaseAPIProcessPages(TessBaseAPI* handle, const(char)* filename, const(char)* retry_config,
                                                 int timeout_millisec);
char* TessBaseAPIProcessPage(TessBaseAPI* handle, Pix* pix, int page_index, const(char)* filename,
                                                const(char)* retry_config, int timeout_millisec);

TessResultIterator*
               TessBaseAPIGetIterator(TessBaseAPI* handle);
TessMutableIterator*
               TessBaseAPIGetMutableIterator(TessBaseAPI* handle);

char* TessBaseAPIGetUTF8Text(TessBaseAPI* handle);
char* TessBaseAPIGetHOCRText(TessBaseAPI* handle, int page_number);
char* TessBaseAPIGetBoxText(TessBaseAPI* handle, int page_number);
char* TessBaseAPIGetUNLVText(TessBaseAPI* handle);
int   TessBaseAPIMeanTextConf(TessBaseAPI* handle);
int*  TessBaseAPIAllWordConfidences(TessBaseAPI* handle);
BOOL  TessBaseAPIAdaptToWordStr(TessBaseAPI* handle, TessPageSegMode mode, const(char)* wordstr);

void  TessBaseAPIClear(TessBaseAPI* handle);
void  TessBaseAPIEnd(TessBaseAPI* handle);

int   TessBaseAPIIsValidWord(TessBaseAPI* handle, const char *word);
BOOL  TessBaseAPIGetTextDirection(TessBaseAPI* handle, int* out_offset, float* out_slope);

/+#ifdef TESS_CAPI_INCLUDE_BASEAPI
void  TessBaseAPISetDictFunc(TessBaseAPI* handle, TessDictFunc f);
void  TessBaseAPISetProbabilityInContextFunc(TessBaseAPI* handle, TessProbabilityInContextFunc f);
void  TessBaseAPISetFillLatticeFunc(TessBaseAPI* handle, TessFillLatticeFunc f);
BOOL  TessBaseAPIDetectOS(TessBaseAPI* handle, OSResults* results);

void  TessBaseAPIGetFeaturesForBlob(TessBaseAPI* handle, TBLOB* blob, const(DENORM)* denorm, INT_FEATURE_ARRAY int_features,
                                                       int* num_features, int* FeatureOutlineIndex);

ROW*  TessFindRowForBox(BLOCK_LIST* blocks, int left, int top, int right, int bottom);
void  TessBaseAPIRunAdaptiveClassifier(TessBaseAPI* handle, TBLOB* blob, const(DENORM)* denorm, int num_max_matches,
                                                          int* unichar_ids, float* ratings, int* num_matches_returned);
#endif+/

const(char)*
               TessBaseAPIGetUnichar(TessBaseAPI* handle, int unichar_id);

/+#ifdef TESS_CAPI_INCLUDE_BASEAPI
const(TessDawg)*
               TessBaseAPIGetDawg(const(TessBaseAPI)* handle, int i);
int   TessBaseAPINumDawgs(const(TessBaseAPI)* handle);
#endif

#ifdef TESS_CAPI_INCLUDE_BASEAPI
ROW*  TessMakeTessOCRRow(float baseline, float xheight, float descender, float ascender);
TBLOB*
               TessMakeTBLOB(Pix *pix);
void  TessNormalizeTBLOB(TBLOB *tblob, ROW *row, BOOL numeric_mode, DENORM *denorm);

TessOcrEngineMode
               TessBaseAPIOem(const(TessBaseAPI)* handle);
void  TessBaseAPIInitTruthCallback(TessBaseAPI* handle, TessTruthCallback *cb);

TessCubeRecoContext*
               TessBaseAPIGetCubeRecoContext(const(TessBaseAPI)* handle);
#endif+/

void  TessBaseAPISetMinOrientationMargin(TessBaseAPI* handle, double margin);
/+#ifdef TESS_CAPI_INCLUDE_BASEAPI
void  TessBaseGetBlockTextOrientations(TessBaseAPI* handle, int** block_orientation, bool** vertical_writing);

BLOCK_LIST*
               TessBaseAPIFindLinesCreateBlockList(TessBaseAPI* handle);
#endif+/

/* Page iterator */

void  TessPageIteratorDelete(TessPageIterator* handle);
TessPageIterator* TessPageIteratorCopy(const(TessPageIterator)* handle);

void  TessPageIteratorBegin(TessPageIterator* handle);
BOOL  TessPageIteratorNext(TessPageIterator* handle, TessPageIteratorLevel level);
BOOL  TessPageIteratorIsAtBeginningOf(const(TessPageIterator)* handle, TessPageIteratorLevel level);
BOOL  TessPageIteratorIsAtFinalElement(const(TessPageIterator)* handle, TessPageIteratorLevel level,
                                                          TessPageIteratorLevel element);

BOOL  TessPageIteratorBoundingBox(const(TessPageIterator)* handle, TessPageIteratorLevel level,
                                                     int* left, int* top, int* right, int* bottom);
TessPolyBlockType TessPageIteratorBlockType(const(TessPageIterator)* handle);

Pix*  TessPageIteratorGetBinaryImage(const(TessPageIterator)* handle, TessPageIteratorLevel level);
Pix*  TessPageIteratorGetImage(const(TessPageIterator)* handle, TessPageIteratorLevel level, int padding,
                                                  int* left, int* top);

BOOL  TessPageIteratorBaseline(const(TessPageIterator)* handle, TessPageIteratorLevel level,
                                                  int* x1, int* y1, int* x2, int* y2);

void  TessPageIteratorOrientation(TessPageIterator* handle, TessOrientation *orientation,
                                                     TessWritingDirection *writing_direction, TessTextlineOrder *textline_order,
                                                     float *deskew_angle);

/* Result iterator */

void  TessResultIteratorDelete(TessResultIterator* handle);
TessResultIterator* TessResultIteratorCopy(const(TessResultIterator)* handle);
TessPageIterator*   TessResultIteratorGetPageIterator(TessResultIterator* handle);
const(TessPageIterator)*  TessResultIteratorGetPageIteratorConst(const(TessResultIterator)* handle);

char* TessResultIteratorGetUTF8Text(const(TessResultIterator)* handle, TessPageIteratorLevel level);
float TessResultIteratorConfidence(const(TessResultIterator)* handle, TessPageIteratorLevel level);

const(char)* TessResultIteratorWordFontAttributes(const(TessResultIterator)* handle, BOOL* is_bold, BOOL* is_italic,
                                                              BOOL* is_underlined, BOOL* is_monospace, BOOL* is_serif,
                                                              BOOL* is_smallcaps, int* pointsize, int* font_id);

BOOL  TessResultIteratorWordIsFromDictionary(const(TessResultIterator)* handle);
BOOL  TessResultIteratorWordIsNumeric(const(TessResultIterator)* handle);
BOOL  TessResultIteratorSymbolIsSuperscript(const(TessResultIterator)* handle);
BOOL  TessResultIteratorSymbolIsSubscript(const(TessResultIterator)* handle);
BOOL  TessResultIteratorSymbolIsDropcap(const(TessResultIterator)* handle);
