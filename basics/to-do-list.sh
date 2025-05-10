#!/bin/bash

FILE="todo.txt"
if [ -f "$FILE" ]
then
	echo "file exists"
else
	touch "$FILE"
	echo "file created"
fi

display_menu() {
	echo "-----------------------------"
	echo "0. display"
	echo "1. append"
	echo "2. prepend"
	echo "3. add"
	echo "4. remove"
	echo "5. deduplicate"
	echo "6. sort"
	echo "7. exit"
	echo "-----------------------------"
}

while true
do
	display_menu
	read -p "option: " option
	case "$option" in
		0)
			echo "TODO List"
			cat "$FILE"
			;;
		1)
			read -p "item: " item
			echo "$item" >> "$FILE"
			echo "item appended successfully"
			;;
		2)
			read -p "item: " item
			touch "temp.txt"
			echo "$item" >> "temp.txt"
			cat "$FILE" >> "temp.txt"
			mv "temp.txt" "$FILE"
			;;
		3)
			read -p "item: " item
			read -p "index: " index
			sed -i "${index}i $item" "$FILE"
			;;		
		4)
			read -p "index: " index
			sed -i "${index}d" "$FILE"
			;;
		5)
			touch "temp.txt"
			awk '!seen[$0]++' "$FILE" > "temp.txt"
			mv "temp.txt" "$FILE"
			;;
		6)
			cat "$FILE" | sort
			;;
		7) 
			exit	
			;;
		*)
			echo "invalid option"
			;;
	esac
done
