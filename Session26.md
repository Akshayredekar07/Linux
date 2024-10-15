
## How to Use Multiple Commands in a Single Line

You can execute multiple independent commands in a single line using the following two methods:

### **1st Method: Using a semicolon (;)**
```bash
cmd1; cmd2; cmd3; ..... ; cmdn
```
- First, `cmd1` will be executed, then `cmd2`, followed by the remaining commands.
- If any command fails in the middle, the rest of the commands will still be executed.

### **2nd Method: Using `&&`**
```bash
cmd1 && cmd2 && cmd3 && ..... && cmdn
```
- First, `cmd1` will be executed, then `cmd2`, followed by the remaining commands.
- If any command fails in the middle, the remaining commands will **not** be executed.

### **Example:**

Create a directory `dir1`, create files `a.txt`, `b.txt`, `c.txt` inside `dir1`, write the current system date and time to `a.txt`, and write the current month's calendar to `b.txt`:

```bash
mkdir dir1 ; touch dir1/{a,b,c}.txt ; date > dir1/a.txt ; cal > dir1/b.txt
```

Using `&&`:
```bash
mkdir dir1 && touch dir1/{a,b,c}.txt && date > dir1/a.txt && cal > dir1/b.txt
```

**Demonstrating failure handling:**
```bash
mkdir dir1 ; touch dir1/{a,b,c}.txt ; Date > dir1/a.txt ; cal > dir1/b.txt
```
- Here, the 3rd command fails, but the 4th command is still executed.

```bash
mkdir dir1 && touch dir1/{a,b,c}.txt && Date > dir1/a.txt && cal > dir1/b.txt
```
- Here, the 3rd command fails, and as a result, the 4th command is **not** executed.

---
