
## Copy and Paste Data
### Copy (Yank)
- `yy` : Copy the current line.
- `3yy` : Copy 3 lines.
- `yw` : Copy the current word.
- `3yw` : Copy 3 words.
- `y$` : Copy from the cursor to the end of the line.
- `y^` : Copy from the beginning of the line to the cursor.

### Paste
- `p` : Paste below the cursor.
- `P` : Paste above the cursor.

---

## Cursor Navigation Commands
- `k` : Move up.
- `j` : Move down.
- `l` : Move right.
- `h` : Move left.
- `3k` : Move up 3 lines.
- `3j` : Move down 3 lines.

#### Special Navigation
- `$` : Move to the end of the current line.
- `^` : Move to the beginning of the current line.
- `H` : Move to the top of the screen.
- `M` : Move to the middle of the screen.
- `L` : Move to the bottom of the screen.
- `G` : Move to the last line of the file.
- `:1` : Go to the first line.
- `:7` : Go to the 7th line.

#### Page Navigation
- `Ctrl+f` : Move one page forward.
- `Ctrl+b` : Move one page backward.

#### Word Navigation
- `b` : Move back to the beginning of the current/previous word.
- `3b` : Move back 3 words.
- `w` : Move forward to the beginning of the next word.
- `e` : Move to the end of the current word.

---

## Undo
- `u` : Undo the last operation.

---

## Save and Exit Commands
- `:w` : Save the file.
- `:wq` : Save and quit the editor.
- `:q` : Quit the editor.
- `:q!` : Force quit without saving changes.

---

## Line Numbers
- `:set nu` : Enable line numbers.
- `:set nonu` : Disable line numbers.

---

## Running Shell Commands
- `:!<unix_command>` : Execute any shell command.
  - Example:
    - `:!date` : Displays the current date.
    - `:!cal` : Displays the calendar.

---

## Example
To open a file and jump to a specific line:
```bash
vi +7 demo.txt
```
This opens `demo.txt` and positions the cursor on line 7.


## Working with the Nano Editor

- **Nano** is a command-line editor.
- It can be used to create new files and edit the content of existing files.
- It is almost like Notepad in functionality.

## Various Options:
| **Command**        | **Function**                                                |
|---------------------|------------------------------------------------------------|
| `Ctrl+G` / `F1`    | Display this help text.                                     |
| `Ctrl+X` / `F2`    | Close the current file buffer / Exit from nano.             |
| `Ctrl+O` / `F3`    | Write the current file to disk.                             |
| `Ctrl+R` / `F5`    | Insert another file into the current one.                   |
| `Ctrl+W` / `F6`    | Search forward for a string or a regular expression.        |
| `Ctrl+\` / `M-R`   | Replace a string or a regular expression.                   |
| `Ctrl+K` / `F9`    | Cut the current line and store it in the cutbuffer.         |
| `Ctrl+U` / `F10`   | Uncut from the cutbuffer into the current line.             |

### Most Important Commands:
- **`Ctrl+O`**: Save the content to the file.
- **`Ctrl+X`**: Quit the editor.
