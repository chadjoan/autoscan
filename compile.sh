gcc src/sane/sane_test_c.c -c
dmd -ofbin/autoscan src/*.d src/sane/*.d src/haru/*.d sane_test_c.o -Isrc -L-lsane -L-lhpdf -unittest -gc -debug
rm *.o
