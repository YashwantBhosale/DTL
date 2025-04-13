#!/bin/sh

# for loop
# example 1:
for i in 1 2 3 4 5
do
	echo "Looping... number $i"
done


# example 2
for i in hello 1 * 2 goodbye
do 
	echo "Looping ... i is set to $i"
done

# while loop
# example 1

INPUT_STRING=random

while [ "$INPUT_STRING" != "bye" ]
do
	echo "Enter anything.. it'll just be echoed (bye to quit)"
	read INPUT_STRING
	echo "You entered: $INPUT_STRING"
done
