## piping

### What is piping?

Sometimes we can use output of one command as input to another command. This
concept is called piping.
By using piping, multiple commands will work together to fulfill our requirement.

![piping](/images/piping.png)

- We can implement piping by using vertical bar (|).

```bash
ls -l /etc | wc
```
output
```
215 1940 11872
```
- First ls got executed and the output of this command will become input to wc command.

Eg 2: 
```bash
ls -l /etc | more
```

Eg 3: 
```bash
ls -l /etc | wc |wc -l
```
The output is: 1

Eg 4:
```bash
ls -l /etc | head -5
```

**Note**: instead of ls -l we can use ll command, most of linux flavours provides support.


### Tee Command:

**Requirement:**
- The output of the ls command should be saved to output.txt and should be provided as
input to wc command:
```bash
ls -l 1>output.txt | wc
```
- This command won't work because if we are using redirection in the middle of piping, it
will break piping concept.
- In piping, if we want to save the output of one command to a file and if we want to pass
that output as input to next command simultaneously, then we should go for tee
command.

**tee command is just like T-Junction or T-Pipe. It will take one input but provides two outputs.**

![piping](/images/tee.png)

**Eg 1:** To save the output of ls command to a file and to display to the terminal simultaneously.
```bash
ls –l 
```
- It will display to the terminal

```bash
ls -l > abc.txt
```
- It will save to the abc.txt but won't display to the terminal.

```bash
ls -l | tee abc.txt
```

```bash
akshay@myubuntu:~/Documents/Linux$ ls -l | tee output.txt | wc > wc.txt
akshay@myubuntu:~/Documents/Linux$ cat wc.txt 
     62     573    4313
akshay@myubuntu:~/Documents/Linux$ ls -l | tee output.txt | wc | tee wc.txt
     62     573    4313
akshay@myubuntu:~/Documents/Linux$ 
```

![piping](/images/tee2.png)


Eg 2: To save the output of ls command to a file and send that output as input to wc command

```bash
ls -l | tee output.txt | wc -l
```


### xargs Command:

**Q1. Display the output of date command by using echo command with Piping Concept?**

```bash
date | echo 
```

- It won't work because the output of date command is stream, but
echo command will accept only command line arguments but not stream.

```bash
date | xargs echo
```

`xargs` command will convert the output stream of date command into command line arguments and these arguments will be passed as input to echo command.

- Hence the job of xargs command is to convert output stream into command line
arguments

Eg 1: Assume input.txt contains file names. Each file contains some data.
Read file names from the input.txt, write total content to output.txt and display the total number of lines present in output.txt.

```bash
cat input.txt | xargs cat | tee output.txt | wc -l
```
Eg 2: Assume input.txt contains file names. Read file names from the input.txt and remove all these files.

```bash
cat input.txt | xargs rm
```

**Assignment:**

1. list out all contents of /dev folder and save to file1.txt.
2. list out all contents of /bin folder and save to file2.txt.c
3. Write a single pipeline for the following requirement:
   - read content of file1 and file2, save to fil3.txt. 
   By using sort command reverse contents of file3.txt and save to sorted.txt.

```bash
ls /dev > file1.txt

ls /bin > file2.txt

cat file1.txt file2.txt | tee file3.txt | sort -r > sorted.txt
```
**Q2. What is Piping?**
- A. A way of connecting commands together.
- B. A way of passing data from the standard output of one command to the standard input of another command.

Ans: A,B

**Q3. How to Pipe Standard Output of X Command to the Standard Input of Y Command?**
- A. X > Y
- B. X >> Y
- C. X < Y
- D. X | Y

Ans: D

**Q4. How we can use tee Command when Piping together Commands A, B and C to save Output of B Command to results.txt.**
```bash
A | B | tee results.txt | C
```

**Q5. How to Pipe Data from Command A to Command B, but B won't accept
Standard Input and accepts only Command Line Arguments?**

```bash
A | xargs B
```