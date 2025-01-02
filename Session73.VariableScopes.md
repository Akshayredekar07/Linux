
## Variable Scope in Shell Scripting

### Global Variables
By default, every variable in a shell script is global, meaning it can be accessed anywhere within the script. However, a variable must be declared before it is used.

**Example 1:**
```bash
#! /bin/bash
f1() {
    echo "x value: $x"
}
x=10
f1
```
**Output:**
```
x value: 10
```

**Example 2:**
```bash
#! /bin/bash
f1() {
    x=20
    echo "x value: $x"
}
x=10
f1
echo "After f1 execution x value: $x"
```
**Output:**
```
x value: 20
After f1 execution x value: 20
```

**Example 3:**
```bash
#! /bin/bash
f1() {
    echo "x value: $x"
}
f1
x=10
f1
```
**Output:**
```
x value:
x value: 10
```

**Example 4:**
```bash
#! /bin/bash
f1() {
    x=10
}
f1
echo "x value: $x"
```
**Output:**
```
x value: 10
```

## Local Variables
To restrict a variable's scope to a function, use the `local` keyword. These variables can only be accessed within the function and are not available outside of it.

### Example:
```bash
#! /bin/bash
f1() {
    local x=10
    echo "Inside function x value: $x"
}
f1
echo "Outside function x value: $x"
```
**Output:**
```
Inside function x value: 10
Outside function x value:
```

---

## Return Statement in Functions

Every function in shell scripting returns a value, with the default being the exit code of the last command in the function. You can explicitly return values using the `return` statement.

- Syntax: `return <exitcode>`
- Allowed values for `<exitcode>`: 0 (success) to 255 (failure).

**Example:**
```bash
#! /bin/bash
sum() {
    if [ $# != 2 ]; then
        echo "You should pass exactly two numbers"
        return 1
    else
        echo "The SUM: $(($1 + $2))"
    fi
}
sum 10 20
echo "The Return value of this function: $?"
echo
sum 10
echo "The Return value of this function: $?"
```
**Output:**
```
The SUM: 30
The Return value of this function: 0

You should pass exactly two numbers
The Return value of this function: 1
```

---

### **Use Case Example**
```bash
backup() {
    # Commands to take backup
}
backup
if [ $? != 0 ]; then
    echo "Backup failed"
else
    echo "Backup successful"
fi
```

---

### **Break vs Exit vs Return**

1. **break**: Used inside loops to terminate loop execution and continue with statements after the loop.
2. **exit**: Terminates script execution immediately, preventing further statement execution.
3. **return**: Used inside functions to terminate function execution. After the `return` statement, subsequent statements in the function are skipped, but the script continues executing after the function call.

---

### **Calling Functions from Another Script**

**`util.sh`**
```bash
#! /bin/bash
x=888
y=999
add() {
    echo "$1 + $2 = $[$1 + $2]"
}
multiply() {
    echo "$1 * $2 = $[$1 * $2]"
}
subtract() {
    echo "$1 - $2 = $[$1 - $2]"
}
divide() {
    echo "$1 / $2 = $[$1 / $2]"
}
```

**`test.sh`**
```bash
#! /bin/bash
. ./util.sh  # Include `util.sh`
add 10 20
subtract 20 10
multiply 10 20
divide 20 10
echo "The value of x: $x"
echo "The value of y: $y"
```

**Output:**
```
10 + 20 = 30
20 - 10 = 10
10 * 20 = 200
20 / 10 = 2
The value of x: 888
The value of y: 999
```
