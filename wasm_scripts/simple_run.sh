#!/bin/bash
cd ./../utilities 

./clean.pl .. 2>/dev/null
./header-gen.pl .. 
./makefile-gen.pl .. -cfg

$OUTFILE=/dev/null
./run-all.pl ..
