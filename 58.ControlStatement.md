## Control Statements

Control statements are used to direct the flow of execution in a script. The primary control statements in UNIX/Linux are:

1. **if statement**  
2. **case statement**  
3. **while loop**  
4. **for loop**  
5. **until loop**  
6. **break**  
7. **continue**  
8. **exit**



### 1. `if` Statement
The `if` statement evaluates a condition and executes code blocks based on whether the condition is `true` or `false`.

### Types of `if` Statements
1. **Simple if**  
2. **if-else**  
3. **Nested if**  
4. **Ladder if**



### Simple `if`
The `simple if` statement executes a block of code only if the condition is true.

**Syntax:**
```bash
if [ condition ]
then
    action
fi
```
If the condition evaluates to `true`, the action will be executed.

**Example (Q1):**  
Write a script to read a name from the user and display a special message if the name is "pranita."
```bash
#! /bin/bash

read -p "Enter Your Name:" name

if [ $name = "pranita" ]
then
    echo "Hello pranita Very Good Evening"
fi

echo "How are you"
```

**Execution:**
```bash
durgasoft@durgasoft:~/scripts$ ./test.sh
Enter Your Name:durga
How are you

durgasoft@durgasoft:~/scripts$ ./test.sh
Enter Your Name:pranita
Hello pranita Very Good Evening
How are you
```

**Note:**  
- `x=10` → Assignment  
- `x = 10` → Comparison (incorrect syntax, spaces matter in shell scripting)

---

### `if-else`
The `if-else` statement executes one block of code if the condition is true, and another block of code if the condition is false.

**Syntax:**
```bash
if [ condition ]
then
    action if condition is true
else
    action if condition is false
fi
```

### Nested `if`
The `nested if` allows embedding an `if` statement inside another `if` statement.

**Syntax:**
```bash
if [ condition ]
then
    # Outer condition is true
    if [ condition ]
    then
        # Inner condition is true
        action
    else
        # Inner condition is false
        action
    fi
else
    # Outer condition is false
    action
fi
```


###  Ladder `if`
The `ladder if` is used for evaluating multiple conditions sequentially.

**Syntax:**
```bash
if [ condition ]
then
    action-1
elif [ condition ]
then
    action-2
elif [ condition ]
then
    action-3
else
    action for all other cases
fi
```

### Q2 Write a Script to Find the Greater of 2 Numbers

```bash
#! /bin/bash  
read -p "Enter First Number:" a 
read -p "Enter Second Number:" b  

if [ $a -gt $b ] 
then
    echo "Greater Number is:$a"
else
    echo "Greater Number is:$b"
fi
```

**Example Output:**
```bash
durgasoft@durgasoft:~/scripts$ test.sh 
Enter First Number:10 
Enter Second Number:20 
Greater Number is:20 

durgasoft@durgasoft:~/scripts$ test.sh 
Enter First Number:20 
Enter Second Number:10 
Greater Number is:20 

durgasoft@durgasoft:~/scripts$ test.sh 
Enter First Number:-10 
Enter Second Number:-20 
Greater Number is:-10
```

### Q3 Write a Script to Check Whether Numbers Are Equal or Not  
If the Numbers Are Not Equal, Print the Greater Number.

```bash
#! /bin/bash  
read -p "Enter First Number:" a 
read -p "Enter Second Number:" b  

if [ $a -eq $b ] 
then
    echo "Both Numbers are equal"
elif [ $a -gt $b ] 
then
    echo "First Number is greater than Second Number"
else
    echo "First Number is less than Second Number"
fi
```



### Write a Script to Find the Greater of 3 Numbers

**1st Way:**
```bash
#! /bin/bash  
read -p "Enter First Number:" a 
read -p "Enter Second Number:" b 
read -p "Enter Third Number:" c  

if [ $a -gt $b ] 
then
    if [ $a -gt $c ] 
    then
        echo "The Greater Number:$a"
    else
        echo "The Greater Number:$c"
    fi
elif [ $b -gt $c ] 
then
    echo "The Greater Number:$b"
else
    echo "The Greater Number:$c"
fi
```

**2nd Way:**
```bash
#! /bin/bash  
read -p "Enter First Number:" a 
read -p "Enter Second Number:" b 
read -p "Enter Third Number:" c  

if [ $a -gt $b -a $a -gt $c ] 
then
    echo "The Greater Number: $a"
elif [ $b -gt $c ] 
then
    echo "The Greater Number: $b"
else
    echo "The Greater Number: $c"
fi
```


### WAS: Check Whether a Student is Pass or Fail Based on 3 Subject Marks  
If Any Subject Marks Are Less Than 35, the Status is Fail.

**1st Way:**
```bash
#! /bin/bash  
read -p "Enter First Subject Marks:" a 
read -p "Enter Second Subject Marks:" b 
read -p "Enter Third Subject Marks:" c  

if [ $a -lt 35 ] 
then
    echo "Student Failed"
elif [ $b -lt 35 ] 
then
    echo "Student Failed"
elif [ $c -lt 35 ] 
then
    echo "Student Failed"
else
    echo "Result is Pass"
fi
```

**2nd Way:**
```bash
#! /bin/bash  
read -p "Enter First Subject Marks:" a 
read -p "Enter Second Subject Marks:" b 
read -p "Enter Third Subject Marks:" c  

if [ $a -ge 35 -a $b -ge 35 -a $c -ge 35 ] 
then
    echo "Result is Pass"
else
    echo "Result is Fail"
fi
```

---

### The Funniest Example with if-else

```bash
#! /bin/bash  
read -p "Enter Your Favourite Brand:" brand  

if [ $brand = "KF" ] 
then
    echo "It is Children's Brand"
elif [ $brand = "KO" ] 
then
    echo "It is not that much Kick"
elif [ $brand = "RC" ] 
then
    echo "It is too light"
elif [ $brand = "FO" ] 
then
    echo "Buy One Get One FREE"
else
    echo "Other Brands are not recommended"
fi
```

**Example Output:**
```bash
durgasoft@durgasoft:~/scripts$ ./test.sh 
Enter Your Favourite Brand:KF 
It is Children's Brand

durgasoft@durgasoft:~/scripts$ ./test.sh 
Enter Your Favourite Brand:KO 
It is not that much Kick

durgasoft@durgasoft:~/scripts$ ./test.sh 
Enter Your Favourite Brand:RC 
It is too light

durgasoft@durgasoft:~/scripts$ ./test.sh 
Enter Your Favourite Brand:FO 
Buy One Get One FREE

durgasoft@durgasoft:~/scripts$ ./test.sh 
Enter Your Favourite Brand:KALYANI 
Other Brands are not recommended
```