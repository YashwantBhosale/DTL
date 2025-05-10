#!/bin/bash

file="$1"
outputFile="contacts.vcf"

touch "contacts.vcf"
 > "contacts.vcf"

while IFS=',' read -r name phone email
do
	name=$(echo "$name" | xargs)
	phone=$(echo "$phone" | xargs)
	email=$(echo "$email" | xargs)
	
	echo "BEGIN:VCARD" >> "$outputFile"
	echo "VERSION:2.1">> "$outputFile"
	echo "FN:$name">> "$outputFile"
	echo "TEL:$phone">> "$outputFile"
	echo "EMAIL:$email">> "$outputFile"
	echo "END:VCARD">> "$outputFile"
	
done < "$file"
echo "done"
