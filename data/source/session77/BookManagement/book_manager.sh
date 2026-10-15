#!/bin/bash

# Load Configuration
source config.cfg

# Declare Associative Array for Books
declare -A books

# Helper Functions
validate_input() {
    if [[ -z "$1" ]]; then
        echo "Input cannot be empty. Please try again."
        return 1
    fi
    return 0
}

log_action() {
    local action="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $action" >> "$LOG_FILE"
}

find_book_index() {
    local searchTerm="$1"
    for book in "${!books[@]}"; do
        if [[ "${book,,}" == "${searchTerm,,}" ]]; then
            echo "$book"
            return 0
        fi
    done
    return 1  # Book not found
}

# Core Functions
add_book() {
    read -p "Enter the name of the book to add: " newBook
    validate_input "$newBook" || return
    if [[ -n "${books[$newBook]}" ]]; then
        echo "The book '$newBook' already exists in the library."
        return
    fi
    books["$newBook"]=""
    echo "'$newBook' has been added successfully."
    log_action "Added book: $newBook"
}

add_multiple_books() {
    read -p "Enter the names of books to add (separated by commas): " bookList
    IFS=',' read -ra newBooks <<< "$bookList"
    
    for newBook in "${newBooks[@]}"; do
        newBook=$(echo "$newBook" | xargs)  # Trim spaces
        if [[ -n "$newBook" ]]; then
            if [[ -n "${books[$newBook]}" ]]; then
                echo "The book '$newBook' already exists in the library."
            else
                books["$newBook"]=""
                echo "'$newBook' has been added successfully."
                log_action "Added book: $newBook"
            fi
        fi
    done
    echo
}

delete_book() {
    read -p "Enter the name of the book to delete: " bookToDelete
    validate_input "$bookToDelete" || return
    if [[ -n "${books[$bookToDelete]}" ]]; then
        unset books["$bookToDelete"]
        echo "'$bookToDelete' has been deleted successfully."
        log_action "Deleted book: $bookToDelete"
    else
        echo "'$bookToDelete' not found in the library."
    fi
}

list_books() {
    if [[ ${#books[@]} -eq 0 ]]; then
        echo "No books are available in the library."
        return
    fi
    echo "List of Available Books:"
    echo "------------------------"
    local index=1
    for book in "${!books[@]}"; do
        echo "$index. $book"
        ((index++))
    done
}

search_book() {
    read -p "Enter the name of the book to search: " searchBook
    validate_input "$searchBook" || return
    local found=false
    if grep -iq "$searchBook" "$SAVE_FILE" 2>/dev/null; then
        grep -i "$searchBook" "$SAVE_FILE"
        found=true
    fi

    if [[ "$found" == false ]]; then
        echo "No matching books found for '$searchBook'."
    fi
}

sort_books() {
    if [[ ${#books[@]} -eq 0 ]]; then
        echo "No books available to sort."
        return
    fi
    books=($(for book in "${!books[@]}"; do echo "$book"; done | sort))
    echo "Books have been sorted alphabetically."
    log_action "Sorted books alphabetically."
}

save_books() {
    printf "%s\n" "${!books[@]}" > "$SAVE_FILE"
    echo "Books have been saved to '$SAVE_FILE'."
    log_action "Saved books to $SAVE_FILE."
}

load_books() {
    if [[ -f "$SAVE_FILE" ]]; then
        while IFS= read -r book; do
            books["$book"]=""
        done < "$SAVE_FILE"
        echo "Books have been loaded from '$SAVE_FILE'."
    else
        echo "No saved book file found. Starting with an empty library."
    fi
}

suggest_book() {
    if [[ ${#books[@]} -eq 0 ]]; then
        echo "No books available for suggestion."
        return
    fi
    local randomBook=$(shuf -n 1 -e "${!books[@]}")
    echo "Suggested book: $randomBook"
}

clear_books() {
    read -p "Are you sure you want to delete all books? [y/N]: " confirmation
    if [[ "$confirmation" =~ ^[Yy]$ ]]; then
        books=()
        echo "All books have been deleted."
        log_action "Cleared all books."
    else
        echo "Operation cancelled."
    fi
}

count_books() {
    echo "Total number of books: ${#books[@]}"
}

clear_screen() {
    if command -v cls >/dev/null 2>&1; then
        cls  # If running on Windows
    else
        clear  # If running on Unix/Linux
    fi
}

help_menu() {
    echo "Available Commands:"
    echo "1. Add       - Add a new book to the library"
    echo "2. Delete    - Delete a book from the library"
    echo "3. List      - List all books in the library"
    echo "4. Search    - Search for a book by name"
    echo "5. Sort      - Sort books alphabetically"
    echo "6. Suggest   - Get a random book suggestion"
    echo "7. Save      - Save books to a file"
    echo "8. Load      - Load books from a file"
    echo "9. Clear     - Clear all books"
    echo "10. Count    - Display total number of books"
    echo "11. Clear Screen (cls) - Clear the terminal screen"
    echo "12. Exit     - Exit the application"
}

# Main Program
echo "Welcome to the Optimized Book Management Application"
echo "###################################################"
load_books

while :; do
    echo "Choose an operation:"
    select option in "Add" "Add Multiple" "Delete" "List" "Search" "Sort" "Suggest" "Save" "Clear" "Count" "Clear Screen" "Help" "Exit"; do
        case $option in
            "Add")
                add_book
                break
                ;;
            "Add Multiple")
                add_multiple_books
                break
                ;;
            "Delete")
                delete_book
                break
                ;;
            "List")
                list_books
                break
                ;;
            "Search")
                search_book
                break
                ;;
            "Sort")
                sort_books
                break
                ;;
            "Suggest")
                suggest_book
                break
                ;;
            "Save")
                save_books
                break
                ;;
            "Clear")
                clear_books
                break
                ;;
            "Count")
                count_books
                break
                ;;
            "Clear Screen")
                clear_screen
                break
                ;;
            "Help")
                help_menu
                break
                ;;
            "Exit")
                echo "Thank you for using the application. Goodbye!"
                exit 0
                ;;
            *)
                echo "Invalid option. Try again."
                ;;
        esac
    done
done

