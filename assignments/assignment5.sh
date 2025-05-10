#!/bin/bash
# write a shell script to manage a todo list from command line. The script should be able to add, remove, list,
# prepend, append, deduplicate todo items.

# for simpler implementation ~ /calculator/calculator.sh

display_menu() {
    echo ""
    echo "------------------------------"
    echo "1. Append a todo item"
    echo "2. Prepend a todo item"
    echo "3. List all todo items"
    echo "4. Add a todo item"
    echo "5. Remove a todo item"
    echo "6. sort todo items"
    echo "7. Deduplicate todo items"
    echo "8. Clear list"
    echo "9. Exit"
    echo "------------------------------"
    echo ""
}

FILENAME="TODO.txt"
touch "$FILENAME"

append_items() {
	old_ifs="$IFS"
	IFS=','	
	for ITEM in "$@"
	do
		ITEM=$(echo "$ITEM" | xargs)	
		echo "$ITEM" >> "$FILENAME"
	done
	IFS="$old_ifs"
}

prepend_items() {
	touch "temp.txt"
	for ITEM in "$@"
	do
		ITEM=$(echo "$ITEM" | xargs)
		echo "$ITEM" >> "temp.txt"
	done
	cat "$FILENAME" >> "temp.txt"
	mv "temp.txt" "$FILENAME"
}

add_item() {
	read -p "Enter item: " item
	read -p "Enter index of the item: " index

	sed -i "${index}i $item" "$FILENAME"
}

remove_item() {
	read -p "Enter index of the item: " index

	sed -i "${index}d" "$FILENAME" 
}

sort_items() {
	cat "$FILENAME" | sort
}

deduplicate_items() {
	awk '!seen[$0]++' "$FILENAME" > "temp.txt"
	mv "temp.txt" "$FILENAME"
}


while true; do
	display_menu
	read -p "Choose option: " option

	case "$option" in
		1)
			read -p "Enter items seperated by comma: " input
			IFS=',' read -ra items <<< "$input"
			append_items "${items[@]}"
		;;
		2)
			read -p "Enter items seperated by comma: " input
			IFS=',' read -ra items <<< "$input"
			prepend_items "${items[@]}"
		;;
		3)
			echo ""
			echo "*******************************************"
			echo ""
			cat "$FILENAME"
			echo ""
			echo "*******************************************"
			echo ""
		;;
		4)
			add_item
		;;
		5) 
			remove_item
		;;
		6) 
			sort_items	
		;;
		7)
			deduplicate_items
		;;
		8)
			rm "$FILENAME"
			touch "$FILENAME"
		;;
		9) exit 0
		;;
	esac
	
done
