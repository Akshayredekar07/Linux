# **Project-4: User Management Application**

## **Bash Script**
```bash
#! /bin/bash

add_user() {
    if [ ! -e users.dat ]; then
        touch users.dat
    fi

    echo "Please Provide details to add user:"
    read -p "First Name: " fname
    read -p "Last Name: " lname
    read -p "User Id: " uid

    count=$(cat users.dat | cut -d ":" -f 1 | grep -w $uid | wc -l)
    if [ $count -ne 0 ]; then
        echo "User Id:$uid already exists, We cannot add user"
        echo
        return 1
    fi

    read -s -p "Password: " pwd
    echo
    read -p "Retype Password: " cpwd

    if [ $pwd != $cpwd ]; then
        echo "Passwords are not matching, We cannot add user"
        echo
        return 2
    fi

    read -p "ZipCode: " zipcode
    echo "$uid:$pwd:$fname:$lname:$zipcode" >> users.dat
    echo "User Added Successfully"
    echo
}

search_user() {
    read -p "Enter User Id: " uid
    count=$(cat users.dat | cut -d ":" -f1 | grep -w $uid | wc -l)

    if [ $count -eq 0 ]; then
        echo "User Id: $uid does not exist, Cannot Search for this user"
        echo
        return 3
    fi

    read -p "Enter Password: " pwd
    count=$(cat users.dat | grep -w $uid | cut -d ":" -f 2 | grep -w $pwd | wc -l)

    if [ $count -eq 0 ]; then
        echo "Invalid Password, Cannot Search for this user"
        echo
        return 4
    fi

    while read line; do
        fuid=$(echo $line | cut -d ":" -f1)
        fpwd=$(echo $line | cut -d ":" -f2)

        if [ $uid = $fuid -a $pwd = $fpwd ]; then
            echo "The Complete information of the user is:"
            echo "User Id: $(echo $line | cut -d ":" -f1)"
            echo "Password: $(echo $line | cut -d ":" -f2)"
            echo "First Name: $(echo $line | cut -d ":" -f3)"
            echo "Last Name: $(echo $line | cut -d ":" -f4)"
            echo "Zip Code: $(echo $line | cut -d ":" -f5)"
            echo
            break
        fi
    done < users.dat
}

change_password() {
    read -p "Enter User Id: " uid
    count=$(cat users.dat | cut -d ":" -f1 | grep -w $uid | wc -l)

    if [ $count -eq 0 ]; then
        echo "User Id: $uid does not exist, Cannot Change Password"
        echo
        return 3
    fi

    read -p "Enter Password: " pwd
    count=$(cat users.dat | grep -w $uid | cut -d ":" -f 2 | grep -w $pwd | wc -l)

    if [ $count -eq 0 ]; then
        echo "Invalid Password, Cannot Change Password"
        echo
        return 4
    fi

    while read line; do
        fuid=$(echo $line | cut -d ":" -f1)
        fpwd=$(echo $line | cut -d ":" -f2)

        if [ $uid = $fuid -a $pwd = $fpwd ]; then
            grep -v "$line" users.dat > temp.dat
            record=$line
            break
        fi
    done < users.dat

    mv temp.dat users.dat

    read -p "Enter New Password: " npwd
    uid=$(echo $record | cut -d ":" -f1)
    fname=$(echo $record | cut -d ":" -f3)
    lname=$(echo $record | cut -d ":" -f4)
    zipcode=$(echo $record | cut -d ":" -f5)

    echo "$uid:$npwd:$fname:$lname:$zipcode" >> users.dat
    echo "Password updated successfully"
    echo
}

delete_user() {
    read -p "Enter User Id: " uid
    count=$(cat users.dat | cut -d ":" -f1 | grep -w $uid | wc -l)

    if [ $count -eq 0 ]; then
        echo "User Id: $uid does not exist, Cannot Delete User"
        echo
        return 3
    fi

    read -p "Enter Password: " pwd
    count=$(cat users.dat | grep -w $uid | cut -d ":" -f 2 | grep -w $pwd | wc -l)

    if [ $count -eq 0 ]; then
        echo "Invalid Password, Cannot Delete User"
        echo
        return 4
    fi

    while read line; do
        fuid=$(echo $line | cut -d ":" -f1)
        fpwd=$(echo $line | cut -d ":" -f2)

        if [ $uid = $fuid -a $pwd = $fpwd ]; then
            grep -v "$line" users.dat > temp.dat
            break
        fi
    done < users.dat

    mv temp.dat users.dat
    echo "User Deleted Successfully"
    echo
}

show_all_users() {
    echo "All Users Information:"
    echo "----------------------"
    cat users.dat
    echo
}

users_count() {
    count=$(cat users.dat | wc -l)
    echo "The Total Number of users: $count"
    echo
}

echo "Welcome to User Management Application"
echo "######################################"

while [ true ]; do
    echo "1. Add User"
    echo "2. Search For User"
    echo "3. Change Password"
    echo "4. Delete User"
    echo "5. Show All Users"
    echo "6. Users Count"
    echo "7. Exit"

    read -p "Enter Your Choice [1|2|3|4|5|6|7]: " choice
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
            echo "Wrong choice... Try again"
            ;;
    esac
done
```


