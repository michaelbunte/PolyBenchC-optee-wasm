#!/bin/bash

cd ..
PROGRAMS_DIRS="./wasm_scripts/program_dirs"
rm $PROGRAMS_DIRS
touch $PROGRAMS_DIRS

find ./datamining/     -type d -links 2 >> "$PROGRAMS_DIRS"
find ./linear-algebra/ -type d -links 2 >> "$PROGRAMS_DIRS"
find ./medley/         -type d -links 2 >> "$PROGRAMS_DIRS"
find ./stencils/       -type d -links 2 >> "$PROGRAMS_DIRS"