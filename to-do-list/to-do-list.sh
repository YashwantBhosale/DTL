#!/bin/bash
# write a shell script to manage a todo list from command line. The script should be able to add, remove, list,
# prepend, append, deduplicate todo items.

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

# TOTAL_ITEMS=$(cat todo.txt | wc -l)

add_item() {
    read -p "Enter todo item: " item
    read -p "Enter index: " index

    total_lines=$(wc -l <todo.txt)
    if [ "$index" -le "$total_lines" ]; then
        sed -i "${index}i\\$item" todo.txt
    else
        echo "$item" >>todo.txt
        echo "Index too large. Appended to the end of the list."
    fi
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
    sort todo.txt >temp.txt
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
    echo $item >temp.txt
    cat todo.txt >>temp.txt
    mv temp.txt todo.txt
}

clear() {
    touch temp.txt
    mv temp.txt todo.txt
}

print_todo() {
    echo ""
    echo "--------------"
    cat todo.txt
    echo "--------------"
    echo ""
}

while true; do
    display_menu
    read -p "Enter your choice: " choice
    case $choice in
    1)
        append
        ;;
    2)
        prepend
        ;;
    3)
        print_todo
        ;;
    4)
        add_item
        ;;
    5)
        remove_item
        ;;
    6)
        sort_list
        ;;
    7)
        deduplicate_items
        ;;
    8)
        clear
        ;;
    9)
        break
        ;;
    *)
        echo "Invalid choice"
        ;;
    esac
done
