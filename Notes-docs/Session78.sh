#!/bin/bash

# Configuration
USER_DB="users.dat"
TEMP_FILE="temp.dat"

# Error codes
ERR_USER_EXISTS=1
ERR_PASSWORD_MISMATCH=2
ERR_USER_NOT_FOUND=3
ERR_INVALID_PASSWORD=4

# Helper functions
validate_user_exists() {
    local uid=$1
    grep -q "^$uid:" "$USER_DB" 2>/dev/null
    return $?
}

validate_credentials() {
    local uid=$1
    local pwd=$2
    grep -q "^$uid:$pwd:" "$USER_DB" 2>/dev/null
    return $?
}

print_separator() {
    echo
    echo
}

# Main functions
add_user() {
    # Create database file if it doesn't exist
    [ ! -f "$USER_DB" ] && touch "$USER_DB"
    
    echo "Please provide details to add user:"
    read -p "First Name: " fname
    read -p "Last Name: " lname
    read -p "User Id: " uid
    
    # Check if user already exists
    if validate_user_exists "$uid"; then
        echo "User Id: $uid already exists. We cannot add user."
        print_separator
        return $ERR_USER_EXISTS
    fi
    
    # Get and validate password
    read -s -p "Password: " pwd
    echo
    read -s -p "Retype Password: " cpwd
    echo
    
    if [ "$pwd" != "$cpwd" ]; then
        echo "Passwords are not matching. We cannot add user."
        print_separator
        return $ERR_PASSWORD_MISMATCH
    fi
    
    read -p "ZipCode: " zipcode
    
    # Add user to database
    echo "$uid:$pwd:$fname:$lname:$zipcode" >> "$USER_DB"
    echo "User Added Successfully"
    print_separator
}

search_user() {
    read -p "Enter User Id: " uid
    
    # Check if user exists
    if ! validate_user_exists "$uid"; then
        echo "User Id: $uid does not exist. Cannot search for this user."
        print_separator
        return $ERR_USER_NOT_FOUND
    fi
    
    read -s -p "Enter Password: " pwd
    echo
    
    # Validate credentials
    if ! validate_credentials "$uid" "$pwd"; then
        echo "Invalid Password. Cannot search for this user."
        print_separator
        return $ERR_INVALID_PASSWORD
    fi
    
    # Display user information
    local line=$(grep "^$uid:$pwd:" "$USER_DB")
    echo "The Complete information of the user is:"
    echo "User Id: $(echo "$line" | cut -d ":" -f1)"
    echo "Password: $(echo "$line" | cut -d ":" -f2)"
    echo "First Name: $(echo "$line" | cut -d ":" -f3)"
    echo "Last Name: $(echo "$line" | cut -d ":" -f4)"
    echo "Zip Code: $(echo "$line" | cut -d ":" -f5)"
    print_separator
}

change_password() {
    read -p "Enter User Id: " uid
    
    # Check if user exists
    if ! validate_user_exists "$uid"; then
        echo "User Id: $uid does not exist. Cannot change password."
        print_separator
        return $ERR_USER_NOT_FOUND
    fi
    
    read -s -p "Enter Current Password: " pwd
    echo
    
    # Validate credentials
    if ! validate_credentials "$uid" "$pwd"; then
        echo "Invalid Password. Cannot change password."
        print_separator
        return $ERR_INVALID_PASSWORD
    fi
    
    # Get user record and remove from database
    local record=$(grep "^$uid:$pwd:" "$USER_DB")
    grep -v "^$uid:$pwd:" "$USER_DB" > "$TEMP_FILE"
    mv "$TEMP_FILE" "$USER_DB"
    
    # Extract user information
    local fname=$(echo "$record" | cut -d ":" -f3)
    local lname=$(echo "$record" | cut -d ":" -f4)
    local zipcode=$(echo "$record" | cut -d ":" -f5)
    
    # Update password
    read -s -p "Enter New Password: " npwd
    echo
    read -s -p "Confirm New Password: " cnpwd
    echo
    
    if [ "$npwd" != "$cnpwd" ]; then
        # If new passwords don't match, restore the original entry
        echo "$record" >> "$USER_DB"
        echo "Passwords do not match. Password not updated."
        print_separator
        return $ERR_PASSWORD_MISMATCH
    fi
    
    # Add updated record
    echo "$uid:$npwd:$fname:$lname:$zipcode" >> "$USER_DB"
    echo "Password updated successfully"
    print_separator
}

delete_user() {
    read -p "Enter User Id: " uid
    
    # Check if user exists
    if ! validate_user_exists "$uid"; then
        echo "User Id: $uid does not exist. Cannot delete user."
        print_separator
        return $ERR_USER_NOT_FOUND
    fi
    
    read -s -p "Enter Password: " pwd
    echo
    
    # Validate credentials
    if ! validate_credentials "$uid" "$pwd"; then
        echo "Invalid Password. Cannot delete user."
        print_separator
        return $ERR_INVALID_PASSWORD
    fi
    
    # Remove user from database
    grep -v "^$uid:$pwd:" "$USER_DB" > "$TEMP_FILE"
    mv "$TEMP_FILE" "$USER_DB"
    echo "User Deleted Successfully"
    print_separator
}

show_all_users() {
    if [ ! -s "$USER_DB" ]; then
        echo "No users found in the database."
        print_separator
        return 0
    fi
    
    echo "All Users Information:"
    echo "----------------------"
    
    # Format output as a table with headers
    printf "%-15s %-20s %-20s %-10s\n" "User ID" "First Name" "Last Name" "Zip Code"
    printf "%-15s %-20s %-20s %-10s\n" "-------" "----------" "---------" "--------"
    
    while IFS=: read -r uid pwd fname lname zipcode; do
        printf "%-15s %-20s %-20s %-10s\n" "$uid" "$fname" "$lname" "$zipcode"
    done < "$USER_DB"
    
    print_separator
}

users_count() {
    local count=0
    [ -f "$USER_DB" ] && count=$(wc -l < "$USER_DB")
    echo "The Total Number of users: $count"
    print_separator
}

# Main menu
display_menu() {
    echo "----------------------------------------"
    echo "    User Management Application"
    echo "----------------------------------------"
    echo "1. Add User"
    echo "2. Search For User"
    echo "3. Change Password"
    echo "4. Delete User"
    echo "5. Show All Users"
    echo "6. Users Count"
    echo "7. Exit"
    echo "----------------------------------------"
}

# Main program
echo "Welcome to User Management Application"
echo "######################################"

while true; do
    display_menu
    read -p "Enter Your Choice [1-7]: " choice
    
    case $choice in
        1) add_user ;;
        2) search_user ;;
        3) change_password ;;
        4) delete_user ;;
        5) show_all_users ;;
        6) users_count ;;
        7) 
            echo "Thanks for using the application"
            exit 0 
            ;;
        *)
            echo "Invalid choice. Please try again."
            print_separator
            ;;
    esac
done