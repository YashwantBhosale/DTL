#!/bin/bash

# program to calculate factorial
factorial () {
	if [ "$#" -ne 1 ]
	then
		echo "invalid number of arguments! only one argument is expected!"
		return 0
	fi
	n=$1
	i=1;
	fact=1
	while [ "$i" -le "$n" ] 
	do
		fact=$((fact*i))
		i=$((i+1))
	done

	echo "$fact"
}

read -p "Enter number: " N
result=$(factorial "$N")
echo "factorial= $result"

greet () {
	if [ "$#" -ne 0 ] 
	then
		echo "Hello, $1!"
	else
		echo "Hello, Anonymous"
	fi
}

read -p "What is your name: " name
greet $name
