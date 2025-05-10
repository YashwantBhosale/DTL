#!/bin/bash

read -p "Enter first number: " num1
read -p "Enter second number: " num2

max=0
if [ "$num1" -gt "$num2" ]
then
	max=$num1
else
	max=$num2
fi

while true; do
	if [[ $((max % num1)) == 0 && $((max % num2)) == 0 ]]
	then
		echo "LCM= $max"
		break 
	fi
	max=$(($max + 1))
done
