#!/bin/bash

# 1. While loop

# syntax:
# while command
# do
#	statement(s) to be executed if command is true
# done

# simple loop to print from 1 to 10
echo "1. while loop"
echo "simple loop to print numbers from 1 to 10"
a=1

while [ "$a" -le 10 ]
do
	echo "$a"
	a=$((a+1))
done
echo ""

# 2. For loop
echo "2. for loop"
echo "for loop to span through given list of numbers"
for var in 0 1 2 3 4 5 6
do
	echo $var
done

#!/bin/bash

# loop over words
echo "looping over words:"
for word in apple banana cherry; do
  echo "word: $word"
done

echo ""

# loop over .txt files
echo "looping over .txt files:"
for file in *.txt; do
  echo "found file: $file"
done

echo ""

# loop over lines in users.txt
echo "looping over lines in users.txt:"
for user in $(cat users.txt); do
  echo "user: $user"
done

echo ""

# loop over script arguments
echo "looping over script arguments:"
for arg in "$@"; do
  echo "argument: $arg"
done

echo ""

# c-style numeric loop
echo "numeric loop from 0 to 4:"
for ((i = 0; i < 5; i++)); do
  echo "number: $i"
done
echo ""

# 3. The Until loop
# while loop but until the condition is false

echo "3. until loop"
a=1

until [ "$a" -gt 10 ]
do
	echo $a
	a=$((a+1))
done
echo ""

# 4. the select loop
# syntax:
# select var in word1 word2 ... wordN
# do
#	statement(s) to be executed for every word
# done

# Here var is the name of a variable and word1 to wordN are sequences of characters separated by spaces (words). Each time the for loop executes, the value of the variable var is set to the next word in the list of words, word1 to wordN.

# For every selection, a set of commands will be executed within the loop. 

select DRINK in tea cofee water juice appe all none
do
   case $DRINK in
      tea|cofee|water|all) 
         echo "Go to canteen"
         ;;
      juice|appe)
         echo "Available at home"
      ;;
      none) 
         break 
      ;;
      *) echo "ERROR: Invalid selection" 
      ;;
   esac
done
