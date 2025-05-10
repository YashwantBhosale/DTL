#!/bin/sh

# Variable names
# name of a variable can contain only:
# letters: a to z or A to Z
# numbers: 0-9
# underscore: _

# By convention, unix shell variables will have their name in UPPERCASE
MESSAGE="Hello world!"
echo $MESSAGE

# Read-Only variables
# shell provides a way to mark the variables as read-only
NAME="yashwant"
readonly NAME
# now, new value cannot be assigned to NAME.


# Program to swap two numbers without using third variable
echo "Enter two numbers: "
read num1
read num2

echo "Initial Values: " $num1 $num2

num1=$(($num1+$num2))
num2=$(($num1-$num2))
num1=$(($num1-$num2))

echo "After swapping: " $num1 $num2
