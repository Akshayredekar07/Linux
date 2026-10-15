
## `grep` Command

### What is `grep`?
- **`grep`** stands for:
  - **Globally search a Regular Expression and Print** (common backronym)
  - **Global Regular Expression Print**
  - **Global Regular Expression Parser**
  
- We can use the `grep` command to search for a specified pattern within a single or multiple files.

### Basic Syntax
```bash
grep <pattern> <filename>
```
- This command prints all lines in the file(s) that match the specified pattern.

### Example

#### File Contents
Assume we have a file `subjects.txt` with the following contents:

```plaintext
Sno Subjectname Faculty Fee
1. Python Nagoor 1000
2. Java Sriman 2000
3. Unix Durga 250
4. DevOps Sriman 3500
5. UNIX Durga 400
6. Java Durga 1000
```

#### Searching in a Single File

To search for the word "durga" in `subjects.txt`, you can use any of these commands:

```bash
$ grep 'durga' subjects.txt
$ grep "durga" subjects.txt
$ grep durga subjects.txt
```

- This will print all lines that contain "durga" (case-sensitive):

```plaintext
3. Unix Durga 250
5. UNIX Durga 400
6. Java Durga 1000
```
Consider the `demo.txt`
```
The most important subject is linux
learning linux is very easy
the knowledge of linux is required everywhere
Your father learn linux, now you are learning.
In the future your kids also required to learn linux
java is a programming language
python is all rounder
Devops is the best technologies to fulfill current market requirements
```

```bash
akshay@myubuntu:~/Desktop$ grep "linux" demo.txt
The most important subject is linux
learning linux is very easy
the knowledge of linux is required everywhere
Your father learn linux, now you are learning.
In the future your kids also required to learn linux
```

`subject.txt`
```
Linux is very important everywhere
Java is like ocean and not that much easy
Python is nursery level programming language
Devops and datascience have future
Linux videos are too good
```

```bash
akshay@myubuntu:~/Desktop$ grep linux demo.txt subjects.txt
demo.txt:The most important subject is linux
demo.txt:learning linux is very easy
demo.txt:the knowledge of linux is required everywhere
demo.txt:Your father learn linux, now you are learning.
demo.txt:In the future your kids also required to learn linux
```

Search in all file in current working directory
```bash
akshay@myubuntu:~/Desktop$ grep java *
demo.txt:java is a programming language
```

It cannot search in nested directory:
```shell
akshay@myubuntu:~/Desktop$ grep linux *
demo.txt:The most important subject is linux
demo.txt:learning linux is very easy
demo.txt:the knowledge of linux is required everywhere
demo.txt:Your father learn linux, now you are learning.
demo.txt:In the future your kids also required to learn linux
grep: dir1: Is a directory
akshay@myubuntu:~/Desktop$ 
```

## 2 To Search in Multiple Files

You can use `grep` to search for a pattern across multiple files. Here are a few examples:

### Example Commands

#### Searching in Specific Files
```bash
$ grep durga subjects.txt career.txt
```
- Output:
```plaintext
subjects.txt:3. unix durga 250
subjects.txt:5. UNIX durga 400
subjects.txt:6. Java durga 1000
career.txt:durga
career.txt:durga ksdjfdlakjklfjad
```

#### Searching in All Text Files
```bash
$ grep durga *.txt
```
- Output:
```plaintext
career.txt:durga
career.txt:durga ksdjfdlakjklfjad
subjects.txt:3. unix durga 250
subjects.txt:5. UNIX durga 400
subjects.txt:6. Java durga 1000
```

#### Searching in All Files in the Current Directory
```bash
$ grep durga *
```
- Output:
```plaintext
career.txt:durga
career.txt:durga ksdjfdlakjklfjad
subjects.txt:3. unix durga 250
subjects.txt:5. UNIX durga 400
subjects.txt:6. Java durga 1000
```

---

## 3 To Search Data by Ignoring Case

By default, the `grep` command is case-sensitive. If you want to ignore case, you should use the `-i` option.

### Example Commands

#### Case-Sensitive Search
```bash
$ grep unix *.txt
```
- Output:
```plaintext
career.txt:unix jksadjfklasjdkflajs
subjects.txt:3. unix durga 250
```

#### Case-Insensitive Search
```bash
$ grep -i unix *.txt
```
- Output:
```plaintext
career.txt:unix jksadjfklasjdkflajs
subjects.txt:3. unix durga 250
subjects.txt:5. UNIX durga 400
```

---

## 4 To Display the Number of Occurrences

To count the number of occurrences of a pattern, use the `-c` option. The `c` stands for count.

### Example Command
```bash
$ grep -c unix *.txt
```
- Output:
```plaintext
career.txt:1
subjects.txt:1
```

## Comparison of `locate`, `find`, and `grep`

| Command  | Purpose                                                                                  | Example Usage                             |
|----------|------------------------------------------------------------------------------------------|-------------------------------------------|
| `locate` | Quickly finds files and directories by name or pattern using an indexed database.        | `locate filename.txt`                     |
| `find`   | Searches for files and directories by name, type, size, and other attributes in real-time.| `find /home -name filename.txt`           |
| `grep`   | Searches for specific text patterns within the content of files.                         | `grep "pattern" filename.txt`             |

### Key Differences

- **`locate` and `find`:** These commands are primarily used to find the location of files and directories based on their names or other attributes.
- **`grep`:** This command is used to search for specific patterns or text within the contents of files.

In essence:
- Use **`locate`** and **`find`** to locate files.
- Use **`grep`** to search within the content of those files.


## Additional `grep` Options

### 5 To Display Line Numbers Before Results

Use the `-n` option to display line numbers for each matched line in the search results.

#### Example Command
```bash
$ grep -n is *.txt
```
- Output:
```plaintext
career.txt:1:Java  It is ocean but ever green!!!!
```

```bash
$ grep -n durga *.txt
```
- Output:
```plaintext
career.txt:4:durga
career.txt:7:durga ksdjfdlakjklfjad
subjects.txt:4:3. unix durga 250
subjects.txt:6:5. UNIX durga 400
subjects.txt:7:6. Java durga 1000
```

---

### 6 To Display Only File Names Where Pattern Exists

Use the `-l` option to display only the names of files that contain the specified pattern.

#### Example Command
```bash
$ grep -l durga *.txt
```
- Output:
```plaintext
career.txt
subjects.txt
```

---

### 7 To Print All Lines Except Those That Match the Pattern

Use the `-v` option to invert the search, displaying lines that do not contain the specified pattern.

#### Example Command
```bash
$ grep durga subjects.txt
```
- Output (shows lines with "durga"):
```plaintext
3. unix durga 250
5. UNIX durga 400
6. Java durga 1000
```

```bash
$ grep -v durga subjects.txt
```
- Output (shows lines without "durga"):
```plaintext
sno subjectname faculty fee
1. Python Nagoor 1000
2. java Sriman 2000
4. devops sriman 3500
```

---

### 8 To Search for Exact Words in the File

Use the `-w` option to search for whole words that match the pattern exactly.

#### Example Commands

```bash
$ grep -i unix demo.txt
```
- Output (case-insensitive search):
```plaintext
UnixDemo session
unix material
```

```bash
$ grep -iw unix demo.txt
```
- Output (case-insensitive, exact word match):
```plaintext
unix material
```


### 8 Example 2: Searching for Exact Words with Line Numbers

The `-in` and `-win` options allow you to search for exact words, with `-i` making the search case-insensitive and `-n` displaying line numbers.

#### Example Commands

```bash
$ grep -in unix demo.txt
```
- Output (case-insensitive search with line numbers):
```plaintext
5:UnixDemo session
6:unix material
9:UNIX classes and videos
```

```bash
$ grep -win unix demo.txt
```
- Output (whole-word match, case-insensitive, with line numbers):
```plaintext
6:unix material
9:UNIX classes and videos
```

---

### 9 Display Lines Before, After, or Surrounding the Search Results

To display additional lines around each match, use the `-A`, `-B`, or `-C` options.

- **`-A <number>`**: Shows the specified number of lines **after** each match.
- **`-B <number>`**: Shows the specified number of lines **before** each match.
- **`-C <number>`**: Shows the specified number of lines both **before and after** each match.
- **`-<number>`**: The `C` is optional for showing lines before and after.

#### Example Commands

```bash
$ grep friends demo.txt
```
- Output (shows only the matched line):
```plaintext
Hello friends how are you
```

```bash
$ grep -A 2 friends demo.txt
```
- Output (shows 2 lines after the matched line):
```plaintext
Hello friends how are you
DataScienceDemo
UnixDemo session
```

```bash
$ grep -B 2 friends demo.txt
```
- Output (shows 2 lines before the matched line):
```plaintext
This is java demo
this is python demo
Hello friends how are you
```

```bash
$ grep -C 2 friends demo.txt
```
- Output (shows 2 lines before and after the matched line):
```plaintext
This is java demo
this is python demo
Hello friends how are you
DataScienceDemo
UnixDemo session
```

```bash
$ grep -2 friends demo.txt
```
- Output (shows 2 lines before and after the matched line, `C` is optional):
```plaintext
This is java demo
this is python demo
Hello friends how are you
DataScienceDemo
UnixDemo session
```
