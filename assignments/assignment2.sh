#!/bin/bash

# Write a shell program to extract a compressed file in any format (zip, tar.gz, tar.gz2, .tar,
# .bz2, .gz, .rar, .Z, .7z, etc)

if [ "$#" -ne 1 ]
then
	echo "Invalid number of arguments!"
fi

filename="$1"

# i am doing only four formats because other formats require their
# special tools to extract, these ship directly with standard linux
# packages

# i am not sure if this is the best way to do this
# there may be better approach but code aint bad as long as it works :)
if [[ "$filename" =~ ^.*\.tar\.gz$ ]]
then
	tar -xvzf "$1" -C "extracted"
elif [[ "$filename" =~ ^.*\.tar\.bz2$ ]]
then
	tar -xvjf "$1" -C "extracted"
elif [[ "$filename" =~ ^.*\.bz2$ ]]
then
	rm -r "extracted"
	mkdir "extracted"
	cp "$1" "extracted"
	bunzip2 "extracted/$1"
elif [[ "$filename" =~ ^.*\.gz$ ]]
then
	rm -r "extracted"
	mkdir "extracted"
	cp "$1" "extracted"
	gunzip "extracted/$1"
elif [[ "$filename" =~ ^.*\.tar$ ]]
then
	tar -xvf "$1" -C "extracted"
else
	echo "you use old files haha! our software little too ahead!"
fi

