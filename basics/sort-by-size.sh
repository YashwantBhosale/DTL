#!/bin/bash

diretory="$1"

find "$1" -maxdepth 1 -type f | while IFS= read -r FILE
do
	sizeOutput=$(du -b "$FILE")
	read -a fields <<< "$sizeOutput"
	echo "${fields[0]} ${fields[1]}"
done | sort -n
