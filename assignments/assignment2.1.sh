#!/bin/bash

# Write a shell program to extract a compressed file in any format (zip, tar.gz, tar.gz2, .tar,
# .bz2, .gz, .rar, .Z, .7z, etc)

# life is easy if we use some tool like atool which automatically detects file format and extracts it

if [ "$#" -ne 1 ]; then	
	echo "no file provided"
	exit 1
fi
echo $1
aunpack -X "$1"
