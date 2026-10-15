


# AWK Programming

AWK is a powerful tool for searching and processing text files, offering a more convenient way to handle files compared to standard Linux commands. It is especially useful in shell scripting for managing large files.


## Structure of an AWK Command

The basic structure of an AWK command is:
```bash
awk {BEGIN BLOCK}{ACTION BLOCK}{END BLOCK} filenames
```

- **BEGIN Block**: Executed once before processing the file.
- **ACTION Block**: Executed for each line or record in the file.
- **END Block**: Executed once after processing all lines or records.


## Example: Basic AWK Command

**Input File: `input.txt`**
```
Any subject will provide huge benefit.
The useless waste activities we should not do.
At least one new activity we should do per day.
Don't play games with money.
```

**Command:**
```bash
awk 'BEGIN { print "BEGIN" } { print "Action" } END { print "END" }' input.txt
```

**Output:**
```
BEGIN
Action
Action
Action
Action
END
```


## Example: Print File Data and Count Lines

**Command:**
```bash
awk 'BEGIN { 
    print "Beginning of the File"; 
    print "------------------"; 
    c=0; 
} 
{ 
    print $0; 
    c=c+1; 
} 
END { 
    print "........................."; 
    print "The Number Of Lines: " c 
}' abc.txt
```

**Output:**
```
Beginning of the File
------------------
Any subject will provide huge benefit.
The useless waste activities we should not do.
At least one new activity we should do per day.
Don't play games with money.
.........................
The Number Of Lines: 4
```


## Example: Add Line Numbers

**Command:**
```bash
awk 'BEGIN { 
    print "Beginning of the File"; 
    print "------------------"; 
    c=0; 
} 
{ 
    c=c+1; 
    print c ": " $0; 
} 
END { 
    print "........................."; 
    print "The Number Of Lines: " c 
}' input.txt abc.txt
```

**Output:**
```
Beginning of the File
------------------
1: Any subject will provide huge benefit.
2: The useless waste activities we should not do.
3: At least one new activity we should do per day.
4: Don't play games with money.
.........................
The Number Of Lines: 4
```


### Note:
- Instead of `c=c+1`, you can use:
  - `c++`
  - `c+=1`


**Processing Multiple Files Data at a Time:**

We can use `awk` to process multiple files simultaneously. Here's an example:

```bash
awk '
BEGIN {
    print "Beginning of the file"
    print "................................."
    c = 0
}
{
    print $0
    c++
}
END {
    print "................................."
    print "The Number of Lines: " c
}' file1.txt file2.txt