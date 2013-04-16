#!/usr/bin/env bash
script_dir=${0%/*}
set -v
cd ${script_dir}
dmd generator/wrapper_generator.d -ofbin/wrapper_generator
rm -f bin/*.o