
## What is Shell?

1. The shell is responsible for reading commands/applications provided by the user.
2. The shell will check whether the command is valid and properly used. If everything is correct, the shell interprets (converts) that command into a form understandable by the kernel. The interpreted command will then be handed over to the kernel.
3. The kernel is responsible for executing the command with the help of hardware.  
   
   The shell acts as an interface between the user and the kernel.  
   Together, the shell and kernel form the operating system.

### Types of Shells

There are several types of shells available:

### 1. Bourne Shell
- Developed by Stephen Bourne.
- This was the first shell developed for UNIX.
- We can access this shell using the `sh` command.

### 2. BASH Shell
- **BASH** stands for Bourne Again Shell.
- It is an advanced version of the Bourne Shell.
- This is the default shell for most Linux distributions.
- We can access this shell using the `bash` command.

### 3. Korn Shell
- Developed by David Korn.
- Mostly used in the IBM AIX operating system.
- We can access this shell using the `ksh` command.

### 4. C Shell
- Developed by Bill Joy.
- "C" refers to California University.
- It is also available by default with UNIX.
- We can access this shell using the `csh` command.

### 5. T Shell
- "T" stands for Terminal.
- It is an advanced version of the C Shell.
- This is the most commonly used shell in HP UNIX.
- We can access this shell using the `tcsh` command.

### 6. Z Shell
- Developed by Paul.
- We can access this shell using the `zsh` command.

**Note:** The most commonly used shell in Linux environments is BASH. It is more powerful than the other shells.

### How to Check the Default Shell in Our System?

You can check the default shell using the following commands:

```bash
$ echo $0
bash
$ echo $SHELL
/bin/bash
```

You can also check the default shell information inside the `/etc/passwd` file:

```bash
$ cat /etc/passwd
durgasoft:x:1000:1000:durgasoft,,,:/home/durgasoft:/bin/bash
```

---

### How to Check All Available Shells in Our System?

The `/etc/shells` file contains information about all available shells:

```bash
$ cat /etc/shells
# /etc/shells: valid login shells
/bin/sh
/bin/bash
/bin/rbash
/bin/dash
```

---

### How to Switch to Other Shells?

Based on your requirements, you can switch from one shell to another.

```bash
durgasoft@durgasoft:~/Desktop$ sh
$ echo $0
sh
$ exit
durgasoft@durgasoft:~/Desktop$ echo $0
bash
durgasoft@durgasoft:~/Desktop$ rbash
durgasoft@durgasoft:~/Desktop$ echo $0
rbash
durgasoft@durgasoft:~/Desktop$ exit
exit
durgasoft@durgasoft:~/Desktop$ dash
$ echo $0
dash
$ exit
```


```plaintext
┌───────────┐
│   User    │
│(Commands) │
└───────────┘
      │
      v
┌───────────┐
│   Shell   │
│ (bash, sh,│
│  csh, zsh)│
└───────────┘
      │
      v
┌───────────┐
│  Kernel   │
│ (System   │
│  Calls &  │
│  Hardware)│
└───────────┘
      │
      v
┌───────────┐
│ Hardware  │
│ (CPU,     │
│ Memory,   │
│ I/O)      │
└───────────┘
```

```bash
akshay@myubuntu:~/Documents/Linux$ cd Shell\ Scripting/
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ gedit test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ gedit test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ gedit test2.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ ls -l test.sh 
-rw-rw-r-- 1 akshay akshay 45 Nov 20 19:27 test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ chmod u+x test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ ls -l test.sh 
-rwxrw-r-- 1 akshay akshay 45 Nov 20 19:27 test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ ./test.sh 
welcome to shell scripting
Wed Nov 20 07:32:21 PM IST 2024
/home/akshay/Documents/Linux/Shell Scripting
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ ls -l test2.sh 
-rw-rw-r-- 1 akshay akshay 44 Nov 20 19:28 test2.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ chmod u+x test2.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ ./test2.sh 
Wed Nov 20 07:32:45 PM IST 2024
Wed Nov 20 07:32:45 PM IST 2024
Welcome to shell scripting
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ cal
   November 2024      
Su Mo Tu We Th Fr Sa  
                1  2  
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30  
                      
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ gedit test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ sh ./test.sh 
welcome to shell scripting
Wed Nov 20 07:34:17 PM IST 2024
/home/akshay/Documents/Linux/Shell Scripting
   November 2024      
Su Mo Tu We Th Fr Sa  
                1  2  
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30  
                      
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ bash ./test.sh 
welcome to shell scripting
Wed Nov 20 07:37:35 PM IST 2024
/home/akshay/Documents/Linux/Shell Scripting
   November 2024      
Su Mo Tu We Th Fr Sa  
                1  2  
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30  
                      
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ bash ./test2.sh 
Wed Nov 20 07:37:41 PM IST 2024
Wed Nov 20 07:37:41 PM IST 2024
Welcome to shell scripting
```