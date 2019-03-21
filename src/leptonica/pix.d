module leptonica.pix;

alias uint l_uint32;
alias int l_int32;

alias Pix PIX;
struct Pix
{
    l_uint32             w;           /* width in pixels                   */
    l_uint32             h;           /* height in pixels                  */
    l_uint32             d;           /* depth in bits                     */
    l_uint32             wpl;         /* 32-bit words/line                 */
    l_uint32             refcount;    /* reference count (1 if no clones)  */
    l_int32              xres;        /* image res (ppi) in x direction    */
                                      /* (use 0 if unknown)                */
    l_int32              yres;        /* image res (ppi) in y direction    */
                                      /* (use 0 if unknown)                */
    l_int32              informat;    /* input file format, IFF_*          */
    char                *text;        /* text string associated with pix   */
    PixColormap         *colormap;    /* colormap (may be null)            */
    l_uint32            *data;        /* the image data                    */
}

alias PixColormap PIXCMAP;
struct PixColormap
{
    void            *array;     /* colormap table (array of RGBA_QUAD)     */
    l_int32          depth;     /* of pix (1, 2, 4 or 8 bpp)               */
    l_int32          nalloc;    /* number of color entries allocated       */
    l_int32          n;         /* number of color entries used            */
}

extern(C):
PIX * pixConvert1To32 ( PIX *pixd, PIX *pixs, l_uint32 val0, l_uint32 val1 );
