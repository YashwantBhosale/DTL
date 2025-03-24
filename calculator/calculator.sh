#!/usr/bin/bash
ans=0

while true; do
	echo "Enter two numbers"
	read a
	if [ "$a" == "ans" ]; then
		a=$ans
	fi

	read b
	if [ "$b" == "ans" ]; then
		b=$ans
	fi

	echo "Choose Operation: "
	echo "1. Addition"
	echo "2. Subtraction"
	echo "3. Multiplication"
	echo "4. Division"
	echo "5. Exit"	

	read option

	if [ $option -eq 1 ]; then
		ans=$(echo "scale=2; $a+$b" | bc)
	elif [ $option -eq 2 ]; then
		ans=$(echo "scale=2; $a-$b" | bc)
	elif [ $option -eq 3 ]; then
		ans=$(echo "scale=2; $a*$b" | bc)
	elif [ $option -eq 4 ]; then
		ans=$(echo "scale=2; $a/$b" | bc)
	elif [ $option -eq 5 ]; then
		break
	fi
	echo "Answer: $ans"
done
