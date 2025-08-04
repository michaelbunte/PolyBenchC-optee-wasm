#!/bin/bash

TIME_CMD=$(which time)

for bin in ./ree_c_binaries/*; do
    ./$bin
done
