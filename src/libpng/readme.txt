Summary:

This is a wrapper of the libpng library for D.

It wraps the setjmp/longjmp style error handling in libpng, converting such
events into thrown exceptions on the D side of the wrapper.

Code that uses this wrapper should import the png.d file and none of the others.
Example:
import libpng.png;

This wrapper requires additional code that is compiled into lib/libpng_wrapper.a
which should be statically linked into the D code that calls libpng, along with
the libpng library file.  This library contains compiled versions of the .d
files in the wrapper, so it is not necessary to pass those to dmd.
Example:
dmd myproject/myprogram.d -Imyproject -L-Lmyproject/libpng/lib -L-lpng_wrapper -L-lpng

The directory structure for the above examples is as follows:
myproject/myprogram.d
myproject/libpng/png.d
myproject/libpng/lib/libpng_wrapper.d
myproject/libpng/<other libpng wrapper files; not important>

For more detailed usage information, see libpng/examples/write_bars.d



Implementation Overview:

The libpng wrapper from C to D is more complicated than most.

For starters, it uses setjmp/longjmp, which is suboptimal in D.  Helper
functions should to be created in C that perform the setjmp and pass exception
handling information back into the D code if something goes wrong.  More helper
functions on the D side receive the exception handling information and turn it
into a proper exception (PngException) that then gets thrown.

However, setjmp is the easy conceptual hurtle.  The part that's actually
difficult is all of the functions enclosed in various unrelated '#ifdef' and
'#if defined(foo) || defined(bar)' conditions.  These are not guaranteed to
exist at link time, and most libpng functions are defined that way.  What the
C helper functions need to do then is detect, at compile time, whether or not
the corresponding libpng function can even be expected to exist.  It can do
this based on the values in the target libpng's pnglibconf.h file.  If the C
helper function determines that its libpng function isn't available, then it
signals an exception condition to the D code that can be caught at runtime.
By this mechanism it is possible to (nearly) gaurantee that the C helper
functions will work on anyone's system as long as they don't call the missing
functions.  This is better than the alternative: a wrapper that is not
gauranteed to link properly at all, regardless of which functions the caller
uses.

At this point it should be fairly clear that the C helper functions are fairly
complicated.  They certainly are not one-liners.  Writing them by hand for all
of libpng's 200+ functions (or even a useful subset thereof) is a daunting,
error-prone, and likely impractical task.  It would also be resistant to folding
in any changes from future libpng versions.  That is why this binding uses a
custom generator to extract information from some reference libpng headers and
then uses that information to generate all of the helper functions in C and D
in such a way that they will always compile and link against any relatively
non-ancient version of libpng.
