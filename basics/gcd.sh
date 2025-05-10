#!/bin/bash

read -p "Enter first number: " a
read -p "Enter second number: " b

while [ "$b" -ne 0 ] 
do
	temp=$b
	b=$((a%b))
	a=$temp
done

echo "GCD= $a"
