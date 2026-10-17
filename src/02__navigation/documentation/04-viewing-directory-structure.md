# **Viewing Directory Structure**

`ls` shows one directory at a time. Two other commands help you see more:

- `tree` draws a whole directory structure as a picture made of text.
- `file` tells you what kind of file something is.

This note uses paths and `ls`. If they are not clear, read [01-paths-and-current-directory.md](01-paths-and-current-directory.md) and [03-listing-directories-with-ls.md](03-listing-directories-with-ls.md) first.

---

## **The `tree` Command**

`tree` lists directories and files in a tree shape. It goes into every subdirectory, so you can see the whole structure with one command.

```bash
tree            # the current directory
tree PATH       # another directory
```

Example output:

```text
.
├── archive
│   └── old.txt
└── project
    ├── docs
    │   └── guide.txt
    ├── README.md
    └── src
        └── app.sh

4 directories, 4 files
```

How to read it:

- The first line is the starting directory. A dot `.` means the current directory.
- Lines with `├──` and `└──` are the items inside a directory. The last item in a directory uses `└──`.
- The last line is a summary. It does not count the starting directory.
- Like `ls`, `tree` skips hidden files unless you ask for them. The sort order can also differ between systems, for example capital letters first or mixed in.

### **Install `tree`**

`tree` is often not installed on a fresh Ubuntu or WSL2. If you see `Command 'tree' not found`, install it. `sudo` is explained in [Phase 9](../../09__permissions/).

```bash
sudo apt update
sudo apt install tree
```

On the Red Hat family (RHEL, Fedora, CentOS), use `sudo dnf install tree`.

### **Useful Options**

| Option | Meaning |
|---|---|
| `-a` | Show hidden files too |
| `-d` | Show directories only |
| `-L N` | Go only `N` levels deep |
| `-f` | Show the full path for each item |
| `-h` | Show sizes in readable form (like `4.0K`) |
| `-s` | Show sizes in bytes |
| `-p` | Show permissions |
| `-I 'a\|b'` | **Hide** names that match the pattern |
| `-P 'pattern'` | Show **only** names that match the pattern |
| `--prune` | Remove empty directories from the output (use with `-P`) |
| `--dirsfirst` | List directories before files |

Notes:

- Put the pattern for `-I` and `-P` in single quotes, so the shell does not expand it. Use `|` to join several patterns.
- `-a` also shows a `.git` folder, which can be very large. Use `-I '.git'` with it.

### **`tree` or `ls -R`?**

| | `tree` | `ls -R` |
|---|---|---|
| Output | A tree picture | A list for each directory |
| Easy to read | Yes | Harder for deep folders |
| Limit the depth | Yes, with `-L` | No |
| Installed by default | Often not | Yes |

**Warning:** Do not run `tree /`. It tries to print the whole system and floods your screen. If this happens, press `Ctrl+C`. Use `tree -L 1 /` or `tree -L 2` on a small folder instead.

---

## **The `file` Command**

On Linux, a name like `photo.jpg` is only a name. It does not prove what is inside. The `file` command looks at the **content** of a file (the first bytes, called magic numbers) and tells you the real type.

```bash
file notes.txt
file docs
file /bin/ls
```

Example output:

```text
notes.txt: ASCII text
docs: directory
/bin/ls: ELF 64-bit LSB pie executable, x86-64, ...
```

Common results:

| Output | Meaning |
|---|---|
| `ASCII text` or `UTF-8 Unicode text` | A plain text file |
| `empty` | A file with no content |
| `directory` | A directory |
| `symbolic link to ...` | A symbolic link |
| `Bourne-Again shell script, ASCII text executable` | A Bash script |
| `ELF 64-bit LSB ... executable` | A compiled program (ELF is the program format on Linux) |
| `JPEG image data`, `PNG image data` | Image files |
| `gzip compressed data` | A file compressed with gzip |

The ELF line is long and different on every system, so yours will not match the example.

### **Useful Options**

| Option | Meaning |
|---|---|
| `-b` | Brief: print only the type, without the file name |
| `-i` | Print the MIME type, such as `text/plain; charset=us-ascii` |
| `-L` | Follow symbolic links and describe what they point to |

### **`file` and the File Types**

In [05-file-types.md](../../01__fundamentals/documentation/05-file-types.md) you learned the seven file types, and `ls -l` shows the first letter of each (`-`, `d`, `l`, and so on). `file` is different: it also looks **inside** regular files, so it can tell a text file from a program or an image. For more details about one file, such as size and times, see [05-file-details-and-checksums.md](../../04__viewing-comparing/documentation/05-file-details-and-checksums.md).

---

## **Try It**

Run these in your own terminal (WSL2 Ubuntu) before you commit. The lab uses `mkdir`, `touch`, `echo >`, and `printf` to make files. They are explained in [Phase 3](../../03__file-operations/) and [Phase 6](../../06__streams-pipes/). Numbers and the order of names may differ on your system.

**1. Install `tree` (only if it is missing)**

```bash
tree --version
sudo apt update
sudo apt install tree
```

If `tree --version` prints a version, skip the other two commands.

**2. Build a practice folder**

```bash
mkdir -p ~/tree-lab/project/src ~/tree-lab/project/docs ~/tree-lab/archive
cd ~/tree-lab
echo "# Demo" project/README.md
echo "Welcome" project/docs/guide.txt
echo "old data" archive/old.txt
printf '#!/bin/bash\necho hi\n' project/src/app.sh
touch .config
```

**3. Draw the tree**

```bash
tree
```

Example output:

```text
.
├── archive
│   └── old.txt
└── project
    ├── docs
    │   └── guide.txt
    ├── README.md
    └── src
        └── app.sh

4 directories, 4 files
```

**4. Show hidden files, directories only, and limit the depth**

```bash
tree -a
tree -d
tree -L 1
```

Example output:

```text
.
├── archive
│   └── old.txt
├── .config
└── project
    ├── docs
    │   └── guide.txt
    ├── README.md
    └── src
        └── app.sh

4 directories, 5 files
.
├── archive
└── project
    ├── docs
    └── src

4 directories
.
├── archive
└── project

2 directories, 0 files
```

The position of `.config` can be different on your system.

**5. Start from another directory and show full paths**

```bash
tree project
tree -f project/docs
```

Example output:

```text
project
├── docs
│   └── guide.txt
├── README.md
└── src
    └── app.sh

2 directories, 3 files
project/docs
└── project/docs/guide.txt

1 directory, 1 file
```

**6. Hide or select names**

```bash
tree -I 'docs|archive'
tree -P '*.txt' --prune
```

Example output:

```text
.
└── project
    ├── README.md
    └── src
        └── app.sh

2 directories, 2 files
.
├── archive
│   └── old.txt
└── project
    └── docs
        └── guide.txt

3 directories, 2 files
```

**7. Find out the real file type**

```bash
file project/docs/guide.txt
file project/src/app.sh
file archive
file -b project/docs/guide.txt
file -i project/docs/guide.txt
```

Example output:

```text
project/docs/guide.txt: ASCII text
project/src/app.sh: Bourne-Again shell script, ASCII text executable
archive: directory
ASCII text
project/docs/guide.txt: text/plain; charset=us-ascii
```

**8. A wrong name does not fool `file`**

```bash
echo "not a picture" fake.jpg
touch empty.txt
file fake.jpg
file empty.txt
```

Example output:

```text
fake.jpg: ASCII text
empty.txt: empty
```

The name says `.jpg`, but the content is plain text. `file` tells the truth.

**9. System files and errors**

```bash
file /bin
file -L /bin
file /bin/ls
file nothing
```

Example output:

```text
/bin: symbolic link to usr/bin
/bin: directory
/bin/ls: ELF 64-bit LSB pie executable, x86-64, ...
nothing: cannot open `nothing' (No such file or directory)
```

`/bin` is a symbolic link to `usr/bin`. This is the merged `/usr` from [06-file-hierarchy.md](../../01__fundamentals/documentation/06-file-hierarchy.md). The `-L` option follows the link and shows what it points to.

**10. Clean up**

**Warning:** `rm -r` deletes a folder and everything inside it, with no undo. Check the path before you press Enter. Move out of the folder first.

```bash
cd ~
rm -r ~/tree-lab
```

---

## **Common Mistakes**

| Mistake | What happens | Fix |
|---|---|---|
| Running `tree` when it is not installed | `Command 'tree' not found` | Install it with `sudo apt install tree` |
| `tree /` | Floods the screen with the whole system | Press `Ctrl+C`. Use `tree -L 1 /` |
| Looking for hidden files with plain `tree` | Hidden files are not shown | Use `tree -a` |
| `tree -a` in a Git folder | A huge `.git` listing | Use `tree -a -I '.git'` |
| `tree -I docs|archive` without quotes | The shell reads `\|` as a pipe and the command breaks | Quote the pattern: `-I 'docs\|archive'` |
| Trusting the file extension | A `.jpg` can really be a text file | Run `file NAME` to see the real type |
| Expecting `file` to open a file | It only describes the file | Use `cat` or `less` to read it (Phase 4) |
| `file nothing` | `cannot open ... (No such file or directory)` | Check the name with `ls` |
| Expecting every `ELF` line to look the same | Details differ between systems | Read only the first words, like `ELF 64-bit LSB executable` |

---

## **Summary**

- `tree` shows a whole directory structure as a tree. Install it with `sudo apt install tree` if it is missing.
- `tree -a` shows hidden files, `-d` shows directories only, and `-L N` limits the depth.
- `-I` hides names and `-P` shows only matching names. Quote the patterns.
- Never run `tree /`. Use `-L` to keep the output small.
- `file` shows the real type of a file from its content, not from its name.
- `file -b` shows the type only, `file -i` shows the MIME type, and `file -L` follows links.

---

## **Practice**

1. Which command shows only directories, two levels deep, starting from `~`?
2. What does the last line of the `tree` output mean? Does it count the starting directory?
3. Why can `tree -a` be a problem inside a Git project? How do you fix it?
4. Write a command that shows only `.txt` files and removes empty directories from the output.
5. What is the difference between `tree` and `ls -R`? Give one case where you would pick each.
6. A file is named `holiday.jpg`. How do you check that it is really a picture?
7. What does `file empty.txt` print for a file with no content?
8. What does `file /bin` print on Ubuntu? Which option makes it print `directory`?
9. Why should you quote the pattern in `tree -I 'docs|archive'`?
10. Why is `tree /` a bad idea? What do you press to stop it?