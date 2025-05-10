#!/bin/bash
# Write a shell program to convert a CSV file of contacts, into a VCF file.

# format of csv file of contacts
# name,phone,email

# vcf format (virtual contact format)
# BEGIN:VCARD
# VERSION:2.1
# FN:fullName
# TEL:phoneNo
# EMAIL:email
# END:VCARD

if [ "$#" -ne 1 ]
then
	echo "invalid number of arguments"
	exit 1
fi

filename="$1"

if [[ "$filename" != *".csv" ]]
then
	echo "file should be csv"
	exit 2
fi

skip=1

touch "contacts.vcf"

while IFS=',' read -r name phone email
do
	if [ "$skip" -eq 1 ]
	then
		skip=0
		continue
	fi
	
	name=$(echo "$name" | xargs)
    phone=$(echo "$phone" | xargs)
    email=$(echo "$email" | xargs)

	echo "BEGIN:VCARD" >> "contacts.vcf"
	echo "VERSION:2.1" >> "contacts.vcf"
	echo "FN:$name" >> "contacts.vcf"
	echo "TEL:$phone" >> "contacts.vcf"
	echo "EMAIL:$email" >> "contacts.vcf"
	echo "END:VCARD" >> "contacts.vcf"

	echo "$name $phone $email -> added to vcf file"
done < "$filename"
