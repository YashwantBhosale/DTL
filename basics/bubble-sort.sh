#!/bin/bash

numArr=()

i=0
len=0
while read numArr[$i]; do
	i=$((i+1))
	len=$((len+1))
done

echo ""
echo "len= $len"

for ((i = 0; i < len; i++)); do
	for ((j = 0; j < len-i-1; j++)); do
		temp="${numArr[$j]}"
		numArr[$j]="${numArr[$((j+1))]}"
		numArr[$((j+1))]="$temp"
	done
done

for element in "${numArr[@]}"
do	
	echo $element
done
