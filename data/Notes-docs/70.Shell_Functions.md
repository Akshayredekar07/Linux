
## Shell Script Functions

### Introduction
If any group of commands are repeatedly required, it is not recommended to write these commands separately every time. Repeating the same code increases the length of the script and reduces readability. 

Instead, such repeated code can be defined inside a **function**, which can be called wherever required. A function is essentially a block of reusable commands.

### Advantages of Functions
1. **Reduces the length of the code.**
2. **Improves readability.**
3. **Enhances maintainability.**
4. **Promotes the DRY Principle.**  
   DRY → *Don't Repeat Yourself.*

---

### Defining a Function
There are two ways to define a function in a shell script:

**1st Way:**
```bash
function function_name() {
    commands
}
```

**2nd Way:**
```bash
function_name() {
    commands
}
```

---

### Calling a Function
To call a function, simply use its name followed by parameters (if required):  
```bash
function_name param1 param2 param3 ...
```

---

### Example 1: Function to Display a Wish Message
```bash
#! /bin/bash

# Defining a function
wish() {
    echo "Hello Friends... Good Evening"
}

# Calling the function
wish
wish
wish
```

**Output:**
```bash
durgasoft@durgasoft:~/scripts$ ./test.sh
Hello Friends... Good Evening
Hello Friends... Good Evening
Hello Friends... Good Evening
```

**Note:** A function must be defined before it is called.

---

### Example 2: Nested Function Calls
```bash
#! /bin/bash

# Defining functions
f1() {
    echo "I am in f1 function"
}

f2() {
    echo "I am in f2 function"
    f1
}

# Calling functions
f1
f2
```

**Output:**
```bash
durgasoft@durgasoft:~/scripts$ ./test.sh
I am in f1 function
I am in f2 function
I am in f1 function
```



## Functions with Parameters

Functions in shell scripts can accept parameters. These parameters can be accessed within the function using the following special variables:
- `$1` → First parameter
- `$2` → Second parameter
- `$@` → All parameters (as a space-separated string)
- `$*` → All parameters (similar to `$@`)
- `$#` → Total number of parameters
- `$0` → Name of the script (not the function)

---

### Example 1: Accessing Function Parameters
```bash
#! /bin/bash

function demo() {
    echo "First Parameter: $1"
    echo "Second Parameter: $2"
    echo "Third Parameter: $3"
    echo "Total Number of Parameters: $#"
    echo "All Parameters with @: $@"
    echo "All Parameters with *: $*"
    echo "Script Name: $0"
}

# Calling the function with arguments
demo 10 20 30 40 50
```

**Output:**
```bash
First Parameter: 10
Second Parameter: 20
Third Parameter: 30
Total Number of Parameters: 5
All Parameters with @: 10 20 30 40 50
All Parameters with *: 10 20 30 40 50
Script Name: /home/durga/scripts/test.sh
```

---

### Example 2: Function with Conditional Parameter Check
```bash
#! /bin/bash

wish() {
    if [ $# -eq 0 ]; then
        echo "Hello Guest Good Evening"
    else
        echo "Hello $1 Good Evening"
    fi
}

# Calling the function with and without arguments
wish
wish Durga
wish Ravi
```

**Output:**
```bash
Hello Guest Good Evening
Hello Durga Good Evening
Hello Ravi Good Evening
```

---

### Example 3: Arithmetic Operations with Function Parameters
```bash
#! /bin/bash

calc() {
    if [ $# -ne 2 ]; then
        echo "You should pass exactly 2 arguments"
    else
        a=$1
        b=$2
        echo "$a + $b = $((a+b))"
        echo "$a - $b = $((a-b))"
        echo "$a * $b = $((a*b))"
        echo "$a / $b = $((a/b))"
        echo
    fi
}

# Calling the function with different arguments
calc 10
calc 20 10
calc 200 100
calc 2000 1000
```

**Output:**
```bash
You should pass exactly 2 arguments
20 + 10 = 30
20 - 10 = 10
20 * 10 = 200
20 / 10 = 2

200 + 100 = 300
200 - 100 = 100
200 * 100 = 20000
200 / 100 = 2

2000 + 1000 = 3000
2000 - 1000 = 1000
2000 * 1000 = 2000000
2000 / 1000 = 2
```

---

### Example 4: Function to Print All Parameters
```bash
#! /bin/bash

parameter_printing() {
    if [ $# -eq 0 ]; then
        echo "No parameters passed to this function"
    else
        echo "All Passed Parameters are:"
        echo ".........................."
        for p in $@; do
            echo $p
        done
    fi
}

# Calling the function with and without arguments
parameter_printing
parameter_printing A B C D E
```

**Output:**
```bash
No parameters passed to this function
All Passed Parameters are:
..........................
A
B
C
D
E
```

---

