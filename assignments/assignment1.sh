#!/bin/bash

# Write a shell program which reads a set of unspecified count of numbers and prints their
# sum and average

#!/bin/bash

echo "enter numbers one per line (press Ctrl+D to finish):"

sum=0
count=0

while read num; do
	# skip the empty lines	
	if [ -z "$num" ]
	then 
		continue
	fi

	sum=$(echo "$sum + $num" | bc) # sum the numbers using bc this could be done using regular addition as well
	count=$((count + 1))
done

if [ "$count" -gt 0 ]; then
	avg=$(echo "scale=2; $sum / $count" | bc)
	echo "sum: $sum"
	echo "average: $avg"
else
	echo "no valid input received."
fi

