#!/usr/bin/env bash
script_dir=${0%/*}
set -v
cd ${script_dir}
./build_generator.sh
./bin/wrapper_generator ./c/ ./generated
./build_wrapper.sh
./build_examples.sh