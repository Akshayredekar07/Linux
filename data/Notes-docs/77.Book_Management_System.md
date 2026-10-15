```sh
#!/bin/bash

declare -a books    
i=0                 

# Add Books
add_book() {
    read -p "Enter the name of the book to add: " newBook
    if [[ -z "$newBook" ]]; then
        echo "Book name cannot be empty. Please try again."
        return
    fi

    for book in "${books[@]}"; do
        if [[ "${book,,}" == "${newBook,,}" ]]; then
            echo "The book '$newBook' already exists in the library."
            return
        fi
    done

    books[i]="$newBook"
    ((i++))  # Increment the book index
    echo "'$newBook' has been added successfully."
    echo
}

# Delete Book
delete_book() {
    read -p "Enter the name of the book to delete: " bookToDelete
    if [[ -z "$bookToDelete" ]]; then
        echo "Book name cannot be empty. Please try again."
        return
    fi

    local found=false
    for index in "${!books[@]}"; do
        if [[ "${books[$index],,}" == "${bookToDelete,,}" ]]; then
            unset books[$index]
            echo "'$bookToDelete' has been deleted successfully."
            found=true
            break
        fi
    done

    if [[ "$found" == false ]]; then
        echo "'$bookToDelete' was not found in the library."
    fi
    echo
}

# List all available books
list_books() {
    if [[ ${#books[@]} -eq 0 ]]; then
        echo "No books are available in the library."
        echo
        return
    fi

    echo "List of Available Books:"
    echo "------------------------"
    local index=1
    for book in "${books[@]}"; do
        echo "$index. $book"
        ((index++))
    done
    echo
}

# Search books
search_book() {
    read -p "Enter the name of the book to search: " searchBook
    if [[ -z "$searchBook" ]]; then
        echo "Book name cannot be empty. Please try again."
        return
    fi

    local found=false
    for book in "${books[@]}"; do
        if [[ "${book,,}" == *"${searchBook,,}"* ]]; then
            echo "Found: $book"
            found=true
        fi
    done

    if [[ "$found" == false ]]; then
        echo "No matching books found for '$searchBook'."
    fi
    echo
}

# Main Program
echo "Welcome to the DURGASOFT Book Management Application"
echo "###################################################"

# Infinite loop for user operations
while :; do
    echo "Available Operations: add | delete | list | search | exit"
    read -p "Enter the operation you want to perform: " option
    case $option in
        add)
            add_book
            ;;
        delete)
            delete_book
            ;;
        list)
            list_books
            ;;
        search)
            search_book
            ;;
        exit)
            echo "Thank you for using the application.!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            echo
            ;;
    esac
done

```