#!/bin/bash

# Global Variables
declare -a books    # Array to hold book titles
i=0                 # Index for book array

# Function to add a book
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

# Function to delete a book
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

# Function to list all books
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

# Function to edit a book name
edit_book() {
    read -p "Enter the name of the book you want to edit: " bookToEdit
    local found=false

    for index in "${!books[@]}"; do
        if [[ "${books[$index],,}" == "${bookToEdit,,}" ]]; then
            read -p "Enter the new name for the book: " newBookName
            if [[ -z "$newBookName" ]]; then
                echo "Book name cannot be empty. Edit operation cancelled."
                return
            fi
            books[$index]="$newBookName"
            echo "'$bookToEdit' has been renamed to '$newBookName'."
            found=true
            break
        fi
    done

    if [[ "$found" == false ]]; then
        echo "'$bookToEdit' was not found in the library."
    fi
    echo
}

# Function to search for a book
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

# Function to save books to a file
save_books() {
    local filename="books.txt"
    printf "%s\n" "${books[@]}" > "$filename"
    echo "Books have been saved to '$filename'."
    echo
}

# Function to load books from a file
load_books() {
    local filename="books.txt"
    if [[ -f "$filename" ]]; then
        mapfile -t books < "$filename"
        i=${#books[@]}  # Update the index to match the loaded books
        echo "Books have been loaded from '$filename'."
    else
        echo "No saved book file found. Starting with an empty library."
    fi
    echo
}

# Function to sort books alphabetically
sort_books() {
    if [[ ${#books[@]} -eq 0 ]]; then
        echo "No books are available to sort."
        echo
        return
    fi

    books=($(for book in "${books[@]}"; do echo "$book"; done | sort))
    echo "Books have been sorted alphabetically."
    echo
}

# Function to count total books
count_books() {
    echo "Total number of books: ${#books[@]}"
    echo
}

# Function to add multiple books at once
add_multiple_books() {
    read -p "Enter the names of books to add (separated by commas): " bookList
    IFS=',' read -ra newBooks <<< "$bookList"
    for newBook in "${newBooks[@]}"; do
        newBook=$(echo "$newBook" | xargs)  # Trim spaces
        if [[ -n "$newBook" ]]; then
            books[i]="$newBook"
            ((i++))
        fi
    done
    echo "Books have been added successfully."
    echo
}

# Function to clear all books
clear_books() {
    read -p "Are you sure you want to delete all books? [y/N]: " confirmation
    if [[ "$confirmation" =~ ^[Yy]$ ]]; then
        books=()
        i=0
        echo "All books have been deleted."
    else
        echo "Operation cancelled."
    fi
    echo
}

# Function to suggest a random book
suggest_book() {
    if [[ ${#books[@]} -eq 0 ]]; then
        echo "No books available for suggestion."
        echo
        return
    fi

    local randomIndex=$((RANDOM % ${#books[@]}))
    echo "Suggested book: ${books[$randomIndex]}"
    echo
}

# Main Program
echo "Welcome to the DURGASOFT Book Management Application"
echo "###################################################"
load_books  # Load books from file at startup

while :; do
    echo "Available Operations: add | add_multiple | delete | list | edit | search | sort | count | clear | suggest | save | exit"
    read -p "Enter the operation you want to perform: " option
    case $option in
        add)
            add_book
            ;;
        add_multiple)
            add_multiple_books
            ;;
        delete)
            delete_book
            ;;
        list)
            list_books
            ;;
        edit)
            edit_book
            ;;
        search)
            search_book
            ;;
        sort)
            sort_books
            ;;
        count)
            count_books
            ;;
        clear)
            clear_books
            ;;
        suggest)
            suggest_book
            ;;
        save)
            save_books
            ;;
        exit)
            echo "Thank you for using the application. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            echo
            ;;
    esac
done
