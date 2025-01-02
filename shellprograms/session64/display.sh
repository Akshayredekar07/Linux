#! /bin/bash
while [ true ]
do
    read -p "Enter File Name to Display content: " fname
    # Checking whether the file exists or not and whether it's a regular file
    if [ -f $fname ]; then
        echo "The content of $fname:"
        echo "----------------------"
        cat $fname
    else
        echo "$fname does not exist"
    fi
    
    read -p "Do you want to display content of another file [Yes|No]: " option
    case $option in
        [yY]|[Yy][eE][sS])
            continue
            ;;
        [nN]|[nN][oO])
            break
            ;;
    esac
done

echo "Thanks for using the application"
