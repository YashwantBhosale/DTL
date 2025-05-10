#!/bin/bash

# special varialbles
# $$ -> PID of current script
# $0 -> filename
# $n -> arguments with which script was invoked for ex. $1 - first argument, $2 - second argument, $3 - third argument
# $# -> the number of arguments supplied to a script
# $* -> all the arguments are double quoted
# $@ -> all the arguments are individually double quoted
# $? -> exit status of last command executed

echo $0
echo $#
echo $1 $2 $3
echo $*

# here each argument is enclosed within double quotes
for arg in "$@"; do
    echo "$arg"
done

echo ""

# here entire list of arguments is made as single string
for TOKEN in $*
do
   echo $TOKEN
done

# if the command looks like something like this
# ./script.sh 1 2 3 4
# then both the loops will give same output:
# 1
# 2
# 3
# 4
#
# but if the input looks like 
# ./script.sh one "two three" four
# then loop 1 output:
# one
# two three
# four

# loop 2 output:
# one
# two
# three
# four



# special thing about this loop is that it seperates strings based on some delimeter
# it is determined by IFS variable
# by default IFS=" \t\n"

# we can override IFS
IFS=:
list="a:b:c"
for item in $list; do
    echo "$item"
done
# Output: a  b  c
# It is always a good practice to restore old value of IFS once done.
old_IFS=$IFS
IFS=:
# do stuff
IFS=$old_IFS



