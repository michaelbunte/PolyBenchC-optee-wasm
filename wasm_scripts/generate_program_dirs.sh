#!/bin/bash

cd ..
PROGRAMS_DIRS="./wasm_scripts/program_dirs.txt"
rm $PROGRAMS_DIRS 2> /dev/null
touch $PROGRAMS_DIRS

find ./datamining/     -type d -links 2 >> "$PROGRAMS_DIRS"
find ./linear-algebra/ -type d -links 2 >> "$PROGRAMS_DIRS"
find ./medley/         -type d -links 2 >> "$PROGRAMS_DIRS"
find ./stencils/       -type d -links 2 >> "$PROGRAMS_DIRS"