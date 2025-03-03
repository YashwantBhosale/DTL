#!/bin/sh

MESSAGE="Hello world!"
echo $MESSAGE

# Program to swap two numbers without using third variable
echo "Enter two numbers: "
read num1
read num2

echo "Initial Values: " $num1 $num2

num1=$(($num1+$num2))
num2=$(($num1-$num2))
num1=$(($num1-$num2))

echo "After swapping: " $num1 $num2
