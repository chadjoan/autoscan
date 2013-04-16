#!/usr/bin/env bash
script_dir=${0%/*}
set -v
DFLAGS="-I.. -L-Llib -L-lpng_wrapper -L-lpng -g -debug"
dmd examples/write_bars.d ${DFLAGS} -ofbin/write_bars
rm -f bin/*.o