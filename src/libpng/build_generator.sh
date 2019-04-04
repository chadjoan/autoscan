#!/usr/bin/env bash
script_dir=${0%/*}
set -v
cd ${script_dir}
dmd generator/wrapper_generator.d -ofbin/wrapper_generator
RESULT=$?
if [ $RESULT -ne 0 ]; then
	rm -f generated/*.c
	rm -f generated/*.h
	rm -f generated/*.d
	exit $RESULT
fi
rm -f bin/*.o
