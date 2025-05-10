#!/bin/bash

# Write a shell program to sort all files stored in a given folder hierarchy, on their size.

# simple solution ls -lShr # smallest to larget
# ls -lSh # largest to smallest

for FILE in *
do
	output=$(du -b "$FILE")
	read -ra fields <<< "$output"	
	echo "${fields[0]}    ${fields[1]}"
done | sort -n
