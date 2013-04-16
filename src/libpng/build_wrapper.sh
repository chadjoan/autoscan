#!/usr/bin/env bash
script_dir=${0%/*}
set -v
cd ${script_dir}
script_dir=$(pwd)
dmd *.d generated/*.d -I../ -c -od./d_obj
cd c_obj
gcc ../*.c ../generated/*.c -I../ -c
cd ${script_dir}
ar rcs lib/libpng_wrapper.a c_obj/*.o d_obj/*.o
rm -f *.o
rm -f c_obj/*.o
rm -f d_obj/*.o