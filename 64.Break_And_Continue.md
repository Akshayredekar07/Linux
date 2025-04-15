### **Break Statement**
- The `break` statement is used to terminate the loop execution prematurely based on a specific condition.

---

### **Example 1: Breaking a Loop at a Certain Condition**

```bash
#!/bin/bash
i=1
while [ "$i" -le 10 ]
do
  if [ "$i" -eq 5 ]; then
    break
  fi
  echo "$i"
  i=$((i + 1))
done
```

**Output:**
```
1
2
3
4
```

**Explanation:**
- The loop iterates from 1 to 10, but when the value of `i` reaches 5, the `break` statement terminates the loop.

---

### **Example 2: Real-Time Digital Clock with Exit Condition**

```bash
#!/bin/bash
while [ true ]
do
  clear
  printf "\n\n\n\n\n\n\t\t\t\t$(date +%H:%M:%S)"
  sleep 1
  h=$(date +%H)
  m=$(date +%M)
  if [ "$h" -eq 20 ] && [ "$m" -eq 35 ]; then
    break
  fi
done
```

**Explanation:**
- This script displays a real-time digital clock.
- The `break` statement stops the script when the system clock reaches **20:35** (8:35 PM).

---

### Notes:
1. **Condition Groups:** Use `[ condition ]` with `-a` or `&&` for combining conditions.
2. **`clear` Command:** Clears the terminal for a clean display during each iteration.
3. **`sleep` Command:** Pauses the loop for 1 second to update the clock.


---

### **Continue Statement**
The `continue` statement is used to skip the current iteration of a loop and continue with the next iteration.

#### Example 1:
```bash
#! /bin/bash
i=0
while [ $i -lt 10 ]
do
 let i++
 if [ $((i%2)) -eq 0 ]; then
   continue
 fi
 echo $i
done
```

**Output:**
```
1
3
5
7
9
```

### **Script to Read File Name and Display its Content**
This script reads a file name from the user, checks if the file exists, and displays its content. It also allows the user to display the content of another file or exit the program.

```bash
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
```

### **Explanation:**
- The script continuously asks the user for a file name and checks whether it exists. If the file exists, it displays its content using `cat`.
- After displaying the content, it asks whether the user wants to check another file. If the user types "Yes" or "y" (in various forms), the loop continues with the `continue` statement. If the user types "No" or "n", the loop breaks, and the program exits.
- If the file doesn't exist, the script notifies the user and asks again.

- Use of `continue` to skip the next iteration and `break` to exit the loop based on user input.

---

### 1. Write a Script that Reads a String as Input and finds its Reverse?
### 2. Write a Script that performs Reverse of a given String?
```bash
#! /bin/bash
read -p "Enter any string to find reverse: " str   # Step 1: Read input string
len=$( echo -n $str | wc -c )   # Step 2: Calculate the length of the string
output=""  # Step 3: Initialize an empty string to store the reversed string

while [ $len -gt 0 ]   # Step 4: Loop until the length becomes 0
do
    ch=$( echo -n $str | cut -c $len )   # Step 5: Extract the character at the current position
    output=$output$ch   # Step 6: Append the character to the output string
    let len--   # Step 7: Decrement the length by 1 to move to the previous character
done

echo "The Original String: $str"   # Step 8: Print the original string
echo "The Reversed String: $output"   # Step 9: Print the reversed string
```

