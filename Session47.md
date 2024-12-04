
## Working with Editors

We can use editors to edit file content.  
There are multiple editors available:  

1. **geditor**  
2. **vi editor**  
3. **nano editor**  
   etc.

---

## 1. Working with geditor:  
It is a graphical editor, similar to Windows Notepad.  

### Commands:  

```bash
$ gedit file1.txt
$ gedit first.sh
```

### Script Example:
```bash
echo "This is my first shell script"
mkdir dir{1..6}
echo "six directories got created"
date
cal
```

### Making the Script Executable and Running It:  
```bash
$ chmod u+x first.sh
$ ./first.sh
```

### Note:
- **gedit** can work only on the desktop version and does not work on server versions.  
- If we are connecting to a remote server using **putty**, then **gedit** cannot be used.  
- In such cases, we must use **vi editor**.  

---

## Key Differences:  
- **gedit** and **nano** are Linux-based editors.  
- **vi editor** is Unix-based.  
- **vi editor** can work in both desktop and server environments.  



## Working with `vi` Editor

`vi` means **Visual Editor**. It is used to create new files or edit existing files.

### Basic Command to Open a File
```bash
vi file1.txt
```
- If `file1.txt` does not exist, a new file will be created and opened for editing.
- To save and exit this empty file, use `:wq` (`w` means save, and `q` means quit).

- If the file already exists, `vi` will open the file ready for editing.

---

## Modes in `vi`
The `vi` editor operates in three primary modes:

### 1. **Command Mode**
- This is the default mode.
- Allows the execution of `vi` commands.
- Switch to **Insert Mode** by pressing:
  - `i` (commonly used)
  - Other commands like `a`, `I`, etc.

### 2. **Insert Mode** (or Input Mode)
- Used to modify the file contents:
  - Insert new data.
  - Append to existing data.
- Return to **Command Mode** by pressing `<Esc>`.

### 3. **Exit Mode**
- Used to quit the editor.
- Accessed from **Command Mode** by typing `:`.

---

## Editing Commands in `vi`

### Insert and Append Data
- `A` : Append data at the end of the line.
- `I` : Insert data at the beginning of the line.
- `a` : Append data to the right of the cursor.
- `i` : Insert data to the left of the cursor.

### Delete Data
#### Character-wise Deletion
- `x` : Delete the character under the cursor.
- `3x` : Delete 3 characters.
- `X` : Delete the previous character.
- `3X` : Delete the previous 3 characters.

#### Word-wise Deletion
- `dw` : Delete the current word.
- `3dw` : Delete 3 words.

#### Line-wise Deletion
- `dd` : Delete the current line.
- `3dd` : Delete 3 lines.
- `d$` : Delete from the cursor to the end of the line.
- `d^` : Delete from the cursor to the beginning of the line.
- `dgg` : Delete from the start of the file to the cursor.
- `dG` : Delete from the cursor to the end of the file.

### Replace Data
- `r` : Replace the current character.
- `R` : Replace multiple characters.
- `S` or `cc` : Replace an entire line.

### Open New Lines
- `O` : Open a new line above the cursor.
- `o` : Open a new line below the cursor.

---
