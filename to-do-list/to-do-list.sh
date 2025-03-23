#!/bin/bash
# write a shell script to manage a todo list from command line. The script should be able to add, remove, list,
# prepend, append, deduplicate todo items.

display_menu() {
    echo "1. Add a todo item"
    echo "2. Remove a todo item"
    echo "3. List all todo items"
    echo "4. Prepend a todo item"
    echo "5. Append a todo item"
    echo "6. sort todo items"
    echo "7. Deduplicate todo items"
    echo "8. Exit"
}

# TOTAL_ITEMS=$(cat todo.txt | wc -l)

add_item() {
    read -p "Enter todo item: " item
    echo "$item" >>todo.txt
    # TOTAL_ITEMS=$(($TOTAL_ITEMS + 1))
}

# ref: https://phoenixnap.com/kb/sed-delete-line
remove_item() {
    read -p "Enter index of todo item to remove: " index
    sed -i "${index}d" todo.txt # delete ith line
}

# ref: https://unix.stackexchange.com/questions/30173/how-to-remove-duplicate-lines-inside-a-text-file
deduplicate_items() {
    awk '!seen[$0]++' todo.txt >temp.txt
    mv temp.txt todo.txt
}

# Not storing sorted list as it doesn't make sense
sort_list() {
    sort todo.txt > temp.txt
    cat temp.txt
    rm temp.txt
}

append() {
    read -p "Enter todo item to append: " item
    echo $item >>todo.txt
}

# ref: https://www.cyberciti.biz/faq/bash-prepend-text-lines-to-file/
prepend() {
    read -p "Enter todo item to prepend: " item
    echo $item > temp.txt
    cat todo.txt >> temp.txt
    mv temp.txt todo.txt
}

while true; do
    display_menu
    read -p "Enter your choice: " choice
    case $choice in
    1)
        add_item;;
    2)
        remove_item;;
    3)
        cat todo.txt;;
    4)
        prepend;;
    5) 
        append;;
    6)
        sort_list;;
    7)
        deduplicate_items;;
    8)
        break;;
    *)
        echo "Invalid choice";;
    esac
done
