#!/bin/bash

# Write a program that scans a file line by line, splits each input line into fields later,
# compares input line/fields to pattern and performs action(s) on matched lines

if [ "$#" -ne 2 ]
then
	echo "invalid number of args"
	exit 1
fi

skip=1 # skip first line as it contains header fields
filename="$1"
pattern="$2"

while IFS=',' read -r name phone email
do
	# skip first line because it contains headers ex. name,phone,email
	if [ "$skip" -eq 1 ]
	then	
		skip=0
		continue;
	fi
	
	# removes white spaces for better pattern comparison
	name=$(echo "$name" | xargs)
	phone=$(echo "$phone" | xargs)
	email=$(echo "$email" | xargs)
	
	# if name matches the pattern print details
	if [[ "$name" == *"$pattern"* ]]; then
		echo "$name $phone $email"
	fi


done < "$filename"
# < "$filename" feeds line by line input from file
