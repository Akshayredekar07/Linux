**Shell Variables**  

Variables act as placeholders to hold values and are defined as key-value pairs in Shell programming. Shell variables do not have data types; all values are treated as text or string type.  

**Types of Variables**  
Variables in Shell are divided into two types:  
1. **Environment Variables / Predefined Variables**  
2. **User-Defined Variables**  

**Environment Variables**  
- Predefined variables used internally by the system; also referred to as **System Variables**.  
- Can be utilized in user scripts as per requirement.  
- Use `env` or `set` commands to display all environment variables:  

```bash
$ env
LANG=en_IN  
USERNAME=durgasoft  
USER=durgasoft  
PWD=/home/durgasoft  
HOME=/home/durgasoft  
SHELL=/bin/bash  
LOGNAME=durgasoft  
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/snap/bin:/home/durgasoft/scripts  
...  
```  

**Changing the Prompt**  
- The **PS1** environment variable determines the terminal prompt display.  
- Modify **PS1** to change the terminal prompt:  

```bash
$ PS1=DURGA$  
DURGA$ ls  
abc.txt Documents d.txt Pictures scripts Videos  
```  

**Demo Script Using Environment Variables**  
Create and execute the following script to use some environment variables:  

```bash
#!/bin/bash  
echo "User Name: $USER"  
echo "User Home Directory: $HOME"  
echo "Default Shell Name: $SHELL"  
echo "PATH: $PATH"  
```  

Execute with the following commands:  
```bash
$ chmod 755 env.sh  
$ ./env.sh  
```  

**User-Defined Variables**  
- Define custom variables based on programming requirements.  

Example:  
```bash
$ GUEST=Dhoni  
$ echo "Hello $GUEST You are my Hero"  
Hello Dhoni You are my Hero  
```  

**Rules for Defining Variables**  
1. Use **UPPERCASE** characters for variable names.  
2. Separate multiple words with underscores `_`.  
3. Variable names should not begin with a digit.  
   ```bash
   $ 123A=40  
   123A=40: command not found  
   ```  
4. Avoid special symbols like `-`, `@`, `#`, etc.  

**Read-Only Variables**  
- Use `readonly` keyword to define variables that cannot be reassigned.  

Example:  
```bash
$ A=100  
$ readonly A  
$ A=300  
bash: A: readonly variable  
```  
