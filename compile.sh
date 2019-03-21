set -v
gcc src/sane/sane_test_c.c -c
dmd -ofbin/autoscan \
    src/*.d \
    src/sane/*.d \
    src/haru/*.d \
    src/tesseract/*.d \
    sane_test_c.o \
    -Isrc \
    -L-Lsrc/libpng/lib \
    -L-Llib \
    -L-lpng_wrapper \
    -L-lpng \
    -L-lsane \
    -L-ltesseract-noviewer \
    -L-lhpdf \
    -L-llept \
    -unittest -g -debug
rm *.o
