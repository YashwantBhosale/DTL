#!/bin/bash
# array variable in shell
# can hold multiple values in single variable# provide way of grouping a set of varialbes instead of creating a new name for each variable.

# scalar variables
NAME01="yash"
NAME02="dhruv"
NAME03="arya"

# instead we can use array variable for above
NAME[0]="yash"
NAME[1]="dhruv"
NAME[2]="arya"
NAME[3]="pratik"

echo "First element -> ${NAME[0]}"
echo "Second element -> ${NAME[1]}"
echo "Third element -> ${NAME[2]}"

# two ways to access all the elements of array
echo ${NAME[*]}
echo ${NAME[@]}

# importatnt difference
array_name=("one" "two three" "four")

# unquoted no difference same output
echo ${array_name[*]}
echo ${array_name[@]}
# output: one two three four

# quoted: big difference
for i in "${array_name[*]}"; do echo "$i"; done
# Output: one two three four (1 element)

for i in "${array_name[@]}"; do echo "$i"; done
# Output:
# one
# two three
# four  (3 elements)

