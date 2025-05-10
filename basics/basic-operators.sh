#!/bin/bash
# 1. Arithmetic operators

a=5
b=3
# 1) addition
val=`expr $a + $b`
echo "Addition: $val"
# rules to be considered
# 1. There must be spaces between operators and expressions. For example, 2&plus;2 is not correct; it should be written as 2 &plus; 2
# 2. The complete expression should be enclosed between , called the backtick.

# 2) subtraction
val=`expr $a - $b`
echo "Subtraction= $val"

# 3) multiplication
val=`expr $a \* $b`
echo "Multiplication= $val"

# 4) division
val=`expr $a / $b`
echo "Division= $val"

# 5) modulus
val=`expr $b % $a`
echo "Modulus= $val"

# 6) Equality
[ "$a" == "$b" ]
val=$? # exit status of last command
echo "is equal?: $val"

# safer way
if [ "$a" == "$b" ]; then
    echo "is equal?: yes"
else
    echo "is equal?: no"
fi

# it is very important to understand that the conditional expressions should be inside square braces with spaces around them
# for exp
# [ $a == $b ]

# also, we can use $() in following way
# val=$(command) -> val stores output of some bash "command"
# val=$((a + b)) is same as val=`expr $a + $b`
# 7) non equality

if [ "$a" != "$b" ]; then
	echo "unequal"
else
	echo "equal"
fi

# [ ]  vs [[ ]]
# [ ] is the basic test, works in all shells (POSIX)
# [[ ]] is Bash-specific, safer and supports more features

# [ ] needs careful quoting and doesn't support &&, ||, or regex
# [[ ]] doesn't need quotes and allows pattern matching and logical operators


# Integer comparison operators:
# -eq  : equal
# -ne  : not equal
# -lt  : less than
# -le  : less than or equal
# -gt  : greater than
# -ge  : greater than or equal

a=5
b=10

if [ "$a" -lt "$b" ]; then
    echo "$a is less than $b"
fi

if [ "$a" -ne "$b" ]; then
    echo "$a is not equal to $b"
fi

# string comparison (use =, !=, <, > inside [[ ]])
x="apple"
y="banana"

if [[ "$x" < "$y" ]]; then
    echo "$x comes before $y"
fi

if [[ "$x" != "$y" ]]; then
    echo "$x is not equal to $y"
fi

# more string operators
str1="hello"
str2="world"
empty=""

# Equal
if [ "$str1" = "$str2" ]; then
  echo "Strings are equal"
else
  echo "Strings are not equal"
fi

# Not equal
if [ "$str1" != "$str2" ]; then
  echo "Strings are different"
fi

# Check if string is empty
if [ -z "$empty" ]; then
  echo "String is empty"
fi

# Check if string is NOT empty
if [ -n "$str1" ]; then
  echo "String is not empty"
fi


a=5
b=10
str1="hello"
str2="world"

# AND (-a)
if [ "$a" -lt 10 -a "$b" -gt 5 ]; then
    echo "both conditions are true"
fi

# OR (-o)
if [ "$a" -eq 5 -o "$b" -eq 15 ]; then
    echo "at least one condition is true"
fi

# NOT (!)
if [ ! -z "$str1" ]; then
    echo "str1 is not empty"
fi

# Combined: NOT and AND
if [ ! -z "$str1" -a "$a" -gt 3 ]; then
    echo "str1 is not empty and a is greater than 3"
fi

# Combined: OR and AND
if [ "$a" -eq 5 -o "$b" -gt 15 -a "$str1" = "hello" ]; then
    echo "at least one OR condition is true, and the AND condition is true"
fi

# PENDING: File Test operators
