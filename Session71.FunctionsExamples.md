### Example 5: Finding the Maximum of Two Numbers
```bash
#! /bin/bash

max() {
    if [ $1 -gt $2 ]; then
        echo "The Maximum of $1 and $2: $1"
    else
        echo "The Maximum of $1 and $2: $2"
    fi
}

# Calling the function with different inputs
max 10 20
max 200 100
```

**Output:**
```bash
The Maximum of 10 and 20: 20
The Maximum of 200 and 100: 200
```
---

# Shell Script Functions: Advanced Examples

### Q6 Write a Function to Find the Maximum of 3 Given Integer Numbers
```bash
#! /bin/bash

max() {
    a=$1
    b=$2
    c=$3
    if [ $a -gt $b -a $a -gt $c ]; then
        echo "Biggest Number: $a"
    elif [ $b -gt $c ]; then
        echo "Biggest Number: $b"
    else
        echo "Biggest Number: $c"
    fi
}

# Reading input from the user
read -p "Enter First Number: " n1
read -p "Enter Second Number: " n2
read -p "Enter Third Number: " n3
max $n1 $n2 $n3
```

---

### Q7 Write a Function to Compare Two Given Integers
```bash
#! /bin/bash

compare() {
    if [ $1 -eq $2 ]; then
        echo "Both Numbers are equal"
    elif [ $1 -gt $2 ]; then
        echo "$1 is greater than $2"
    else
        echo "$1 is less than $2"
    fi
}

# Calling the function with different inputs
compare 10 10
compare 10 20
compare 200 100
```

**Output:**
```bash
Both Numbers are equal
10 is less than 20
200 is greater than 100
```

---

### Q8 Write a Function to Find the Factorial of a Given Integer
```bash
#! /bin/bash

factorial() {
    original=$1
    n=$1
    fact=1
    while [ $n -gt 1 ]; do
        let fact=fact*n
        let n--
    done
    echo "The Factorial of $original is: $fact"
}

# Reading input from the user
read -p "Enter a number to find factorial: " n
factorial $n
```

OR

```bash
#!/bin/bash

factorial() {
    local n=$1
    
    # Input validation
    if ! [[ "$n" =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter a valid non-negative integer" >&2
        exit 1
    fi
    
    # Handle special cases
    if [ $n -eq 0 ] || [ $n -eq 1 ]; then
        echo "The factorial of $n is: 1"
        return 0
    fi
    
    # Check for reasonable input size to prevent overflow
    if [ $n -gt 20 ]; then
        echo "Warning: Result may overflow for numbers larger than 20" >&2
    fi
    
    # Calculate factorial using arithmetic expansion
    local fact=1
    for ((i=2; i<=n; i++)); do
        fact=$((fact * i))
    done
    
    echo "The factorial of $n is: $fact"
}

# Main program
if [ $# -eq 1 ]; then
    # If argument provided via command line
    factorial "$1"
else
    # Interactive mode
    while true; do
        read -p "Enter a number to find factorial (q to quit): " input
        
        # Check for quit condition
        [[ "$input" == "q" ]] && exit 0
        
        factorial "$input"
    done
fi
```

---

### Q9 Write a Function to Find the Factorial of the First 10 Natural Numbers
```bash
#! /bin/bash

factorial() {
    original=$1
    n=$1
    fact=1
    while [ $n -gt 1 ]; do
        let fact=fact*n
        let n--
    done
    echo "The Factorial of $original: $fact"
}

# Looping through the first 10 natural numbers
for i in {1..10}; do
    factorial $i
done
```

**Output:**
```bash
The Factorial of 1: 1
The Factorial of 2: 2
The Factorial of 3: 6
The Factorial of 4: 24
The Factorial of 5: 120
The Factorial of 6: 720
The Factorial of 7: 5040
The Factorial of 8: 40320
The Factorial of 9: 362880
The Factorial of 10: 3628800
```

---

