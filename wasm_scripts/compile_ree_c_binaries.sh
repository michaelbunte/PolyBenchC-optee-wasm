#!/bin/bash

# Clean previous list
rm -f programs_dir

# Go to top-level PolyBenchC dir
cd ..

# Output paths
PROGRAMS_LIST=$(pwd)/wasm_scripts/programs_dir
BIN_OUTPUT=$(pwd)/wasm_scripts/ree_c_binaries

# Make sure binary output dir exists
mkdir -p "$BIN_OUTPUT"

# Find leaf directories
find ./datamining/     -type d -links 2 >> "$PROGRAMS_LIST"
find ./linear-algebra/ -type d -links 2 >> "$PROGRAMS_LIST"
find ./medley/         -type d -links 2 >> "$PROGRAMS_LIST"
find ./stencils/       -type d -links 2 >> "$PROGRAMS_LIST"

# Run header and makefile generators
cd ./utilities
./clean.pl .. 2>/dev/null
./header-gen.pl ..
./makefile-gen.pl .. -cfg
cd ..

# Compile and move binary
while IFS= read -r dir; do
    echo "Building in $dir"
    (
        cd "$dir" && make
        binary_name=$(basename "$dir")
        if [[ -f "$binary_name" ]]; then
            mv "$binary_name" "$BIN_OUTPUT/"
        else
            echo "Warning: binary '$binary_name' not found in $dir"
        fi
    )
done < "$PROGRAMS_LIST"
