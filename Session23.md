

## Commands and Data Streams

1. Commands can take input, perform required operations, and produce output.

2. While executing a command, if anything goes wrong, we will get an error message.

3. Commands can take input from:
   - Standard Input
   - Command line arguments

4. Commands will produce results to:
   - Standard Output
   - Standard Error

5. Standard Input, Standard Output, and Standard Error are data streams and can flow from one place to another. Hence, redirection and piping are possible.

6. Command line arguments are static and are not streams. Hence, redirection and piping concepts are not applicable to command line arguments.

7. These data streams are associated with specific numbers:
   - Standard Input: 0
   - Standard Output: 1
   - Standard Error: 2

8. By default:
   - Standard Input is connected to the keyboard
   - Standard Output and Standard Error are connected to the terminal

9. We can redirect these default connections.

![Data Stream](images/image.png

## Standard Input from Keyboard and Output to Standard Output

### Device: `$cat`

```
read required input from the keyboard
this data will be displayed to the standard output.
ctrl+d
```

**Note:** For the `cat` command, if we are not providing any arguments, then the input will be taken from the standard input device (keyboard) and the output will be displayed to the standard output device (terminal).)

## Standard Input to Standard Output

```
$ cat
This is data provided from Standard Input
This is data provided from Standard Input

akshay@myubuntu:~/Documents/Linux$ cat
This is my new Linux 24.04 LTS # This is input
This is my new Linux 24.04 LTS # This is output
This is my first line in linux terminal # This is input
This is my first line in linux terminal # This is output
```

## Input from Command Line Arguments and Error Messages to Standard Error

```
$ rm file100
rm: cannot remove 'file100': No such file or directory
```

We are providing the filename as a command line argument to the `rm` command. The specified file is not available, hence this command produces an error message to the Standard Error device (Terminal).

**Note:** Some commands may accept Standard Input and some commands may accept command line arguments.

1. `rm` command will always accept command line arguments only:
   ```
   rm file1 file2
   ```

2. `echo` command will always accept command line arguments only:
   ```
   echo "durgasoft"
   ```

3. `cat` command can accept input either from standard input or from command line arguments.

