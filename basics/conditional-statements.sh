#!/bin/bash

a=3
b=4

# 1. if ... fi
if [[ $a == $b ]]; then
	echo "equal"
fi

# 2. if ... else ... fi
if [[ $a == $b ]]; then
	echo "equal"
else
	echo "unequal"
fi

# 3. if ... elif ... fi
if [ "$a" -gt 0 ]; then
	echo "positive"
elif [ "$a" -eq 0 ]; then
	echo "ZERO"
else
	echo "negative"
fi

# 4. case ... esac
echo "1. add"
echo "2. subtract"
echo "3. multiply"
echo "4. divide"

read -p "Choose option: " option

case "$option" in
	1) echo "addition selected"
		;;
	2) echo "subtraction selected"
		;;
	3) echo "multiplication selected"
		;;
	4) echo "division selected"
		;;
	*) echo "Invalid option! exiting"
esac
