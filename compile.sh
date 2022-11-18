#!/bin/bash
as -g -mfpu=vfpv2 -o $1.o $1.s
gcc -o $1 $1.o
rm $1.o
./$1 ; echo $?
