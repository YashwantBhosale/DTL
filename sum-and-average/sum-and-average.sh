#!/bin/bash

sum=0
count=0
echo "enter numbers: 1 number per line then enter done to see the output"
while true; do
	read a
	if [[ $a == "done" ]]; then
		break		
	fi
	((count++))
	sum=$((sum+a))
done
echo "sum: $sum"
echo "average: $((sum/count))"
