
# Components of UNIX

### Important Components:

- **a. Shell**
- **b. Kernel**

### a. Shell:
> It is the outer layer of the UNIX operating system.  
> Shell reads commands, whether they are valid or not.  
> Shell checks if the command is used properly.  
> If everything is correct, the shell interprets the command into a kernel-understandable form and hands it over to the kernel.  
> Shell acts as an interface between the user and the kernel.

### b. Kernel:
> It is the core component of the UNIX operating system.  
> It is responsible for executing commands with the help of hardware components.  
> Memory allocation and process allocation are managed by the kernel.  
> It acts as an interface between the shell and hardware components.

### Shell Script Example:

To perform a big task, multiple commands may be required.  
Create a new shell script file using the command:
```bash
gedit test.sh
```
Make the shell script executable with the command:
```bash
chmod u+x test.sh
```
Execute the shell script using the command:
```bash
./test.sh
```

## Types of Users in a Linux System:

- **Normal user**: `$` prompt  
- **Super user/Root user/Admin user**: `#` prompt  

Example session:

```bash
akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ whoami
akshay
akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ sudo -i
root@Ubuntu:~# whoami
root
root@Ubuntu:~# exit
logout
akshay@Ubuntu:~/Documents/DurgaSoft_Linux$
```

- `sudo -i`: Switch to superuser  
- `exit`: Return to the normal user

## Online UNIX Terminal:
[http://masswerk.at/jsuix](http://masswerk.at/jsuix)

## Most Commonly Used Linux Commands:
- `pwd`    : Print working directory  
- `ls`     : List all files and directories  
- `mkdir`  : Create a directory  
- `cd`     : Change directory  
- `touch`  : Create an empty file  
- `rmdir`  : Remove the directory  
- `rm`     : Remove a file  
- `date`   : Display current date and time  
- `help`   : Display available commands  
- `exit`   : Log out of the session  
- `clear`  : Clear the terminal  
- `hello`  : Display brief system information  

### `/` : Root directory in Linux  

- **User home directory for Durga**: `/home/durga`  
- **User home directory for Akshay**: `/home/akshay`

## More Commands in Linux:
- `alias`       : Sets an alias for a (complex) command  
- `apropos`     : Displays a short description of a command  
- `browse`      : Opens a web page in a new browser window  
- `cal`         : Displays a monthly calendar  
- `cat`         : Concatenates and outputs files  
- `chmod`       : Changes a file's permissions  
- `cp`          : Copies files from source to target  
- `echo`        : Writes all arguments back to the terminal  
- `man`         : Displays manual pages for a command  
- `mv`          : Moves (renames) files from source to target  
- `ps`          : Displays current processes  
- `uname`       : Displays the system identification  
- `vi`          : Visual editor (simpler version of standard UNIX vi)  
- `which`       : Evaluates which command will be executed  
- `web`         : Opens a web page in a new browser window  

For more commands, try [http://masswerk.at/jsuix](http://masswerk.at/jsuix).
```