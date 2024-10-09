## Redirection

As Standard Input, Standard Output, and Standard Error are data streams, we can redirect these streams.

### Redirecting Standard Output

We can redirect standard output by using `>` and `>>` symbols.
- `>` will perform overwriting of existing data
- `>>` will perform appending to existing data

Example: To redirect the standard output of `cat` command from terminal to `output.txt`:

```
$ cat 1> output.txt
sample data
ctrl+d
```

Sample data won't be displayed to the terminal and will be written to `output.txt`.

**Note:** The redirection symbol `>` is always associated with 1 (Standard Output) by default. Hence, we are not required to specify 1 explicitly.


### Appending to a File

```bash
$ cat >> output.txt
sample data
ctrl+d
```

Instead of overwriting, if we want to perform appending, we should use `>>`.

### Redirecting Standard Error

We can redirect error messages from the terminal to our own file by using `>` and `>>` symbols.

```bash
$ cal 34 w3892384208342 2>> error.txt
```

Now the error message won't be displayed to the console and will be written to `error.txt`.
For error redirection, `2` is mandatory.

**Error Redirection**

We can implement error redirection by using `>` and `>>` symbols.

**Standard Error Stream** is associated with digit `2`.

```bash
$ cal pqr347 2>> error.txt #===>Error Redirection
```

```bash
$ cal abc721 >> error.txt #===>Output redirection
```


### Redirecting Standard Input

We can redirect standard input from keyboard to our required file.
We can perform input redirection by using the `<` symbol.

```bash
akshay@myubuntu:~/Documents/Linux$ cat 0<demo.txt
add some content here
add omre extra cotent here
this is extra line added after permission updated

added last line by akshay 
```

```bash
$ cat 0< a.txt 1>>output.txt 2>>error.txt
```

The `<` symbol is always associated with 0 by default. Hence we can remove it:

```bash
$ cat < a.txt >>output.txt 2>>error.txt
```

**Note:** To redirect both standard output and standard error to the same destination, we can use the following shortcut:

```bash
$ cat < a.txt &> output.txt
```

`&>` means both standard output and standard error.

### Redirecting Standard Output from One Terminal to Another Terminal

In Unix, everything is treated as a file, even our terminal.
We can find terminal-related files by using the `tty` command.

Terminal 2:
```bash
$ tty
/dev/pts/1
```

Terminal 1:
```bash
$ ls -l 1> /dev/pts/1
```

Terminal 1's long listing output will be displayed on Terminal 2.

## Bits

1. **In how many ways can a command get input?**
   - Answer: 2 ways
     1. From Standard Input
     2. From command line arguments

2. **Which of the following contains Data Streams?**
   - A. Standard Input
   - B. Standard Output
   - C. Standard Error
   - D. Command Line arguments
   - **Answer: A, B, C**

3. **By default, Standard Input is connected to:**
   - A. Terminal
   - B. Keyboard
   - C. A File
   - **Answer: B**

4. **True or False: By default, Standard Output is connected to Terminal.**
   - Answer: True

5. **True or False: By default, Standard Error is connected to Terminal.**
   - Answer: True

6. **What number represents the Standard Input Stream?**
   - Answer: 0

7. **What number represents the Standard Output Stream?**
   - Answer: 1

8. **What number represents Standard Error?**
   - Answer: 2

9. **How can we redirect Standard Output of the ls command to a file called output.txt?**
   - A  ls 2> output.txt
   - B  ls 0< output.txt
   - C  ls 1< output.txt
   - D  ls 1> output.txt
   - **Answer: D**
   
   Note:
   - `ls 2> output.txt` redirects standard error from terminal to output.txt
   - `ls 0< output.txt` redirects standard input from keyboard to output.txt
   - `ls 1< output.txt` is meaningless

10. **How can we redirect the Standard Output of the ls command to output.txt, while at the same time redirecting Standard Error to error.txt?**
    - Answer: 
      ```bash
      ls 1> output.txt 2> error.txt
      ```
      or
      ```bash
      ls > output.txt 2> error.txt
      ```

11. **Explain the difference between <, >, >> in Redirection?**
    - Answer:
      - `<` symbol is meant for input redirection
      - `>` symbol is meant for output redirection where the existing data will be overwritten
      - `>>` symbol is meant for output redirection where the data will be appended instead of overwriting