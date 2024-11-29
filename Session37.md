Regular expressions (regex) are a powerful tool for pattern matching in text. Here's a more structured explanation of the patterns you provided:

---

### **1. Character Patterns**
These patterns match specific character arrangements in text.

1. **Example 1: `grep 'd*' demo.txt`**
   - Matches lines with zero or more occurrences of the character `d` followed by any number of characters.
   - Note: In most regex implementations, `d*` matches *zero* or more `d`s, which may include lines without `d`. Ubuntu's `grep` may not support this syntax.

2. **Example 2: `grep 'c[aeiou]ll' demo.txt`**
   - Matches any word starting with `c`, followed by a vowel (`a, e, i, o, u`), and ending with `ll`.
   - Examples: `call`, `cell`, `cill`, `coll`, `cull`.

3. **Example 3: `grep 'b..l' demo.txt`**
   - Matches words where:
     - The first character is `b`,
     - Followed by any two characters (indicated by `..`),
     - Ending with `l`.
   - Example matches: `ball`, `bill`, `bell`.

- `demo.txt` fiile content for practices commands 


---

### **2. Word Patterns**
These patterns focus on matching entire words or specific positions in words.

#### Special Syntax:
- `\<word\>`: Matches the exact word `word`.
- `\<xyz`: Matches words that *start* with `xyz`.
- `xyz\>`: Matches words that *end* with `xyz`.

#### Examples:

1. **Basic Example: `grep 'durga' demo.txt`**
   - Matches any line containing the sequence `durga`.
   - Example matches: `durga`, `durgasoft`, `techdurga`.

2. **Exact Word Match: `grep '\<durga\>' demo.txt`**
   - Matches the exact word `durga`.
   - Example matches: `durga` (but not `durgasoft` or `techdurga`).

3. **Starts with `durga`: `grep '\<durga' demo.txt`**
   - Matches words that start with `durga`.
   - Example matches: `durga`, `durgasoft`.

4. **Ends with `durga`: `grep 'durga\>' demo.txt`**
   - Matches words that end with `durga`.
   - Example matches: `durga`, `techdurga`.


5. **Example: `grep '\<[0-9][0-9][0-9][0-9]\>' demo.txt`**
   - Matches lines containing exactly 4-digit numbers.
   - Example matches: `1234`, `6789`.

---

### **Practical Usage:**
The examples provided are applicable in contexts where `grep` is used to search text files for patterns. 

### Additional Notes:
- Ubuntu users should ensure they are using `grep` with appropriate flags (e.g., `-E` for extended regex if required).
- Misuse of special characters or the need for escaping (`\`) depends on the shell environment and version of `grep`.


## Line Patterns (Anchors)

### `^` (Line starts with)  
### `$` (Line ends with)  

add these lines to demo.txt
```
django is python based framework to develop web applications
dogs situation is very dangeours these lock down days
```

1. `$ grep '^d' demo.txt`  
   Displays all lines that start with `d`.  

2. `$ grep '^the' demo.txt`  
   Displays all lines that start with `the`.  

3. `$ grep '^\<the\>' demo.txt`  
   Displays all lines that start with the exact word `the`.  

4. `$ grep '^[aeiou]' demo.txt`  
   Displays all lines that start with a vowel.  

5. `$ grep '^[^aeiou]' demo.txt`  
   Displays all lines that do not start with a vowel.  

6. `$ grep 't$' demo.txt`  
   Displays all lines that end with `t`.  

7. `$ grep '[aeiou]$' demo.txt`  
   Displays all lines that end with a vowel.  

8. `$ grep '[0-9]$' demo.txt`  
   Displays all lines that end with a digit.  

9. `$ grep '^unix$' demo.txt`  
   Displays all lines where the content of the line is exactly `unix`.  
   Example:  
   ```bash
   $ cat > demo.txt  
   unix  
   unix software  
   unix material  
   material unix  
   unix unix  
   $ grep '^unix$' demo.txt  
   unix  
   ```  

10. `$ grep '^....$' demo.txt`  
    Displays all lines where the line contains exactly 4 characters.  

11. `$ grep '^\.' demo.txt`  
    Displays all lines that start with a `.` (dot).  

12. `$ grep '\$$' demo.txt`  
    Displays all lines that end with a `$` (dollar sign).  

13. `$ grep '^$' demo.txt`  
    Displays all blank lines.  

14. `$ grep -v '^$' demo.txt`  
    Displays all lines except blank lines.  

---

### How to Delete Blank Lines from a File?

1. **Command:**  
   ```bash
   $ grep -v '^$' demo.txt > temp.txt  
   $ mv temp.txt demo.txt  
   ```  

2. **Note:**  
   The following command will not work:  
   ```bash
   $ grep -v '^$' demo.txt > demo.txt  
   ```  
   This fails because `grep` cannot overwrite the input file (`demo.txt`) while reading it.


```bash
akshay@myubuntu:~/Desktop/operations/session37$ gedit demo.txt
akshay@myubuntu:~/Desktop/operations/session37$ ls -l
total 4
-rw-rw-r-- 1 akshay akshay 909 Nov 29 11:41 demo.txt
akshay@myubuntu:~/Desktop/operations/session37$ grep 'linux' demo.txt 
(java|linux) This line can only be understood by egrep but not grep, which uses basic regex.
akshay@myubuntu:~/Desktop/operations/session37$ grep 'Linux' demo.txt 
Learning Linux is very easy and essential for anyone working in technology today.
The knowledge of Linux is required everywhere, from small startups to large organizations.
Your father learned Linux in his time; now you are learning it to advance in your career.
In the future, your kids will also need to learn Linux to stay competitive in their fields.
Linuxclasses are offered by many online platforms to help people master this operating system.
Linuxmaterial includes books, tutorials, and documentation for beginners and advanced users.
Linuxvideos are available on YouTube and other sites for easy and interactive learning.
Linux is an open-source operating system that powers servers, desktops, and mobile devices.
Everyone should learn Linux to gain an edge in today's technology-driven professional world.
akshay@myubuntu:~/Desktop/operations/session37$ grep \<linux\> demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep '\<linux\>' demo.txt 
(java|linux) This line can only be understood by egrep but not grep, which uses basic regex.
akshay@myubuntu:~/Desktop/operations/session37$ grep '\<linux' demo.txt 
(java|linux) This line can only be understood by egrep but not grep, which uses basic regex.
akshay@myubuntu:~/Desktop/operations/session37$ grep '\<Linux' demo.txt 
Learning Linux is very easy and essential for anyone working in technology today.
The knowledge of Linux is required everywhere, from small startups to large organizations.
Your father learned Linux in his time; now you are learning it to advance in your career.
In the future, your kids will also need to learn Linux to stay competitive in their fields.
Linuxclasses are offered by many online platforms to help people master this operating system.
Linuxmaterial includes books, tutorials, and documentation for beginners and advanced users.
Linuxvideos are available on YouTube and other sites for easy and interactive learning.
Linux is an open-source operating system that powers servers, desktops, and mobile devices.
Everyone should learn Linux to gain an edge in today's technology-driven professional world.
akshay@myubuntu:~/Desktop/operations/session37$ grep 'Linux\>' demo.txt 
Learning Linux is very easy and essential for anyone working in technology today.
The knowledge of Linux is required everywhere, from small startups to large organizations.
Your father learned Linux in his time; now you are learning it to advance in your career.
In the future, your kids will also need to learn Linux to stay competitive in their fields.
Linux is an open-source operating system that powers servers, desktops, and mobile devices.
Everyone should learn Linux to gain an edge in today's technology-driven professional world.
akshay@myubuntu:~/Desktop/operations/session37$ gedit num.txt
akshay@myubuntu:~/Desktop/operations/session37$ grep '\<[0-9][0-9]\>' num.txt 
12
12
akshay@myubuntu:~/Desktop/operations/session37$ grep '\<[0-9][0-9][0-9][0-9]\>' num.txt 
1234
1234
6789
akshay@myubuntu:~/Desktop/operations/session37$ cat num.txt 
1
12
123
1234
12345
123456
1234
123456
6789
67543
12
1
akshay@myubuntu:~/Desktop/operations/session37$ gedit demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep '^d' demo.txt 
django is python based framework to develop web applications
dogs situation is very dangeours these lock down days
akshay@myubuntu:~/Desktop/operations/session37$ grep '^the' demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep '^The' demo.txt 
The knowledge of Linux is required everywhere, from small startups to large organizations.
akshay@myubuntu:~/Desktop/operations/session37$ grep '\<^The\>' demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep '^\<The\>' demo.txt 
The knowledge of Linux is required everywhere, from small startups to large organizations.
akshay@myubuntu:~/Desktop/operations/session37$ grep '^\<[aeiou]\>' demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep '^[aeiou]' demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ cat demo.txt 
Learning Linux is very easy and essential for anyone working in technology today.
The knowledge of Linux is required everywhere, from small startups to large organizations.
Your father learned Linux in his time; now you are learning it to advance in your career.
In the future, your kids will also need to learn Linux to stay competitive in their fields.
(java|linux) This line can only be understood by egrep but not grep, which uses basic regex.
Linuxclasses are offered by many online platforms to help people master this operating system.
Linuxmaterial includes books, tutorials, and documentation for beginners and advanced users.
Linuxvideos are available on YouTube and other sites for easy and interactive learning.
Linux is an open-source operating system that powers servers, desktops, and mobile devices.
Everyone should learn Linux to gain an edge in today's technology-driven professional world.
django is python based framework to develop web applications
dogs situation is very dangeours these lock down days
akshay@myubuntu:~/Desktop/operations/session37$ grep '$t' demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep 't$' demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep '[aeiou]$' demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ egrep '[aeiou]$' demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ gedit demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep '[0-9]$' demo.txt 
My car number is MH 14 BH 7777
akshay@myubuntu:~/Desktop/operations/session37$ grep '^....$' demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep '^....$' num.txt 
1234
1234
6789
akshay@myubuntu:~/Desktop/operations/session37$ grep '^.' num.txt 
1
12
123
1234
12345
123456
1234
123456
6789
67543
12
1
akshay@myubuntu:~/Desktop/operations/session37$ grep '^\.' num.txt #display all lines starts with . symbol 
akshay@myubuntu:~/Desktop/operations/session37$ gedit num.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep '^\.' num.txt #display all lines starts with . symbol 
.0
akshay@myubuntu:~/Desktop/operations/session37$ grep '^\$$' num.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep '^$' demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ gedit demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ grep '^$' demo.txt |wc -l
3
```