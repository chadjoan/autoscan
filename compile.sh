gcc sane_test_c.c -c
dmd autoscan.d sane.d sane_test.d sane_wrapper.d text_table.d sane_test_c.o -L-lsane -unittest -gc -debug
rm *.o
