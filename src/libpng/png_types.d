/// This might become a generated file at some point, so it gets its own file.
module libpng.png_types;

import core.sys.posix.stdio; // For FILE* and related funcs.

/* pngconf.h - machine configurable file for libpng
 *
 * libpng version 1.5.13 - September 27, 2012
 *
 * Copyright (c) 1998-2012 Glenn Randers-Pehrson
 * (Version 0.96 Copyright (c) 1996, 1997 Andreas Dilger)
 * (Version 0.88 Copyright (c) 1995, 1996 Guy Eric Schalnat, Group 42, Inc.)
 *
 * This code is released under the libpng license.
 * For conditions of distribution and use, see the disclaimer
 * and license in png.h
 *
 */

/* Some typedefs to get us started.  These should be safe on most of the
 * common platforms.  The typedefs should be at least as large as the
 * numbers suggest (a png_uint_32 must be at least 32 bits long), but they
 * don't have to be exactly that size.  Some compilers dislike passing
 * unsigned shorts as function parameters, so you may be better off using
 * unsigned int for png_uint_16.
 */

alias uint png_uint_32;
alias int  png_int_32;

alias ushort png_uint_16;
alias short  png_int_16;
alias ubyte  png_byte;

alias size_t png_size_t;

// #define png_sizeof(x) (sizeof (x))

/* Typedef for floating-point numbers that are converted
 * to fixed-point with a multiple of 100,000, e.g., gamma
 */
alias png_int_32 png_fixed_point;

/* Add typedefs for pointers */
alias void                   * png_voidp;
alias const void             * png_const_voidp;
alias png_byte               * png_bytep;
alias const png_byte         * png_const_bytep;
alias png_uint_32            * png_uint_32p;
alias const png_uint_32      * png_const_uint_32p;
alias png_int_32             * png_int_32p;
alias const png_int_32       * png_const_int_32p;
alias png_uint_16            * png_uint_16p;
alias const png_uint_16      * png_const_uint_16p;
alias png_int_16             * png_int_16p;
alias const png_int_16       * png_const_int_16p;
alias char                   * png_charp;
alias const char             * png_const_charp;
alias png_fixed_point        * png_fixed_point_p;
alias const png_fixed_point  * png_const_fixed_point_p;
alias png_size_t             * png_size_tp;
alias const png_size_t       * png_const_size_tp;

// #ifdef PNG_STDIO_SUPPORTED
alias FILE            * png_FILE_p;
// #endif

// #ifdef PNG_FLOATING_POINT_SUPPORTED
alias double            * png_doublep;
alias const double  * png_const_doublep;
// #endif

/* Pointers to pointers; i.e. arrays */
alias png_byte         *  * png_bytepp;
alias png_uint_32      *  * png_uint_32pp;
alias png_int_32       *  * png_int_32pp;
alias png_uint_16      *  * png_uint_16pp;
alias png_int_16       *  * png_int_16pp;
alias const char   *  * png_const_charpp;
alias char             *  * png_charpp;
alias png_fixed_point  *  * png_fixed_point_pp;
// #ifdef PNG_FLOATING_POINT_SUPPORTED
alias double           *  * png_doublepp;
// #endif

/* Pointers to pointers to pointers; i.e., pointer to array */
alias char             *  *  * png_charppp;

/* png_alloc_size_t is guaranteed to be no smaller than png_size_t,
 * and no smaller than png_uint_32.  Casts from png_size_t or png_uint_32
 * to png_alloc_size_t are not necessary; in fact, it is recommended
 * not to use them at all so that the compiler can complain when something
 * turns out to be problematic.
 * Casts in the other direction (from png_alloc_size_t to png_size_t or
 * png_uint_32) should be explicitly applied; however, we do not expect
 * to encounter practical situations that require such conversions.
 */
static if ( size_t.sizeof < 4 ) // Almost impossible given that it's forbidden by D spec, but why not.
    alias uint png_alloc_size_t;
else
    alias size_t png_alloc_size_t;
 /+
#if defined(__TURBOC__) && !defined(__FLAT__)
   alias unsigned long png_alloc_size_t;
#else
#  if defined(_MSC_VER) && defined(MAXSEG_64K)
     alias unsigned long    png_alloc_size_t;
#  else
     /* This is an attempt to detect an old Windows system where (int) is
      * actually 16 bits, in that case png_malloc must have an argument with a
      * bigger size to accomodate the requirements of the library.
      */
#    if (defined(_Windows) || defined(_WINDOWS) || defined(_WINDOWS_)) && \
        (!defined(INT_MAX) || INT_MAX <= 0x7ffffffeL)
       alias DWORD         png_alloc_size_t;
#    else
       alias png_size_t    png_alloc_size_t;
#    endif
#  endif
#endif
+/

// #endif /* PNGCONF_H */


/* png.h - header file for PNG reference library
 *
 * libpng version 1.5.13 - September 27, 2012
 * Copyright (c) 1998-2012 Glenn Randers-Pehrson
 * (Version 0.96 Copyright (c) 1996, 1997 Andreas Dilger)
 * (Version 0.88 Copyright (c) 1995, 1996 Guy Eric Schalnat, Group 42, Inc.)
 *
 * This code is released under the libpng license (See LICENSE, below)
 *
 * Authors and maintainers:
 *   libpng versions 0.71, May 1995, through 0.88, January 1996: Guy Schalnat
 *   libpng versions 0.89c, June 1996, through 0.96, May 1997: Andreas Dilger
 *   libpng versions 0.97, January 1998, through 1.5.13 - September 27, 2012: Glenn
 *   See also "Contributing Authors", below.
 *
 * Note about libpng version numbers:
 *
 *   Due to various miscommunications, unforeseen code incompatibilities
 *   and occasional factors outside the authors' control, version numbering
 *   on the library has not always been consistent and straightforward.
 *   The following table summarizes matters since version 0.89c, which was
 *   the first widely used release:
 *
 *    source                 png.h  png.h  shared-lib
 *    version                string   int  version
 *    -------                ------ -----  ----------
 *    0.89c "1.0 beta 3"     0.89      89  1.0.89
 *    0.90  "1.0 beta 4"     0.90      90  0.90  [should have been 2.0.90]
 *    0.95  "1.0 beta 5"     0.95      95  0.95  [should have been 2.0.95]
 *    0.96  "1.0 beta 6"     0.96      96  0.96  [should have been 2.0.96]
 *    0.97b "1.00.97 beta 7" 1.00.97   97  1.0.1 [should have been 2.0.97]
 *    0.97c                  0.97      97  2.0.97
 *    0.98                   0.98      98  2.0.98
 *    0.99                   0.99      98  2.0.99
 *    0.99a-m                0.99      99  2.0.99
 *    1.00                   1.00     100  2.1.0 [100 should be 10000]
 *    1.0.0      (from here on, the   100  2.1.0 [100 should be 10000]
 *    1.0.1       png.h string is   10001  2.1.0
 *    1.0.1a-e    identical to the  10002  from here on, the shared library
 *    1.0.2       source version)   10002  is 2.V where V is the source code
 *    1.0.2a-b                      10003  version, except as noted.
 *    1.0.3                         10003
 *    1.0.3a-d                      10004
 *    1.0.4                         10004
 *    1.0.4a-f                      10005
 *    1.0.5 (+ 2 patches)           10005
 *    1.0.5a-d                      10006
 *    1.0.5e-r                      10100 (not source compatible)
 *    1.0.5s-v                      10006 (not binary compatible)
 *    1.0.6 (+ 3 patches)           10006 (still binary incompatible)
 *    1.0.6d-f                      10007 (still binary incompatible)
 *    1.0.6g                        10007
 *    1.0.6h                        10007  10.6h (testing xy.z so-numbering)
 *    1.0.6i                        10007  10.6i
 *    1.0.6j                        10007  2.1.0.6j (incompatible with 1.0.0)
 *    1.0.7beta11-14        DLLNUM  10007  2.1.0.7beta11-14 (binary compatible)
 *    1.0.7beta15-18           1    10007  2.1.0.7beta15-18 (binary compatible)
 *    1.0.7rc1-2               1    10007  2.1.0.7rc1-2 (binary compatible)
 *    1.0.7                    1    10007  (still compatible)
 *    1.0.8beta1-4             1    10008  2.1.0.8beta1-4
 *    1.0.8rc1                 1    10008  2.1.0.8rc1
 *    1.0.8                    1    10008  2.1.0.8
 *    1.0.9beta1-6             1    10009  2.1.0.9beta1-6
 *    1.0.9rc1                 1    10009  2.1.0.9rc1
 *    1.0.9beta7-10            1    10009  2.1.0.9beta7-10
 *    1.0.9rc2                 1    10009  2.1.0.9rc2
 *    1.0.9                    1    10009  2.1.0.9
 *    1.0.10beta1              1    10010  2.1.0.10beta1
 *    1.0.10rc1                1    10010  2.1.0.10rc1
 *    1.0.10                   1    10010  2.1.0.10
 *    1.0.11beta1-3            1    10011  2.1.0.11beta1-3
 *    1.0.11rc1                1    10011  2.1.0.11rc1
 *    1.0.11                   1    10011  2.1.0.11
 *    1.0.12beta1-2            2    10012  2.1.0.12beta1-2
 *    1.0.12rc1                2    10012  2.1.0.12rc1
 *    1.0.12                   2    10012  2.1.0.12
 *    1.1.0a-f                 -    10100  2.1.1.0a-f (branch abandoned)
 *    1.2.0beta1-2             2    10200  2.1.2.0beta1-2
 *    1.2.0beta3-5             3    10200  3.1.2.0beta3-5
 *    1.2.0rc1                 3    10200  3.1.2.0rc1
 *    1.2.0                    3    10200  3.1.2.0
 *    1.2.1beta1-4             3    10201  3.1.2.1beta1-4
 *    1.2.1rc1-2               3    10201  3.1.2.1rc1-2
 *    1.2.1                    3    10201  3.1.2.1
 *    1.2.2beta1-6            12    10202  12.so.0.1.2.2beta1-6
 *    1.0.13beta1             10    10013  10.so.0.1.0.13beta1
 *    1.0.13rc1               10    10013  10.so.0.1.0.13rc1
 *    1.2.2rc1                12    10202  12.so.0.1.2.2rc1
 *    1.0.13                  10    10013  10.so.0.1.0.13
 *    1.2.2                   12    10202  12.so.0.1.2.2
 *    1.2.3rc1-6              12    10203  12.so.0.1.2.3rc1-6
 *    1.2.3                   12    10203  12.so.0.1.2.3
 *    1.2.4beta1-3            13    10204  12.so.0.1.2.4beta1-3
 *    1.0.14rc1               13    10014  10.so.0.1.0.14rc1
 *    1.2.4rc1                13    10204  12.so.0.1.2.4rc1
 *    1.0.14                  10    10014  10.so.0.1.0.14
 *    1.2.4                   13    10204  12.so.0.1.2.4
 *    1.2.5beta1-2            13    10205  12.so.0.1.2.5beta1-2
 *    1.0.15rc1-3             10    10015  10.so.0.1.0.15rc1-3
 *    1.2.5rc1-3              13    10205  12.so.0.1.2.5rc1-3
 *    1.0.15                  10    10015  10.so.0.1.0.15
 *    1.2.5                   13    10205  12.so.0.1.2.5
 *    1.2.6beta1-4            13    10206  12.so.0.1.2.6beta1-4
 *    1.0.16                  10    10016  10.so.0.1.0.16
 *    1.2.6                   13    10206  12.so.0.1.2.6
 *    1.2.7beta1-2            13    10207  12.so.0.1.2.7beta1-2
 *    1.0.17rc1               10    10017  12.so.0.1.0.17rc1
 *    1.2.7rc1                13    10207  12.so.0.1.2.7rc1
 *    1.0.17                  10    10017  12.so.0.1.0.17
 *    1.2.7                   13    10207  12.so.0.1.2.7
 *    1.2.8beta1-5            13    10208  12.so.0.1.2.8beta1-5
 *    1.0.18rc1-5             10    10018  12.so.0.1.0.18rc1-5
 *    1.2.8rc1-5              13    10208  12.so.0.1.2.8rc1-5
 *    1.0.18                  10    10018  12.so.0.1.0.18
 *    1.2.8                   13    10208  12.so.0.1.2.8
 *    1.2.9beta1-3            13    10209  12.so.0.1.2.9beta1-3
 *    1.2.9beta4-11           13    10209  12.so.0.9[.0]
 *    1.2.9rc1                13    10209  12.so.0.9[.0]
 *    1.2.9                   13    10209  12.so.0.9[.0]
 *    1.2.10beta1-7           13    10210  12.so.0.10[.0]
 *    1.2.10rc1-2             13    10210  12.so.0.10[.0]
 *    1.2.10                  13    10210  12.so.0.10[.0]
 *    1.4.0beta1-5            14    10400  14.so.0.0[.0]
 *    1.2.11beta1-4           13    10211  12.so.0.11[.0]
 *    1.4.0beta7-8            14    10400  14.so.0.0[.0]
 *    1.2.11                  13    10211  12.so.0.11[.0]
 *    1.2.12                  13    10212  12.so.0.12[.0]
 *    1.4.0beta9-14           14    10400  14.so.0.0[.0]
 *    1.2.13                  13    10213  12.so.0.13[.0]
 *    1.4.0beta15-36          14    10400  14.so.0.0[.0]
 *    1.4.0beta37-87          14    10400  14.so.14.0[.0]
 *    1.4.0rc01               14    10400  14.so.14.0[.0]
 *    1.4.0beta88-109         14    10400  14.so.14.0[.0]
 *    1.4.0rc02-08            14    10400  14.so.14.0[.0]
 *    1.4.0                   14    10400  14.so.14.0[.0]
 *    1.4.1beta01-03          14    10401  14.so.14.1[.0]
 *    1.4.1rc01               14    10401  14.so.14.1[.0]
 *    1.4.1beta04-12          14    10401  14.so.14.1[.0]
 *    1.4.1                   14    10401  14.so.14.1[.0]
 *    1.4.2                   14    10402  14.so.14.2[.0]
 *    1.4.3                   14    10403  14.so.14.3[.0]
 *    1.4.4                   14    10404  14.so.14.4[.0]
 *    1.5.0beta01-58          15    10500  15.so.15.0[.0]
 *    1.5.0rc01-07            15    10500  15.so.15.0[.0]
 *    1.5.0                   15    10500  15.so.15.0[.0]
 *    1.5.1beta01-11          15    10501  15.so.15.1[.0]
 *    1.5.1rc01-02            15    10501  15.so.15.1[.0]
 *    1.5.1                   15    10501  15.so.15.1[.0]
 *    1.5.2beta01-03          15    10502  15.so.15.2[.0]
 *    1.5.2rc01-03            15    10502  15.so.15.2[.0]
 *    1.5.2                   15    10502  15.so.15.2[.0]
 *    1.5.3beta01-10          15    10503  15.so.15.3[.0]
 *    1.5.3rc01-02            15    10503  15.so.15.3[.0]
 *    1.5.3beta11             15    10503  15.so.15.3[.0]
 *    1.5.3 [omitted]
 *    1.5.4beta01-08          15    10504  15.so.15.4[.0]
 *    1.5.4rc01               15    10504  15.so.15.4[.0]
 *    1.5.4                   15    10504  15.so.15.4[.0]
 *    1.5.5beta01-08          15    10505  15.so.15.5[.0]
 *    1.5.5rc01               15    10505  15.so.15.5[.0]
 *    1.5.5                   15    10505  15.so.15.5[.0]
 *    1.5.6beta01-07          15    10506  15.so.15.6[.0]
 *    1.5.6rc01-03            15    10506  15.so.15.6[.0]
 *    1.5.6                   15    10506  15.so.15.6[.0]
 *    1.5.7beta01-05          15    10507  15.so.15.7[.0]
 *    1.5.7rc01-03            15    10507  15.so.15.7[.0]
 *    1.5.7                   15    10507  15.so.15.7[.0]
 *    1.5.8beta01             15    10508  15.so.15.8[.0]
 *    1.5.8rc01               15    10508  15.so.15.8[.0]
 *    1.5.8                   15    10508  15.so.15.8[.0]
 *    1.5.9beta01-02          15    10509  15.so.15.9[.0]
 *    1.5.9rc01               15    10509  15.so.15.9[.0]
 *    1.5.9                   15    10509  15.so.15.9[.0]
 *    1.5.10beta01-05         15    10510  15.so.15.10[.0]
 *    1.5.10                  15    10510  15.so.15.10[.0]
 *    1.5.11beta01            15    10511  15.so.15.11[.0]
 *    1.5.11rc01-05           15    10511  15.so.15.11[.0]
 *    1.5.11                  15    10511  15.so.15.11[.0]
 *    1.5.12                  15    10512  15.so.15.12[.0]
 *    1.5.13beta01-02         15    10513  15.so.15.13[.0]
 *    1.5.13rc01              15    10513  15.so.15.13[.0]
 *    1.5.13                  15    10513  15.so.15.13[.0]
 *
 *   Henceforth the source version will match the shared-library major
 *   and minor numbers; the shared-library major version number will be
 *   used for changes in backward compatibility, as it is intended.  The
 *   PNG_LIBPNG_VER macro, which is not used within libpng but is available
 *   for applications, is an unsigned integer of the form xyyzz corresponding
 *   to the source version x.y.z (leading zeros in y and z).  Beta versions
 *   were given the previous public release number plus a letter, until
 *   version 1.0.6j; from then on they were given the upcoming public
 *   release number plus "betaNN" or "rcNN".
 *
 *   Binary incompatibility exists only when applications make direct access
 *   to the info_ptr or png_ptr members through png.h, and the compiled
 *   application is loaded with a different version of the library.
 *
 *   DLLNUM will change each time there are forward or backward changes
 *   in binary compatibility (e.g., when a new feature is added).
 *
 * See libpng-manual.txt or libpng.3 for more information.  The PNG
 * specification is available as a W3C Recommendation and as an ISO
 * Specification, <http://www.w3.org/TR/2003/REC-PNG-20031110/
 */

/*
 * COPYRIGHT NOTICE, DISCLAIMER, and LICENSE:
 *
 * If you modify libpng you may insert additional notices immediately following
 * this sentence.
 *
 * This code is released under the libpng license.
 *
 * libpng versions 1.2.6, August 15, 2004, through 1.5.13, September 27, 2012, are
 * Copyright (c) 2004, 2006-2012 Glenn Randers-Pehrson, and are
 * distributed according to the same disclaimer and license as libpng-1.2.5
 * with the following individual added to the list of Contributing Authors:
 *
 *    Cosmin Truta
 *
 * libpng versions 1.0.7, July 1, 2000, through 1.2.5, October 3, 2002, are
 * Copyright (c) 2000-2002 Glenn Randers-Pehrson, and are
 * distributed according to the same disclaimer and license as libpng-1.0.6
 * with the following individuals added to the list of Contributing Authors:
 *
 *    Simon-Pierre Cadieux
 *    Eric S. Raymond
 *    Gilles Vollant
 *
 * and with the following additions to the disclaimer:
 *
 *    There is no warranty against interference with your enjoyment of the
 *    library or against infringement.  There is no warranty that our
 *    efforts or the library will fulfill any of your particular purposes
 *    or needs.  This library is provided with all faults, and the entire
 *    risk of satisfactory quality, performance, accuracy, and effort is with
 *    the user.
 *
 * libpng versions 0.97, January 1998, through 1.0.6, March 20, 2000, are
 * Copyright (c) 1998, 1999, 2000 Glenn Randers-Pehrson, and are
 * distributed according to the same disclaimer and license as libpng-0.96,
 * with the following individuals added to the list of Contributing Authors:
 *
 *    Tom Lane
 *    Glenn Randers-Pehrson
 *    Willem van Schaik
 *
 * libpng versions 0.89, June 1996, through 0.96, May 1997, are
 * Copyright (c) 1996, 1997 Andreas Dilger
 * Distributed according to the same disclaimer and license as libpng-0.88,
 * with the following individuals added to the list of Contributing Authors:
 *
 *    John Bowler
 *    Kevin Bracey
 *    Sam Bushell
 *    Magnus Holmgren
 *    Greg Roelofs
 *    Tom Tanner
 *
 * libpng versions 0.5, May 1995, through 0.88, January 1996, are
 * Copyright (c) 1995, 1996 Guy Eric Schalnat, Group 42, Inc.
 *
 * For the purposes of this copyright and license, "Contributing Authors"
 * is defined as the following set of individuals:
 *
 *    Andreas Dilger
 *    Dave Martindale
 *    Guy Eric Schalnat
 *    Paul Schmidt
 *    Tim Wegner
 *
 * The PNG Reference Library is supplied "AS IS".  The Contributing Authors
 * and Group 42, Inc. disclaim all warranties, expressed or implied,
 * including, without limitation, the warranties of merchantability and of
 * fitness for any purpose.  The Contributing Authors and Group 42, Inc.
 * assume no liability for direct, indirect, incidental, special, exemplary,
 * or consequential damages, which may result from the use of the PNG
 * Reference Library, even if advised of the possibility of such damage.
 *
 * Permission is hereby granted to use, copy, modify, and distribute this
 * source code, or portions hereof, for any purpose, without fee, subject
 * to the following restrictions:
 *
 *   1. The origin of this source code must not be misrepresented.
 *
 *   2. Altered versions must be plainly marked as such and must not
 *      be misrepresented as being the original source.
 *
 *   3. This Copyright notice may not be removed or altered from
 *      any source or altered source distribution.
 *
 * The Contributing Authors and Group 42, Inc. specifically permit, without
 * fee, and encourage the use of this source code as a component to
 * supporting the PNG file format in commercial products.  If you use this
 * source code in a product, acknowledgment is not required but would be
 * appreciated.
 */

/*
 * A "png_get_copyright" function is available, for convenient use in "about"
 * boxes and the like:
 *
 *     printf("%s", png_get_copyright(NULL));
 *
 * Also, the PNG logo (in PNG format, of course) is supplied in the
 * files "pngbar.png" and "pngbar.jpg (88x31) and "pngnow.png" (98x31).
 */

/*
 * Libpng is OSI Certified Open Source Software.  OSI Certified is a
 * certification mark of the Open Source Initiative.
 */

/*
 * The contributing authors would like to thank all those who helped
 * with testing, bug fixes, and patience.  This wouldn't have been
 * possible without all of you.
 *
 * Thanks to Frank J. T. Wojcik for helping with the documentation.
 */

/* Three color definitions.  The order of the red, green, and blue, (and the
 * exact size) is not important, although the size of the fields need to
 * be png_byte or png_uint_16 (as defined below).
 */

alias png_color_struct png_color;
struct png_color_struct
{
   png_byte red;
   png_byte green;
   png_byte blue;
}

alias png_color  * png_colorp;
alias const png_color  * png_const_colorp;
alias png_color  *  * png_colorpp;

alias png_color_16_struct png_color_16;
struct png_color_16_struct
{
   png_byte index;    /* used for palette files */
   png_uint_16 red;   /* for use in red green blue files */
   png_uint_16 green;
   png_uint_16 blue;
   png_uint_16 gray;  /* for use in grayscale files */
}

alias png_color_16  * png_color_16p;
alias const png_color_16  * png_const_color_16p;
alias png_color_16  *  * png_color_16pp;

alias png_color_8_struct png_color_8;
struct png_color_8_struct
{
   png_byte red;   /* for use in red green blue files */
   png_byte green;
   png_byte blue;
   png_byte gray;  /* for use in grayscale files */
   png_byte alpha; /* for alpha channel files */
}

alias png_color_8  * png_color_8p;
alias const png_color_8  * png_const_color_8p;
alias png_color_8  *  * png_color_8pp;


/*
 * The following two structures are used for the in-core representation
 * of sPLT chunks.
 */
alias png_sPLT_entry_struct png_sPLT_entry;
struct png_sPLT_entry_struct
{
   png_uint_16 red;
   png_uint_16 green;
   png_uint_16 blue;
   png_uint_16 alpha;
   png_uint_16 frequency;
}

alias png_sPLT_entry  * png_sPLT_entryp;
alias const png_sPLT_entry  * png_const_sPLT_entryp;
alias png_sPLT_entry  *  * png_sPLT_entrypp;

/*  When the depth of the sPLT palette is 8 bits, the color and alpha samples
 *  occupy the LSB of their respective members, and the MSB of each member
 *  is zero-filled.  The frequency member always occupies the full 16 bits.
 */

alias png_sPLT_struct png_sPLT_t;
struct png_sPLT_struct
{
   png_charp name;           /* palette name */
   png_byte depth;           /* depth of palette samples */
   png_sPLT_entryp entries;  /* palette entries */
   png_int_32 nentries;      /* number of palette entries */
}

alias png_sPLT_t  * png_sPLT_tp;
alias const png_sPLT_t  * png_const_sPLT_tp;
alias png_sPLT_t  *  * png_sPLT_tpp;

// #ifdef PNG_TEXT_SUPPORTED
/* png_text holds the contents of a text/ztxt/itxt chunk in a PNG file,
 * and whether that contents is compressed or not.  The "key" field
 * points to a regular zero-terminated C string.  The "text" fields can be a
 * regular C string, an empty string, or a NULL pointer.
 * However, the structure returned by png_get_text() will always contain
 * the "text" field as a regular zero-terminated C string (possibly
 * empty), never a NULL pointer, so it can be safely used in printf() and
 * other string-handling functions.  Note that the "itxt_length", "lang", and
 * "lang_key" members of the structure only exist when the library is built
 * with iTXt chunk support.  Prior to libpng-1.4.0 the library was built by
 * default without iTXt support. Also note that when iTXt *is* supported,
 * the "lang" and "lang_key" fields contain NULL pointers when the
 * "compression" field contains * PNG_TEXT_COMPRESSION_NONE or
 * PNG_TEXT_COMPRESSION_zTXt. Note that the "compression value" is not the
 * same as what appears in the PNG tEXt/zTXt/iTXt chunk's "compression flag"
 * which is always 0 or 1, or its "compression method" which is always 0.
 */
alias png_text_struct png_text;
struct png_text_struct
{
   int  compression;       /* compression value:
                             -1: tEXt, none
                              0: zTXt, deflate
                              1: iTXt, none
                              2: iTXt, deflate  */
   png_charp key;          /* keyword, 1-79 character description of "text" */
   png_charp text;         /* comment, may be an empty string (ie "")
                              or a NULL pointer */
   png_size_t text_length; /* length of the text string */
   png_size_t itxt_length; /* length of the itxt string */
   png_charp lang;         /* language code, 0-79 characters
                              or a NULL pointer */
   png_charp lang_key;     /* keyword translated UTF-8 string, 0 or more
                              chars or a NULL pointer */
}

alias png_text  * png_textp;
alias const png_text  * png_const_textp;
alias png_text  *  * png_textpp;
// #endif

/* png_time is a way to hold the time in an machine independent way.
 * Two conversions are provided, both from time_t and struct tm.  There
 * is no portable way to convert to either of these structures, as far
 * as I know.  If you know of a portable way, send it to me.  As a side
 * note - PNG has always been Year 2000 compliant!
 */
alias png_time_struct png_time;
struct png_time_struct
{
   png_uint_16 year; /* full year, as in, 1995 */
   png_byte month;   /* month of year, 1 - 12 */
   png_byte day;     /* day of month, 1 - 31 */
   png_byte hour;    /* hour of day, 0 - 23 */
   png_byte minute;  /* minute of hour, 0 - 59 */
   png_byte second;  /* second of minute, 0 - 60 (for leap seconds) */
}

alias png_time  * png_timep;
alias const png_time  * png_const_timep;
alias png_time  *  * png_timepp;

// #if defined(PNG_UNKNOWN_CHUNKS_SUPPORTED) || \
//     defined(PNG_HANDLE_AS_UNKNOWN_SUPPORTED)
/* png_unknown_chunk is a structure to hold queued chunks for which there is
 * no specific support.  The idea is that we can use this to queue
 * up private chunks for output even though the library doesn't actually
 * know about their semantics.
 */
alias png_unknown_chunk_t png_unknown_chunk;
struct png_unknown_chunk_t
{
    png_byte[5] name;
    png_byte    *data;
    png_size_t  size;

    /* libpng-using applications should NOT directly modify this byte. */
    png_byte location; /* mode of operation at read time */
}

alias png_unknown_chunk  * png_unknown_chunkp;
alias const png_unknown_chunk  * png_const_unknown_chunkp;
alias png_unknown_chunk  *  * png_unknown_chunkpp;
// #endif

/* The complete definition of png_info has, as of libpng-1.5.0,
 * been moved into a separate header file that is not accessible to
 * applications.  Read libpng-manual.txt or libpng.3 for more info.
 */
struct png_info_def;
alias png_info_def png_info;
alias png_info  * png_infop;
alias const png_info  * png_const_infop;
alias png_info  *  * png_infopp;
alias png_info  * png_inforp;
alias const png_info  * png_const_inforp;


/* This is used for the transformation routines, as some of them
 * change these values for the row.  It also should enable using
 * the routines for other purposes.
 */
alias png_row_info_struct png_row_info;
struct png_row_info_struct
{
   png_uint_32 width;    /* width of row */
   png_size_t rowbytes;  /* number of bytes in row */
   png_byte color_type;  /* color type of row */
   png_byte bit_depth;   /* bit depth of row */
   png_byte channels;    /* number of channels (1, 2, 3, or 4) */
   png_byte pixel_depth; /* bits per pixel (depth * channels) */
}

alias png_row_info  * png_row_infop;
alias png_row_info  *  * png_row_infopp;

/*******************************************************************************
 * Section 5: SIMPLIFIED API
 *******************************************************************************
 *
 * Please read the documentation in libpng-manual.txt (TODO: write said
 * documentation) if you don't understand what follows.
 *
 * The simplified API hides the details of both libpng and the PNG file format
 * itself.  It allows PNG files to be read into a very limited number of
 * in-memory bitmap formats or to be written from the same formats.  If these
 * formats do not accommodate your needs then you can, and should, use the more
 * sophisticated APIs above - these support a wide variety of in-memory formats
 * and a wide variety of sophisticated transformations to those formats as well
 * as a wide variety of APIs to manipulate ancillary information.
 *
 * To read a PNG file using the simplified API:
 *
 * 1) Declare a 'png_image' structure (see below) on the stack, set the
 *    version field to PNG_IMAGE_VERSION and the 'opaque' pointer to NULL
 *    (this is REQUIRED, your program may crash if you don't do it.)
 * 2) Call the appropriate png_image_begin_read... function.
 * 3) Set the png_image 'format' member to the required sample format.
 * 4) Allocate a buffer for the image and, if required, the color-map.
 * 5) Call png_image_finish_read to read the image and, if required, the
 *    color-map into your buffers.
 *
 * There are no restrictions on the format of the PNG input itself; all valid
 * color types, bit depths, and interlace methods are acceptable, and the
 * input image is transformed as necessary to the requested in-memory format
 * during the png_image_finish_read() step.  The only caveat is that if you
 * request a color-mapped image from a PNG that is full-color or makes
 * complex use of an alpha channel the transformation is extremely lossy and the
 * result may look terrible.
 *
 * To write a PNG file using the simplified API:
 *
 * 1) Declare a 'png_image' structure on the stack and memset() it to all zero.
 * 2) Initialize the members of the structure that describe the image, setting
 *    the 'format' member to the format of the image samples.
 * 3) Call the appropriate png_image_write... function with a pointer to the
 *    image and, if necessary, the color-map to write the PNG data.
 *
 * png_image is a structure that describes the in-memory format of an image
 * when it is being read or defines the in-memory format of an image that you
 * need to write:
 */
struct png_control {};
alias png_control* png_controlp;

enum PNG_IMAGE_VERSION = 1;

extern(C) struct png_image
{
   png_controlp opaque;    /* Initialize to NULL, free with png_image_free */
   png_uint_32  _version;   /* Set to PNG_IMAGE_VERSION */
   png_uint_32  width;     /* Image width in pixels (columns) */
   png_uint_32  height;    /* Image height in pixels (rows) */
   png_uint_32  format;    /* Image format as defined below */
   png_uint_32  flags;     /* A bit mask containing informational flags */
   png_uint_32  colormap_entries;
                           /* Number of entries in the color-map */

   /* In the event of an error or warning the following field will be set to a
    * non-zero value and the 'message' field will contain a '\0' terminated
    * string with the libpng error or warning message.  If both warnings and
    * an error were encountered, only the error is recorded.  If there
    * are multiple warnings, only the first one is recorded.
    *
    * The upper 30 bits of this value are reserved, the low two bits contain
    * a value as follows:
    */
//#  define PNG_IMAGE_WARNING 1
//#  define PNG_IMAGE_ERROR 2
   /*
    * The result is a two-bit code such that a value more than 1 indicates
    * a failure in the API just called:
    *
    *    0 - no warning or error
    *    1 - warning
    *    2 - error
    *    3 - error preceded by warning
    */
//#  define PNG_IMAGE_FAILED(png_cntrl) ((((png_cntrl).warning_or_error)&0x03)>1)

   png_uint_32  warning_or_error;

   //char         message[64];
   byte[64]     message;
}
alias png_image* png_imagep;

enum PNG_IMAGE_WARNING = 1;
enum PNG_IMAGE_ERROR   = 2;

bool PNG_IMAGE_FAILED(png_imagep png_cntrl) {
   return (png_cntrl.warning_or_error & 0x03) > 1;
}

/* The complete definition of png_struct has, as of libpng-1.5.0,
 * been moved into a separate header file that is not accessible to
 * applications.  Read libpng-manual.txt or libpng.3 for more info.
 */
struct c_png_struct;
alias c_png_struct* c_png_structp;

// png_struct is defined in libpng/types.d

/* These are the function types for the I/O functions and for the functions
 * that allow the user to override the default I/O functions with his or her
 * own.  The png_error_ptr type should match that of user-supplied warning
 * and error functions, while the png_rw_ptr type should match that of the
 * user read/write data functions.  Note that the 'write' function must not
 * modify the buffer it is passed. The 'read' function, on the other hand, is
 * expected to return the read data in the buffer.
 */
alias extern(C) void function(c_png_struct*, png_const_charp) png_error_ptr;
alias extern(C) void function(c_png_struct*, png_bytep, png_size_t) png_rw_ptr;
alias extern(C) void function(c_png_struct*) png_flush_ptr;
alias extern(C) void function(c_png_struct*, png_uint_32, int) png_read_status_ptr;
alias extern(C) void function(c_png_struct*, png_uint_32, int) png_write_status_ptr;

// #ifdef PNG_PROGRESSIVE_READ_SUPPORTED
alias extern(C) void function(c_png_struct*, png_infop) png_progressive_info_ptr;
alias extern(C) void function(c_png_struct*, png_infop) png_progressive_end_ptr;
// #ifdef PNG_APNG_SUPPORTED
alias extern(C) void function(c_png_struct*, png_uint_32) png_progressive_frame_ptr;
// #endif

/* The following callback receives png_uint_32 row_number, int pass for the
 * png_bytep data of the row.  When transforming an interlaced image the
 * row number is the row number within the sub-image of the interlace pass, so
 * the value will increase to the height of the sub-image (not the full image)
 * then reset to 0 for the next pass.
 *
 * Use PNG_ROW_FROM_PASS_ROW(row, pass) and PNG_COL_FROM_PASS_COL(col, pass) to
 * find the output pixel (x,y) given an interlaced sub-image pixel
 * (row,col,pass).  (See below for these macros.)
 */
alias extern(C) void function(c_png_struct*, png_bytep, png_uint_32, int) png_progressive_row_ptr;
// #endif

// #if defined(PNG_READ_USER_TRANSFORM_SUPPORTED) || \
//     defined(PNG_WRITE_USER_TRANSFORM_SUPPORTED)
alias extern(C) void function(c_png_struct*, png_row_infop, png_bytep) png_user_transform_ptr;
// #endif

// #ifdef PNG_USER_CHUNKS_SUPPORTED
alias extern(C) int function(c_png_struct*, png_unknown_chunkp) png_user_chunk_ptr;
// #endif
// #ifdef PNG_UNKNOWN_CHUNKS_SUPPORTED
alias extern(C) void function(c_png_struct*) png_unknown_chunk_ptr;
// #endif

/* NOTE: prior to 1.5 these functions had no 'API' style declaration,
 * this allowed the zlib default functions to be used on Windows
 * platforms.  In 1.5 the zlib default malloc (which just calls malloc and
 * ignores the first argument) should be completely compatible with the
 * following.
 */
alias extern(C) png_voidp function(c_png_struct*, png_alloc_size_t) png_malloc_ptr;
alias extern(C) void  function(c_png_struct*, png_voidp) png_free_ptr;
