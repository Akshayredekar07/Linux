## Command Aliasing

- Alias means other alternative name or nickname.
- We can give our own more convinient nicknames for unix commands. This concept is
called command aliasing.

**Note:** we can use type command, to check whether the command is already available or
not.

**_How to Create Alias Names?_**
```bash
$ alias nickname='original command'
$ alias nickname="original command"

#  After aliasname space is not allowed. Hence the following are invalid

alias nickname ='original command'
alias nickname= 'original command'
alias nickname = 'original command'
```


**How to List all available Aliases?**
By using alias command without any arguments
```bash
$ alias
```

**How to Remove Alias Names?**
By using unalias command.
```bash
$ unalias alias_name
```
**Where we can use aliasing:**
1. If any lengthy command repeatedly required, then we can create shortcut alias name and we can use that short alias name every time.
```bash
alias d20f='mkdir dir1;touch dir1/file{1..20}.txt'
```


1. **List Files and Save to Output**
   - To list all files in the current working directory, save this data to `output.txt`, and display the number of lines to the terminal:
   ```bash
   alias current='ls -l | tee output.txt | wc -l'
   ```

2. **Using Windows Commands in Linux**
   - Create aliases for common Windows commands:
   ```bash
   alias cls='clear'
   alias rename='mv'
   ```

3. **Correct Typing Mistakes**
   - Create an alias for a common typo:
   ```bash
   alias grpe='grep'
   ```

4. **Handle Language Barriers**
   - In Germany, "datum" means "date". Create an alias for the date command:
   ```bash
   alias datum='date'
   ```

You can add these aliases to your `.bashrc` or `.bash_profile` file to make them permanent.


### Persisting Aliases Permanently

Aliases created in a terminal session are temporary and will be lost once the terminal is closed. To make them permanent, you can use one of the following methods:

#### 1st Way: Editing the `.bashrc` File
1. Open the `.bashrc` file in your home directory:
   ```bash
   gedit ~/.bashrc
   ```
2. Add your aliases to the file. For example:
   ```bash
   # My own aliases
   alias cls='clear'
   alias ddd='date; date; date'
   ```
3. **Note:** You need to close and reopen the terminal for the changes to take effect.

#### 2nd Way: Creating a `.bash_aliases` File
1. Create a file named `.bash_aliases` in your home directory:
   ```bash
   gedit ~/.bash_aliases
   ```
2. Add your aliases to this file. For example:
   ```bash
   alias ccc='cal; cal; cal'
   alias ct='cal; date'
   ```
3. **Note:** Again, you must close and reopen the terminal for the changes to take effect.

### FAQ

**Q1:** What is the Purpose of the Alias Command?  
**A:** To list all available aliases and to create new aliases.

**Q2:** How to Use the Unalias Command?  
- To remove a specific alias:
  ```bash
  unalias alias_name
  ```
- To remove all aliases:
  ```bash
  unalias -a
  ```

**Q3:** In which file do we define aliases to persist them?  
**A:** `.bashrc` or `.bash_aliases`.

**Q4:** Which of the following is a valid way of creating an alias?  
- A `alias rename ="mv"`
- B `alias rename= "mv"`
- C `alias rename = "mv"`
- D `alias rename="mv"`  
**Answer:** D  
*Note: While creating aliases, do not include spaces around the `=` sign.*