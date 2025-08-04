#!/bin/bash
rm ./ta/.*.cmd ./ta/*.cmd 2>/dev/null
rm ./ta/.*.elf ./ta/*.elf 2>/dev/null
rm ./ta/.*.d ./ta/*.d 2>/dev/null
rm ./ta/.*.o ./ta/*.o 2>/dev/null
rm ./ta/.*.dmp ./ta/*.dmp 2>/dev/null
rm ./ta/.*.map ./ta/*.map 2>/dev/null
rm ./ta/.*.ta ./ta/*.ta 2>/dev/null
rm ./ta/.*.lds ./ta/*.lds 2>/dev/null
rm ./ta/dyn_list 2>/dev/null

rm ./host/*.o 2>/dev/null
