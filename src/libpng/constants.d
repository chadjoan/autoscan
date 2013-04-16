module libpng.constants;

import libpng.generated.png_nsj; // pnglibconf constants.
import libpng.types;

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

// TODO: At least the version info should either be generated by the binding
//   generator or, possibly better yet, be turned into properties that retrieve
//   the real values from C code that knows what they are.

/* Version information for png.h - this should match the version in png.c */
enum PNG_LIBPNG_VER_STRING = "1.5.13";
enum PNG_HEADER_VERSION_STRING =
     " libpng version 1.5.13 - September 27, 2012\n";

enum PNG_LIBPNG_VER_SONUM   = 15;
enum PNG_LIBPNG_VER_DLLNUM  = 15;

/* These should match the first 3 components of PNG_LIBPNG_VER_STRING: */
enum PNG_LIBPNG_VER_MAJOR   = 1;
enum PNG_LIBPNG_VER_MINOR   = 5;
enum PNG_LIBPNG_VER_RELEASE = 13;

/* This should match the numeric part of the final component of
 * PNG_LIBPNG_VER_STRING, omitting any leading zero:
 */

enum PNG_LIBPNG_VER_BUILD  = 0;

/* Release Status */
enum PNG_LIBPNG_BUILD_ALPHA    = 1;
enum PNG_LIBPNG_BUILD_BETA     = 2;
enum PNG_LIBPNG_BUILD_RC       = 3;
enum PNG_LIBPNG_BUILD_STABLE   = 4;
enum PNG_LIBPNG_BUILD_RELEASE_STATUS_MASK = 7;

/* Release-Specific Flags */
enum PNG_LIBPNG_BUILD_PATCH    = 8; /* Can be OR'ed with
                                       PNG_LIBPNG_BUILD_STABLE only */
enum PNG_LIBPNG_BUILD_PRIVATE = 16; /* Cannot be OR'ed with
                                       PNG_LIBPNG_BUILD_SPECIAL */
enum PNG_LIBPNG_BUILD_SPECIAL = 32; /* Cannot be OR'ed with
                                       PNG_LIBPNG_BUILD_PRIVATE */

enum PNG_LIBPNG_BUILD_BASE_TYPE = PNG_LIBPNG_BUILD_STABLE;

/* Careful here.  At one time, Guy wanted to use 082, but that would be octal.
 * We must not include leading zeros.
 * Versions 0.7 through 1.0.0 were in the range 0 to 100 here (only
 * version 1.0.0 was mis-numbered 100 instead of 10000).  From
 * version 1.0.1 it's    xxyyzz, where x=major, y=minor, z=release
 */
enum PNG_LIBPNG_VER = 10513; /* 1.5.13 */

/* Version information for C files, stored in png.c.  This had better match
 * the version above.
 */
// TODO: Disabled due to compilation difficulties.  This is not a constant.
//enum png_libpng_ver = png_get_header_ver(null);

//#ifdef PNG_APNG_SUPPORTED
/* dispose_op flags from inside fcTL */
enum PNG_DISPOSE_OP_NONE        = 0x00;
enum PNG_DISPOSE_OP_BACKGROUND  = 0x01;
enum PNG_DISPOSE_OP_PREVIOUS    = 0x02;

/* blend_op flags from inside fcTL */
enum PNG_BLEND_OP_SOURCE        = 0x00;
enum PNG_BLEND_OP_OVER          = 0x01;
// #endif /* PNG_APNG_SUPPORTED */

/* This triggers a compiler error in png.c, if png.c and png.h
 * do not agree upon the version number.
 */
/+typedef char* png_libpng_version_1_5_13;+/

/* Supported compression types for text in PNG files (tEXt, and zTXt).
 * The values of the PNG_TEXT_COMPRESSION_ defines should NOT be changed. */
enum PNG_TEXT_COMPRESSION_NONE_WR = -3;
enum PNG_TEXT_COMPRESSION_zTXt_WR = -2;
enum PNG_TEXT_COMPRESSION_NONE    = -1;
enum PNG_TEXT_COMPRESSION_zTXt     = 0;
enum PNG_ITXT_COMPRESSION_NONE     = 1;
enum PNG_ITXT_COMPRESSION_zTXt     = 2;
enum PNG_TEXT_COMPRESSION_LAST     = 3;  /* Not a valid value */

/* Values for the unknown chunk location byte */

enum PNG_HAVE_IHDR  = 0x01;
enum PNG_HAVE_PLTE  = 0x02;
enum PNG_AFTER_IDAT = 0x08;

/* Maximum positive integer used in PNG is (2^31)-1 */
enum PNG_UINT_31_MAX = (cast(png_uint_32)0x7fffffff);
enum PNG_UINT_32_MAX = (cast(png_uint_32)(-1));
enum PNG_SIZE_MAX = (cast(png_size_t)(-1));

/* These are constants for fixed point values encoded in the
 * PNG specification manner (x100000)
 */
enum PNG_FP_1    = 100000;
enum PNG_FP_HALF  = 50000;
enum PNG_FP_MAX  = (cast(png_fixed_point)0x7fffffffL);
enum PNG_FP_MIN  = (-PNG_FP_MAX);

/* These describe the color_type field in png_info. */
/* color type masks */
enum PNG_COLOR_MASK_PALETTE    = 1;
enum PNG_COLOR_MASK_COLOR      = 2;
enum PNG_COLOR_MASK_ALPHA      = 4;

/* color types.  Note that not all combinations are legal */
enum PNG_COLOR_TYPE_GRAY = 0;
enum PNG_COLOR_TYPE_PALETTE  = (PNG_COLOR_MASK_COLOR | PNG_COLOR_MASK_PALETTE);
enum PNG_COLOR_TYPE_RGB        = (PNG_COLOR_MASK_COLOR);
enum PNG_COLOR_TYPE_RGB_ALPHA  = (PNG_COLOR_MASK_COLOR | PNG_COLOR_MASK_ALPHA);
enum PNG_COLOR_TYPE_GRAY_ALPHA = (PNG_COLOR_MASK_ALPHA);
/* aliases */
enum PNG_COLOR_TYPE_RGBA  = PNG_COLOR_TYPE_RGB_ALPHA;
enum PNG_COLOR_TYPE_GA  = PNG_COLOR_TYPE_GRAY_ALPHA;

/* This is for compression type. PNG 1.0-1.2 only define the single type. */
enum PNG_COMPRESSION_TYPE_BASE = 0; /* Deflate method 8, 32K window */
enum PNG_COMPRESSION_TYPE_DEFAULT = PNG_COMPRESSION_TYPE_BASE;

/* This is for filter type. PNG 1.0-1.2 only define the single type. */
enum PNG_FILTER_TYPE_BASE      = 0; /* Single row per-byte filtering */
enum PNG_INTRAPIXEL_DIFFERENCING = 64; /* Used only in MNG datastreams */
enum PNG_FILTER_TYPE_DEFAULT   = PNG_FILTER_TYPE_BASE;

/* These are for the interlacing type.  These values should NOT be changed. */
enum PNG_INTERLACE_NONE        = 0; /* Non-interlaced image */
enum PNG_INTERLACE_ADAM7       = 1; /* Adam7 interlacing */
enum PNG_INTERLACE_LAST        = 2; /* Not a valid value */

/* These are for the oFFs chunk.  These values should NOT be changed. */
enum PNG_OFFSET_PIXEL          = 0; /* Offset in pixels */
enum PNG_OFFSET_MICROMETER     = 1; /* Offset in micrometers (1/10^6 meter) */
enum PNG_OFFSET_LAST           = 2; /* Not a valid value */

/* These are for the pCAL chunk.  These values should NOT be changed. */
enum PNG_EQUATION_LINEAR       = 0; /* Linear transformation */
enum PNG_EQUATION_BASE_E       = 1; /* Exponential base e transform */
enum PNG_EQUATION_ARBITRARY    = 2; /* Arbitrary base exponential transform */
enum PNG_EQUATION_HYPERBOLIC   = 3; /* Hyperbolic sine transformation */
enum PNG_EQUATION_LAST         = 4; /* Not a valid value */

/* These are for the sCAL chunk.  These values should NOT be changed. */
enum PNG_SCALE_UNKNOWN         = 0; /* unknown unit (image scale) */
enum PNG_SCALE_METER           = 1; /* meters per pixel */
enum PNG_SCALE_RADIAN          = 2; /* radians per pixel */
enum PNG_SCALE_LAST            = 3; /* Not a valid value */

/* These are for the pHYs chunk.  These values should NOT be changed. */
enum PNG_RESOLUTION_UNKNOWN    = 0; /* pixels/unknown unit (aspect ratio) */
enum PNG_RESOLUTION_METER      = 1; /* pixels/meter */
enum PNG_RESOLUTION_LAST       = 2; /* Not a valid value */

/* These are for the sRGB chunk.  These values should NOT be changed. */
enum PNG_sRGB_INTENT_PERCEPTUAL = 0;
enum PNG_sRGB_INTENT_RELATIVE   = 1;
enum PNG_sRGB_INTENT_SATURATION = 2;
enum PNG_sRGB_INTENT_ABSOLUTE   = 3;
enum PNG_sRGB_INTENT_LAST       = 4; /* Not a valid value */

/* This is for text chunks */
enum PNG_KEYWORD_MAX_LENGTH     = 79;

/* Maximum number of entries in PLTE/sPLT/tRNS arrays */
enum PNG_MAX_PALETTE_LENGTH    = 256;

/* These determine if an ancillary chunk's data has been successfully read
 * from the PNG header, or if the application has filled in the corresponding
 * data in the info_struct to be written into the output file.  The values
 * of the PNG_INFO_<chunk> defines should NOT be changed.
 */
enum PNG_INFO_gAMA = 0x0001;
enum PNG_INFO_sBIT = 0x0002;
enum PNG_INFO_cHRM = 0x0004;
enum PNG_INFO_PLTE = 0x0008;
enum PNG_INFO_tRNS = 0x0010;
enum PNG_INFO_bKGD = 0x0020;
enum PNG_INFO_hIST = 0x0040;
enum PNG_INFO_pHYs = 0x0080;
enum PNG_INFO_oFFs = 0x0100;
enum PNG_INFO_tIME = 0x0200;
enum PNG_INFO_pCAL = 0x0400;
enum PNG_INFO_sRGB = 0x0800;   /* GR-P, 0.96a */
enum PNG_INFO_iCCP = 0x1000;   /* ESR, 1.0.6 */
enum PNG_INFO_sPLT = 0x2000;   /* ESR, 1.0.6 */
enum PNG_INFO_sCAL = 0x4000;   /* ESR, 1.0.6 */
enum PNG_INFO_IDAT = 0x8000;   /* ESR, 1.0.6 */
// #ifdef PNG_APNG_SUPPORTED
enum PNG_INFO_acTL = 0x10000;
enum PNG_INFO_fcTL = 0x20000;
// #endif

/* Transform masks for the high-level interface */
enum PNG_TRANSFORM_IDENTITY       = 0x0000;    /* read and write */
enum PNG_TRANSFORM_STRIP_16       = 0x0001;    /* read only */
enum PNG_TRANSFORM_STRIP_ALPHA    = 0x0002;    /* read only */
enum PNG_TRANSFORM_PACKING        = 0x0004;    /* read and write */
enum PNG_TRANSFORM_PACKSWAP       = 0x0008;    /* read and write */
enum PNG_TRANSFORM_EXPAND         = 0x0010;    /* read only */
enum PNG_TRANSFORM_INVERT_MONO    = 0x0020;    /* read and write */
enum PNG_TRANSFORM_SHIFT          = 0x0040;    /* read and write */
enum PNG_TRANSFORM_BGR            = 0x0080;    /* read and write */
enum PNG_TRANSFORM_SWAP_ALPHA     = 0x0100;    /* read and write */
enum PNG_TRANSFORM_SWAP_ENDIAN    = 0x0200;    /* read and write */
enum PNG_TRANSFORM_INVERT_ALPHA   = 0x0400;    /* read and write */
enum PNG_TRANSFORM_STRIP_FILLER   = 0x0800;    /* write only */
/* Added to libpng-1.2.34 */
enum PNG_TRANSFORM_STRIP_FILLER_BEFORE = PNG_TRANSFORM_STRIP_FILLER;
enum PNG_TRANSFORM_STRIP_FILLER_AFTER = 0x1000; /* write only */
/* Added to libpng-1.4.0 */
enum PNG_TRANSFORM_GRAY_TO_RGB   = 0x2000;      /* read only */
/* Added to libpng-1.5.4 */
enum PNG_TRANSFORM_EXPAND_16     = 0x4000;      /* read only */
enum PNG_TRANSFORM_SCALE_16      = 0x8000;      /* read only */

/* Flags for MNG supported features */
enum PNG_FLAG_MNG_EMPTY_PLTE     = 0x01;
enum PNG_FLAG_MNG_FILTER_64      = 0x04;
enum PNG_ALL_MNG_FEATURES        = 0x05;

/* Reduce RGB to grayscale. */
enum PNG_ERROR_ACTION_NONE  = 1;
enum PNG_ERROR_ACTION_WARN  = 2;
enum PNG_ERROR_ACTION_ERROR = 3;
enum PNG_RGB_TO_GRAY_DEFAULT = (-1);/*for red/green coefficients*/

// #ifdef PNG_READ_ALPHA_MODE_SUPPORTED
/* How the alpha channel is interpreted - this affects how the color channels of
 * a PNG file are returned when an alpha channel, or tRNS chunk in a palette
 * file, is present.
 *
 * This has no effect on the way pixels are written into a PNG output
 * datastream. The color samples in a PNG datastream are never premultiplied
 * with the alpha samples.
 *
 * The default is to return data according to the PNG specification: the alpha
 * channel is a linear measure of the contribution of the pixel to the
 * corresponding composited pixel.  The gamma encoded color channels must be
 * scaled according to the contribution and to do this it is necessary to undo
 * the encoding, scale the color values, perform the composition and reencode
 * the values.  This is the 'PNG' mode.
 *
 * The alternative is to 'associate' the alpha with the color information by
 * storing color channel values that have been scaled by the alpha.  The
 * advantage is that the color channels can be resampled (the image can be
 * scaled) in this form.  The disadvantage is that normal practice is to store
 * linear, not (gamma) encoded, values and this requires 16-bit channels for
 * still images rather than the 8-bit channels that are just about sufficient if
 * gamma encoding is used.  In addition all non-transparent pixel values,
 * including completely opaque ones, must be gamma encoded to produce the final
 * image.  This is the 'STANDARD', 'ASSOCIATED' or 'PREMULTIPLIED' mode (the
 * latter being the two common names for associated alpha color channels.)
 *
 * Since it is not necessary to perform arithmetic on opaque color values so
 * long as they are not to be resampled and are in the final color space it is
 * possible to optimize the handling of alpha by storing the opaque pixels in
 * the PNG format (adjusted for the output color space) while storing partially
 * opaque pixels in the standard, linear, format.  The accuracy required for
 * standard alpha composition is relatively low, because the pixels are
 * isolated, therefore typically the accuracy loss in storing 8-bit linear
 * values is acceptable.  (This is not true if the alpha channel is used to
 * simulate transparency over large areas - use 16 bits or the PNG mode in
 * this case!)  This is the 'OPTIMIZED' mode.  For this mode a pixel is
 * treated as opaque only if the alpha value is equal to the maximum value.
 *
 * The final choice is to gamma encode the alpha channel as well.  This is
 * broken because, in practice, no implementation that uses this choice
 * correctly undoes the encoding before handling alpha composition.  Use this
 * choice only if other serious errors in the software or hardware you use
 * mandate it; the typical serious error is for dark halos to appear around
 * opaque areas of the composited PNG image because of arithmetic overflow.
 *
 * The API function png_set_alpha_mode specifies which of these choices to use
 * with an enumerated 'mode' value and the gamma of the required output:
 */
enum PNG_ALPHA_PNG           = 0; /* according to the PNG standard */
enum PNG_ALPHA_STANDARD      = 1; /* according to Porter/Duff */
enum PNG_ALPHA_ASSOCIATED    = 1; /* as above; this is the normal practice */
enum PNG_ALPHA_PREMULTIPLIED = 1; /* as above */
enum PNG_ALPHA_OPTIMIZED     = 2; /* 'PNG' for opaque pixels, else 'STANDARD' */
enum PNG_ALPHA_BROKEN        = 3; /* the alpha channel is gamma encoded */

// #endif

// #if defined(PNG_READ_GAMMA_SUPPORTED) || defined(PNG_READ_ALPHA_MODE_SUPPORTED)
/* The output_gamma value is a screen gamma in libpng terminology: it expresses
 * how to decode the output values, not how they are encoded.  The values used
 * correspond to the normal numbers used to describe the overall gamma of a
 * computer display system; for example 2.2 for an sRGB conformant system.  The
 * values are scaled by 100000 in the _fixed version of the API (so 220000 for
 * sRGB.)
 *
 * The inverse of the value is always used to provide a default for the PNG file
 * encoding if it has no gAMA chunk and if png_set_gamma() has not been called
 * to override the PNG gamma information.
 *
 * When the ALPHA_OPTIMIZED mode is selected the output gamma is used to encode
 * opaque pixels however pixels with lower alpha values are not encoded,
 * regardless of the output gamma setting.
 *
 * When the standard Porter Duff handling is requested with mode 1 the output
 * encoding is set to be linear and the output_gamma value is only relevant
 * as a default for input data that has no gamma information.  The linear output
 * encoding will be overridden if png_set_gamma() is called - the results may be
 * highly unexpected!
 *
 * The following numbers are derived from the sRGB standard and the research
 * behind it.  sRGB is defined to be approximated by a PNG gAMA chunk value of
 * 0.45455 (1/2.2) for PNG.  The value implicitly includes any viewing
 * correction required to take account of any differences in the color
 * environment of the original scene and the intended display environment; the
 * value expresses how to *decode* the image for display, not how the original
 * data was *encoded*.
 *
 * sRGB provides a peg for the PNG standard by defining a viewing environment.
 * sRGB itself, and earlier TV standards, actually use a more complex transform
 * (a linear portion then a gamma 2.4 power law) than PNG can express.  (PNG is
 * limited to simple power laws.)  By saying that an image for direct display on
 * an sRGB conformant system should be stored with a gAMA chunk value of 45455
 * (11.3.3.2 and 11.3.3.5 of the ISO PNG specification) the PNG specification
 * makes it possible to derive values for other display systems and
 * environments.
 *
 * The Mac value is deduced from the sRGB based on an assumption that the actual
 * extra viewing correction used in early Mac display systems was implemented as
 * a power 1.45 lookup table.
 *
 * Any system where a programmable lookup table is used or where the behavior of
 * the final display device characteristics can be changed requires system
 * specific code to obtain the current characteristic.  However this can be
 * difficult and most PNG gamma correction only requires an approximate value.
 *
 * By default, if png_set_alpha_mode() is not called, libpng assumes that all
 * values are unencoded, linear, values and that the output device also has a
 * linear characteristic.  This is only very rarely correct - it is invariably
 * better to call png_set_alpha_mode() with PNG_DEFAULT_sRGB than rely on the
 * default if you don't know what the right answer is!
 *
 * The special value PNG_GAMMA_MAC_18 indicates an older Mac system (pre Mac OS
 * 10.6) which used a correction table to implement a somewhat lower gamma on an
 * otherwise sRGB system.
 *
 * Both these values are reserved (not simple gamma values) in order to allow
 * more precise correction internally in the future.
 *
 * NOTE: the following values can be passed to either the fixed or floating
 * point APIs, but the floating point API will also accept floating point
 * values.
 */
enum PNG_DEFAULT_sRGB = -1;       /* sRGB gamma and color space */
enum PNG_GAMMA_MAC_18 = -2;       /* Old Mac '1.8' gamma and color space */
enum PNG_GAMMA_sRGB   = 220000;   /* Television standards--matches sRGB gamma */
enum PNG_GAMMA_LINEAR = PNG_FP_1; /* Linear */
// #endif

/* The values of the PNG_FILLER_ defines should NOT be changed */
enum PNG_FILLER_BEFORE = 0;
enum PNG_FILLER_AFTER  = 1;

// #ifdef PNG_READ_BACKGROUND_SUPPORTED
enum PNG_BACKGROUND_GAMMA_UNKNOWN = 0;
enum PNG_BACKGROUND_GAMMA_SCREEN  = 1;
enum PNG_BACKGROUND_GAMMA_FILE    = 2;
enum PNG_BACKGROUND_GAMMA_UNIQUE  = 3;
// #endif

// #ifdef PNG_READ_GAMMA_SUPPORTED
/* The threshold on gamma processing is configurable but hard-wired into the
 * library.  The following is the floating point variant.
 */
enum PNG_GAMMA_THRESHOLD = (PNG_GAMMA_THRESHOLD_FIXED*.00001);
// #endif

/* Values for png_set_crc_action() say how to handle CRC errors in
 * ancillary and critical chunks, and whether to use the data contained
 * therein.  Note that it is impossible to "discard" data in a critical
 * chunk.  For versions prior to 0.90, the action was always error/quit,
 * whereas in version 0.90 and later, the action for CRC errors in ancillary
 * chunks is warn/discard.  These values should NOT be changed.
 *
 *      value                       action:critical     action:ancillary
 */
enum PNG_CRC_DEFAULT       = 0;  /* error/quit          warn/discard data */
enum PNG_CRC_ERROR_QUIT    = 1;  /* error/quit          error/quit        */
enum PNG_CRC_WARN_DISCARD  = 2;  /* (INVALID)           warn/discard data */
enum PNG_CRC_WARN_USE      = 3;  /* warn/use data       warn/use data     */
enum PNG_CRC_QUIET_USE     = 4;  /* quiet/use data      quiet/use data    */
enum PNG_CRC_NO_CHANGE     = 5;  /* use current value   use current value */

/* Flags for png_set_filter() to say which filters to use.  The flags
 * are chosen so that they don't conflict with real filter types
 * below, in case they are supplied instead of the #defined constants.
 * These values should NOT be changed.
 */
enum PNG_NO_FILTERS     = 0x00;
enum PNG_FILTER_NONE    = 0x08;
enum PNG_FILTER_SUB     = 0x10;
enum PNG_FILTER_UP      = 0x20;
enum PNG_FILTER_AVG     = 0x40;
enum PNG_FILTER_PAETH   = 0x80;
enum PNG_ALL_FILTERS = (PNG_FILTER_NONE | PNG_FILTER_SUB | PNG_FILTER_UP |
                         PNG_FILTER_AVG | PNG_FILTER_PAETH);

/* Filter values (not flags) - used in pngwrite.c, pngwutil.c for now.
 * These defines should NOT be changed.
 */
enum PNG_FILTER_VALUE_NONE  = 0;
enum PNG_FILTER_VALUE_SUB   = 1;
enum PNG_FILTER_VALUE_UP    = 2;
enum PNG_FILTER_VALUE_AVG   = 3;
enum PNG_FILTER_VALUE_PAETH = 4;
enum PNG_FILTER_VALUE_LAST  = 5;

/* Heuristic used for row filter selection.  These defines should NOT be
 * changed.
 */
enum PNG_FILTER_HEURISTIC_DEFAULT    = 0;  /* Currently "UNWEIGHTED" */
enum PNG_FILTER_HEURISTIC_UNWEIGHTED = 1;  /* Used by libpng < 0.95 */
enum PNG_FILTER_HEURISTIC_WEIGHTED   = 2;  /* Experimental feature */
enum PNG_FILTER_HEURISTIC_LAST       = 3;  /* Not a valid value */

/* Assignments for png_data_freer */
enum PNG_DESTROY_WILL_FREE_DATA = 1;
enum PNG_SET_WILL_FREE_DATA = 1;
enum PNG_USER_WILL_FREE_DATA = 2;
/* Flags for png_ptr->free_me and info_ptr->free_me */
enum PNG_FREE_HIST = 0x0008;
enum PNG_FREE_ICCP = 0x0010;
enum PNG_FREE_SPLT = 0x0020;
enum PNG_FREE_ROWS = 0x0040;
enum PNG_FREE_PCAL = 0x0080;
enum PNG_FREE_SCAL = 0x0100;
enum PNG_FREE_UNKN = 0x0200;
enum PNG_FREE_LIST = 0x0400;
enum PNG_FREE_PLTE = 0x1000;
enum PNG_FREE_TRNS = 0x2000;
enum PNG_FREE_TEXT = 0x4000;
enum PNG_FREE_ALL  = 0x7fff;
enum PNG_FREE_MUL  = 0x4220; /* PNG_FREE_SPLT|PNG_FREE_TEXT|PNG_FREE_UNKN */

/* For use in png_set_keep_unknown, added to version 1.2.6 */
enum PNG_HANDLE_CHUNK_AS_DEFAULT   = 0;
enum PNG_HANDLE_CHUNK_NEVER        = 1;
enum PNG_HANDLE_CHUNK_IF_SAFE      = 2;
enum PNG_HANDLE_CHUNK_ALWAYS       = 3;

/* The flags returned by png_get_io_state() are the following: */
enum PNG_IO_NONE        = 0x0000;   /* no I/O at this moment */
enum PNG_IO_READING     = 0x0001;   /* currently reading */
enum PNG_IO_WRITING     = 0x0002;   /* currently writing */
enum PNG_IO_SIGNATURE   = 0x0010;   /* currently at the file signature */
enum PNG_IO_CHUNK_HDR   = 0x0020;   /* currently at the chunk header */
enum PNG_IO_CHUNK_DATA  = 0x0040;   /* currently at the chunk data */
enum PNG_IO_CHUNK_CRC   = 0x0080;   /* currently at the chunk crc */
enum PNG_IO_MASK_OP     = 0x000f;   /* current operation: reading/writing */
enum PNG_IO_MASK_LOC    = 0x00f0;   /* current location: sig/hdr/data/crc */

/* Interlace support.  The following macros are always defined so that if
 * libpng interlace handling is turned off the macros may be used to handle
 * interlaced images within the application.
 */
enum PNG_INTERLACE_ADAM7_PASSES = 7;
