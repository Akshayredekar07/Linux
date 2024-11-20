
### **1. Search for a Single Pattern Using `grep`**

#### Command:
```bash
grep "java" demo.txt
```

#### `demo.txt` Content:
```plaintext
This is java demo
UnixDemo session
unix material
UNIX classes and videos
java is slowly going down
```

#### Output:
```plaintext
This is java demo
java is slowly going down
```

---

### **2. Case-Insensitive Search**

#### Command:
```bash
grep -i "unix" demo.txt
```

#### Output:
```plaintext
UnixDemo session
unix material
UNIX classes and videos
```

---

### **3. Search for Multiple Patterns**

#### Command Using `-e` Option:
```bash
grep -i -e "java" -e "unix" demo.txt
```

#### Output:
```plaintext
This is java demo
UnixDemo session
unix material
UNIX classes and videos
java is slowly going down
```

---

### **4. Using Regular Expressions**

#### Command:
```bash
grep -E "(java|unix)" demo.txt
```

#### Output:
```plaintext
This is java demo
UnixDemo session
unix material
UNIX classes and videos
java is slowly going down
```

---

### **5. Fixed String Search Using `fgrep` or `grep -F`**

#### Command:
```bash
grep -F "java
unix" demo.txt
```

#### Output:
```plaintext
This is java demo
unix material
java is slowly going down
```

---

### **6. Search Strings from Another File**

#### Command:
```bash
grep -F -f patterns.txt demo.txt
```

#### `patterns.txt` Content:
```plaintext
java
unix
python
```

#### Output:
```plaintext
This is java demo
unix material
java is slowly going down
```

---

### **7. Show Context Lines**

#### Command to Show Lines Before (`-B`), After (`-A`), and Around (`-C`):
```bash
grep -B 1 "java" demo.txt
```

#### Output:
```plaintext
UnixDemo session
This is java demo
```

---

#### Command:
```bash
grep -A 1 "java" demo.txt
```

#### Output:
```plaintext
This is java demo
java is slowly going down
```

---

#### Command:
```bash
grep -C 1 "java" demo.txt
```

#### Output:
```plaintext
UnixDemo session
This is java demo
java is slowly going down
```

---

### **8. Count Matching Lines**

#### Command:
```bash
grep -c "java" demo.txt
```

#### Output:
```plaintext
2
```

---

### **9. Find Files with Matching Patterns**

#### Command:
```bash
grep -l "java" *.txt
```

#### Output (example if multiple files are present):
```plaintext
demo.txt
testfile.txt
```

---

### **10. Recursive Search in Directories**

#### Command:
```bash
grep -R "java" /path/to/directory
```

#### Output (example):
```plaintext
/path/to/directory/demo.txt:This is java demo
/path/to/directory/testfile.txt:java code snippet
```

---

### **11. Invert Match**

#### Command:
```bash
grep -v "java" demo.txt
```

#### Output:
```plaintext
UnixDemo session
unix material
UNIX classes and videos
```

---

### **12. Match Whole Words**

#### Command:
```bash
grep -w "java" demo.txt
```

#### Output:
```plaintext
This is java demo
java is slowly going down
```

---

### **13. Extended Regular Expressions Using `egrep`**

#### Command:
```bash
egrep -i "(java|unix)" demo.txt
```

#### Output:
```plaintext
This is java demo
UnixDemo session
unix material
UNIX classes and videos
java is slowly going down
```

---

### **14. Count Matching Patterns Using `egrep`**

#### Command:
```bash
egrep -c "(java|unix)" demo.txt
```

#### Output:
```plaintext
5
```

---

### **15. Search with Line Numbers**

#### Command:
```bash
grep -n "java" demo.txt
```

#### Output:
```plaintext
1:This is java demo
5:java is slowly going down
```

---

### **16. Show Only Matching Parts**

#### Command:
```bash
grep -o "java" demo.txt
```

#### Output:
```plaintext
java
java
```

---

### **17. Example of Recursive Search for Errors**

#### Command:
```bash
grep -R "error" /var/log/
```

#### Output (example):
```plaintext
/var/log/system.log:error occurred at line 42
/var/log/debug.log:error: unable to connect
```

---

### **18. Search for Exact Strings Using `fgrep`**

#### Command:
```bash
fgrep "java|unix" demo.txt
```

#### Output:
```plaintext
(java|unix) this is extra line added
```

---

### **19. Deprecated Commands: `fgrep` and `egrep`**

- `fgrep` → Use `grep -F`
- `egrep` → Use `grep -E`

#### Example Command:
```bash
grep -E "(java|unix)" demo.txt
```

#### Output:
```plaintext
This is java demo
UnixDemo session
unix material
UNIX classes and videos
java is slowly going down
```

---

### **20. Using `-A`, `-B`, and `-C` for Context**

#### Command:
```bash
grep -C 2 "unix" demo.txt
```

#### Output:
```plaintext
This is java demo
UnixDemo session
unix material
UNIX classes and videos
```

---


Here’s a **detailed explanation of theory points** alongside commands and outputs for **`grep`, `egrep`, and `fgrep`**. The combination of theoretical details and practical examples will ensure a comprehensive understanding.

---

## **Theoretical Points**

### **1. What is `grep`?**
- **`grep`** stands for **Global Regular Expression Print**.
- It searches for patterns in text files and prints lines containing the specified pattern.
- Supports basic regular expressions (BRE).

---

### **2. Key Features of `grep`**
- **Case Insensitive Search:** Use `-i` to ignore case.
- **Multiple Patterns:** Use `-e` for multiple patterns.
- **Count Matching Lines:** Use `-c` to count the occurrences of the pattern.
- **Context:** Use `-A`, `-B`, or `-C` to show lines before, after, or around the match.
- **Recursive Search:** Use `-R` to search across directories and subdirectories.
- **Invert Match:** Use `-v` to show lines that do not match the pattern.

---

### **3. What is `egrep`?**
- **`egrep`** stands for **Extended Global Regular Expression Print**.
- Supports **extended regular expressions (ERE)**:
  - `|` (alternation for OR conditions)
  - `+` (one or more repetitions)
  - `?` (zero or one repetition)
  - `()` (grouping patterns)
- Equivalent to using `grep -E`.

---

### **4. What is `fgrep`?**
- **`fgrep`** stands for **Fixed Global Regular Expression Print**.
- Searches for **fixed strings** (not patterns or regular expressions).
- Faster than `grep` for fixed strings as it skips pattern-matching overhead.
- Equivalent to using `grep -F`.

---

### **5. Differences Between `grep`, `egrep`, and `fgrep`**
| Feature          | `grep`          | `egrep`         | `fgrep`         |
|-------------------|-----------------|-----------------|-----------------|
| **Pattern Type**  | Basic regex     | Extended regex  | Fixed strings   |
| **Use Cases**     | General search | Advanced patterns | Exact strings |
| **Replacements**  | None            | `grep -E`       | `grep -F`       |

---

### **6. Commonly Used Options**
| Option  | Description                                                                 |
|---------|-----------------------------------------------------------------------------|
| `-i`    | Ignore case while searching.                                               |
| `-n`    | Display line numbers of matching lines.                                    |
| `-c`    | Count the number of matching lines.                                        |
| `-v`    | Show lines that do **not** match the pattern.                              |
| `-A`    | Show `n` lines **after** the matching line.                                |
| `-B`    | Show `n` lines **before** the matching line.                               |
| `-C`    | Show `n` lines before and after the matching line (context).               |
| `-e`    | Specify multiple patterns for matching.                                    |
| `-E`    | Use extended regular expressions (same as `egrep`).                        |
| `-F`    | Use fixed string matching (same as `fgrep`).                               |
| `-o`    | Print only the matching part of the line.                                  |
| `-R`    | Search recursively in directories.                                         |

---

### **7. Using Regular Expressions in `grep`**

| Regular Expression | Description                          | Example Pattern        | Matches                       |
|---------------------|--------------------------------------|-------------------------|-------------------------------|
| `.`                 | Matches any single character        | `c.t`                  | cat, cut, cot                |
| `*`                 | Matches zero or more occurrences    | `a*`                   | a, aa, aaa, empty line       |
| `+`                 | Matches one or more occurrences     | `a+`                   | a, aa, aaa                   |
| `|`                 | Alternation (OR)                   | `java|unix`            | java or unix                 |
| `()`                | Groups patterns for alternation     | `(java|unix) classes`  | java classes, unix classes   |
| `^`                 | Matches the start of a line         | `^java`                | Lines starting with "java"   |
| `$`                 | Matches the end of a line           | `demo$`                | Lines ending with "demo"     |

---

### **8. Advantages of `grep`, `egrep`, and `fgrep`**
- **`grep`:** Versatile for simple searches.
- **`egrep`:** Ideal for complex regular expressions and pattern matching.
- **`fgrep`:** Faster for searching fixed strings and handling multiple patterns from a file.

