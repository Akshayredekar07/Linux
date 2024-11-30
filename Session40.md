
## `paste` Command in Linux

The `paste` command is used to join two or more files horizontally using a specified delimiter. By default, the delimiter is a tab.

```bash
$ paste file1 file2 ...
```

**Example: Input Files**
File: `subjects.txt`
```plaintext
Core Java
Adv Java
Python
Django
UNIX
```

**File: `fee.txt`**
```plaintext
1000
2000
2500
1500
250
```

### Using `paste` Command
```bash
$ paste subjects.txt fee.txt
```

**Output**
```plaintext
Core Java   1000
Adv Java    2000
Python      2500
Django      1500
UNIX        250
```

### Specifying a Delimiter
You can explicitly set a delimiter using the `-d` option.

**Example**
```bash
$ paste -d '-' subjects.txt fee.txt
```

**Output**
```plaintext
Core Java-1000
Adv Java-2000
Python -2500
Django-1500
UNIX-250
```

### Notes
- The delimiter must be a single character. If you specify more than one character, only the first character is considered.
```bash
$ paste -d '---' subjects.txt fee.txt
```

#### Output
```plaintext
Core Java-1000
Adv Java-2000
Python -2500
Django-1500
UNIX-250
```
