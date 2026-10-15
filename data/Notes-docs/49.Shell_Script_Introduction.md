
## What is Shell Script, Sha-Bang, and First Script?

### What is Shell Script?

A **shell script** is a sequence of commands saved to a file. This file can be executed as a script.  
In a shell script, we can use programming features like:
- Conditional statements
- Loops
- Functions

Shell scripts are best suited for automating tasks and can handle complex requirements with ease.

---

### How to Write and Run a Shell Script?

### Step 1: Write the Script  
Create a file, for example, `demo.sh`, and include the following commands:

```bash
echo "Welcome to shell script"
date
cal
```

---

### Step 2: Provide Execute Permissions to the Script  

Use the following command to grant execute permissions:

```bash
$ chmod a+x demo.sh
```

---

### Step 3: Run the Script  

You can run the script in multiple ways:

```bash
$ /bin/bash ./demo.sh
$ bash ./demo.sh
$ /bin/bash /home/durgasoft/scripts/demo.sh
$ ./demo.sh  # If the default shell is bash
```

**Note:**  
- The default shell is `bash`, which executes the script by default.  
- If you want to use a different shell (e.g., Bourne shell), run the script as follows:

```bash
$ /bin/sh ./demo.sh
$ sh ./demo.sh
```

## Importance of Sha-Bang

The **sha-bang** (`#!`) is used to specify the interpreter responsible for executing a script.  
It provides clear instructions about which interpreter to use for the script.

- `#` → Sharp  
- `!` → Bang  
- `#!` → Sharp Bang, Sha-Bang, or Shebang  

### Examples:
- `#! /bin/bash` → Specifies that the script should be executed by the Bash shell.  
- `#! /bin/sh` → Specifies that the script should be executed by the Bourne Shell.  
- `#! /usr/bin/python3` → Specifies that the script should be executed by the Python 3 interpreter.  

### Why is Sha-Bang Important?
When a sha-bang is included in the script, you can execute the script directly without explicitly providing the interpreter command.  

---

### Examples of Scripts with and Without Sha-Bang

**Q1 Write a Python Script and Execute Without Sha-Bang and With Sha-Bang**

**Script:** `test.py`

```python
#! /usr/bin/python3

import random
print("Good Morning")
name = input("Enter your name: ")
l = ["sejal", "shrushti", "archana", "arti", "gauri", "preeti"]
print("congratulation ", name)
print("Your best frined is ", random.choice(l))

```

#### Without Sha-Bang:
```bash
$ python3 ./test.py
$ python3 /home/durgasoft/scripts/test.py
```

#### With Sha-Bang:
```bash
$ ./test.py
$ /home/durgasoft/scripts/test.py
```

---

**Q2 Consider the Following Script:**

**Script:** `demo.sh`

```bash
#! /bin/rm
echo "It is a beautiful script"
```

#### What Happens When We Execute This Script?

```bash
$ ./demo.sh
```

- This is equivalent to running:
  ```bash
  $ rm ./demo.sh
  ```
- The `demo.sh` file will be **removed** as the script is executed by the `rm` command.

---

**Write and Run a Shell Script That Prints the Current System Date and Time**

**Script:** `date.sh`

```bash
#! /bin/bash
echo "The current System Date and Time:"
date
```

#### Steps to Execute:

1. Provide execute permissions:
   ```bash
   $ chmod a+x date.sh
   ```

2. Run the script:
   ```bash
   $ ./date.sh
   ```
   **Output:**
   ```
   The current System Date and Time:
   Wed Dec 4 21:01:49 IST 2019
   ```

---
