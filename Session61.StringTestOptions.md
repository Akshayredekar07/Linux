
# String Test Options

1. **`str1 = str2`** → Returns true if both strings are the same  
2. **`str1 != str2`** → Returns true if both strings are different  
3. **`-z str`** → Returns true if the string is empty  
4. **`-n str`** → Returns true if the string is not empty  
5. **`str1 > str2`** → Returns true if `str1` is alphabetically greater than `str2`  
6. **`str1 < str2`** → Returns true if `str1` is alphabetically less than `str2`  



## **Demo Program for String Comparison**

### **Script:**
```bash
#!/bin/bash
read -p "Enter First String:" str1
read -p "Enter Second String:" str2
if [ $str1 = $str2 ]; then
    echo "Both strings are equal"
elif [ $str1 \< $str2 ]; then
    echo "$str1 is less than $str2"
else
    echo "$str1 is greater than $str2"
fi
```

### **Note:**
- To prevent `<` from being interpreted as an input redirection operator, use the backslash (`\`) before it.

### **Example Output:**
```plaintext
Enter First String: Durga
Enter Second String: Durga
Both strings are equal

Enter First String: Apple
Enter Second String: Banana
Apple is less than Banana

Enter First String: Banana
Enter Second String: Apple
Banana is greater than Apple
```


## **Q13: Script to Check if the Login User is Root**

### **Script:**
```bash
#!/bin/bash
user=$(whoami)
if [ $user != "root" ]; then
    echo "Current user is not root and hence exiting"
    exit 1
fi

echo "The Five Current Running Processes Information"
echo "=============================================="
ps -ef | head -5
```

### **Example Output:**
```plaintext
Current user not root user and hence exiting

# When executed as root:
The Five Current Running Processes Information
UID        PID  PPID  C STIME TTY      TIME CMD
root         1     0  0 19:32 ?        00:00:03 /sbin/init splash
root         2     0  0 19:32 ?        00:00:00 [kthreadd]
root         3     2  0 19:32 ?        00:00:00 [rcu_gp]
root         4     2  0 19:32 ?        00:00:00 [rcu_par_gp]
```


## **Q14: Script to Test if the String is Empty or Not**

### **Script:**
```bash
#!/bin/bash
read -p "Enter Any String to test:" str
if [ -z "$str" ]; then
    echo "Provided input string is empty"
else
    echo "Provided input string is not empty"
    echo "Its length is: $(echo -n "$str" | wc -c)"
fi
```


# **Case Statement**

### **Definition:**
- When multiple options are available, using nested `if-else` statements can make code lengthy and less readable.
- To handle such scenarios, use a `case` statement.

### **Syntax:**
```bash
case $variable in
    option1 )
        action-1
        ;;
    option2 )
        action-2
        ;;
    option3 )
        action-3
        ;;
    * )
        default action
        ;;
esac
```

### **Notes:**
1. Spaces around the options are optional.  
2. `;;` is mandatory after each option except for the default option.  
3. The default option (`*`) can be placed anywhere in the `case` statement.  
4. If the default option is placed at the beginning, it will be executed for any input.  
