#!/usr/bin/sh


while true; do
	echo "Enter two numbers"
	read a
	read b
	echo "Choose Operation: "
	echo "1. Addition"
	echo "2. Subtraction"
	echo "3. Multiplication"
	echo "4. Division"
	echo "5. Exit"	

	read option
	
	if [ $option -eq 1 ]; then
		echo $((a+b))
	elif [ $option -eq 2 ]; then
		echo $((a-b))
	elif [ $option -eq 3 ]; then
		echo $((a*b))
	elif [ $option -eq 4 ]; then
		echo $((a/b))
	elif [ $option -eq 5 ]; then
		break
	fi
done
