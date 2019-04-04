#!/usr/bin/env bash
script_dir=${0%/*}
set -v
cd ${script_dir}
./build_generator.sh || exit
./bin/wrapper_generator ./c/ ./generated || exit
./build_wrapper.sh || exit
./build_examples.sh
