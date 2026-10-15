# Working with Files

## 1. Creation of Files

In Linux, we can create files in the following ways:

1. By using the `touch` command (to create an empty file)
2. By using the `cat` command
3. By using editors like `gedit`, `vi`, `nano`, etc.

### `cat` Command

```bash
cat > file1.txt
```

**Example:**

```bash
$ cat > file1.txt
Hello Friends
Listen Carefully
Otherwise Linux will give
Left and Right
```

- Press `ctrl+d` to save and exit.

If `file1.txt` is not already available, it will be created with the provided data. If `file1.txt` already exists with some content, the old data will be overwritten with the new data.

To append instead of overwriting, use `>>` with the `cat` command.

```bash
cat >> file1.txt
```

**Example:**

```bash
$ cat >> file1.txt
extra content
```

- Press `ctrl+d` to save and exit.

### Q&A

- **Q1. What is the difference between `touch` and `cat`?**

  `touch` is used for creating an empty file, whereas `cat` is used for creating a file with some content.

- **Q2. How can we perform overwriting and appending with the `cat` command?**

  `>` is meant for overwriting and `>>` is meant for appending/concatenation.

- **Q3. If we use the `touch` command, but the file is already available, what will happen?**

  The content of the file won't change, but the last modified date and time (timestamp) will be updated.

### Case Study

Assume that we have a shell script that sends all current date files to a remote server. This script doesn't run on Saturdays and Sundays. However, on Monday, it needs to send files from all three days. The script only recognizes current date files, so to change the timestamp of Saturday and Sunday files, we can use the `touch` command.

**Note:** The `touch` command can be used for two main purposes:
- To create an empty file
- To change the timestamp of an existing file

---

## 2. Viewing of Files

We can view the contents of a file using the following commands:

1. `cat`
2. `tac`
3. `rev`
4. `head`
5. `tail`
6. `less`
7. `more`

---

## Text Editors Comparison

- **`gedit`:** Similar to Windows Notepad
- **`vi` editor**
    - Open file: `vi file3.txt`
    - The editor opens in command mode
    - Enter insert mode: Press `i`
    - Add your required data
    - Return to command mode: Press `ESC`
    - Save and exit: Type `:wq`
- **`vim` editor:** Advanced version of `vi` editor
- **`nano` editor:** `nano file4.txt`
    - Save: `ctrl+O`
    - Exit: `ctrl+X`
