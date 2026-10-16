# **Listing Directories with `ls`**

The `ls` command lists the files and directories inside a directory. It is the command you will use most often after `cd`.

This note uses paths and `cd`. If they are not clear, read [01-paths-and-current-directory.md](01-paths-and-current-directory.md) and [02-directory-navigation.md](02-directory-navigation.md) first.

---

## **Basic Use**

```bash
ls              # list the current directory
ls /etc         # list another directory (absolute path)
ls ../docs      # list a directory using a relative path
ls notes.txt    # if the argument is a file, ls just prints its name
ls dir1 dir2    # list more than one directory
```

When you give no path, `ls` lists the current directory.

By default, `ls`:

- sorts names in alphabetical order. The exact order (for example, capital letters first or mixed with small letters) depends on your language settings, so it can differ between systems.
- does **not** show hidden files. These are names that start with a dot. See [07-hidden-directories.md](../../01__fundamentals/documentation/07-hidden-directories.md).
- may show colors. On Ubuntu, `ls` is an alias for `ls --color=auto`. Usually directories are blue, executable files are green, and symbolic links are cyan. Colors can change between terminals, so do not depend on them.

---

## **Common Options**

An option changes how `ls` works. Options start with `-`. You can join short options, so `ls -l -a -h` is the same as `ls -lah`.

| Option | Meaning |
|---|---|
| `-a` | Show **all** files, including hidden ones, `.` and `..` |
| `-A` | Show hidden files, but **not** `.` and `..` |
| `-l` | Long format: one file per line with details |
| `-h` | Human-readable sizes like `4.0K` or `1.2M` (use with `-l`) |
| `-d` | Show the directory itself, not what is inside it |
| `-R` | Recursive: also list everything inside subdirectories |
| `-F` | Add a mark after names: `/` directory, `*` executable, `@` symbolic link |
| `-t` | Sort by modified time, newest first |
| `-S` | Sort by size, largest first |
| `-r` | Reverse the sort order |
| `-1` | One name per line (the digit one) |
| `-i` | Show the inode number of each file |

Useful combinations:

| Command | Use |
|---|---|
| `ls -lah` | Long list, hidden files, readable sizes |
| `ls -ltr` | Long list, oldest first, newest at the **bottom** (easy to read in a long list) |
| `ls -lS` | Long list, biggest files first |
| `ls -ld DIR` | Details of the directory itself |

On Ubuntu, `ll` is a ready-made alias for `ls -alF`. Other distributions may not have it. Aliases are explained in [Phase 11](../../11__shell-basics/).

---

## **Reading `ls -l` Output**

```text
-rw-r--r-- 1 akshay akshay   12 ... notes.txt
drwxr-xr-x 2 akshay akshay 4096 ... docs
```

| Column | Example | Meaning |
|---|---|---|
| 1. Type and permissions | `-rw-r--r--` | The first character is the file type. The next nine are permissions. |
| 2. Link count | `1` | Number of hard links to the file |
| 3. Owner | `akshay` | The user who owns the file |
| 4. Group | `akshay` | The group that owns the file |
| 5. Size | `12` | Size in bytes |
| 6. Date and time | `...` | When the file was last modified |
| 7. Name | `notes.txt` | File or directory name |

First character of column 1:

| Character | File type |
|---|---|
| `-` | Regular file |
| `d` | Directory |
| `l` | Symbolic link |

There are more types. See [05-file-types.md](../../01__fundamentals/documentation/05-file-types.md). The permission letters are explained in [Phase 9](../../09__permissions/).

Things to know:

- The first line, `total`, is the disk space used by the listed files, counted in blocks. It is **not** the number of files.
- The size of a directory (often `4096`) is the size of the directory entry itself. It is not the size of what is inside.
- Files changed in the last six months show a time (like `10:30`). Older files show a year.

---

## **Listing a Directory Itself**

`ls -l docs` shows what is **inside** `docs`. To see details of `docs` itself, use `-d`:

```bash
ls -l docs      # contents of docs
ls -ld docs     # the docs directory itself
```

`-d` is also useful with wildcards. The shell expands `*/` to all directory names, so this lists only directories:

```bash
ls -d */
```

The shell, not `ls`, expands `*`. Wildcards are explained fully in a later phase.

---

## **Listing Subdirectories with `-R`**

`ls -R` lists a directory and everything below it. Each directory gets its own heading.

> **Warning:** Do not run `ls -R /`. It prints the whole system and floods your screen. If this happens, press `Ctrl+C` to stop it. Use `-R` only on small folders.

---

## **Try It**

> Run these in your own terminal (WSL2 Ubuntu) before you commit. The lab uses `mkdir`, `touch`, and `echo >` to make files. They are explained in [Phase 3](../../03__file-operations/) and [Phase 6](../../06__streams-pipes/). Dates are shown as `...`, and numbers may differ on your system.

**1. Build a practice folder**

```bash
mkdir -p ~/ls-lab/docs ~/ls-lab/scripts
cd ~/ls-lab
echo "hello linux" > notes.txt
echo "line one" > readme.txt
touch .secret docs/a.txt docs/b.txt scripts/hello.sh
```

**2. Plain `ls` and hidden files**

```bash
ls
ls -a
ls -A
```

Example output:

```text
docs  notes.txt  readme.txt  scripts
.  ..  .secret  docs  notes.txt  readme.txt  scripts
.secret  docs  notes.txt  readme.txt  scripts
```

The position of `.secret` can be different on your system.

**3. Long format**

```bash
ls -l
ls -lh
```

Example output:

```text
total 16
drwxr-xr-x 2 akshay akshay 4096 ... docs
-rw-r--r-- 1 akshay akshay   12 ... notes.txt
-rw-r--r-- 1 akshay akshay    9 ... readme.txt
drwxr-xr-x 2 akshay akshay 4096 ... scripts
total 16K
drwxr-xr-x 2 akshay akshay 4.0K ... docs
-rw-r--r-- 1 akshay akshay   12 ... notes.txt
-rw-r--r-- 1 akshay akshay    9 ... readme.txt
drwxr-xr-x 2 akshay akshay 4.0K ... scripts
```

`notes.txt` is 12 bytes: 11 letters plus the new line that `echo` adds.

**4. Marks, one per line, and the directory itself**

```bash
ls -F
ls -1
ls -l docs
ls -ld docs
ls -d */
```

Example output:

```text
docs/  notes.txt  readme.txt  scripts/
docs
notes.txt
readme.txt
scripts
total 0
-rw-r--r-- 1 akshay akshay 0 ... a.txt
-rw-r--r-- 1 akshay akshay 0 ... b.txt
drwxr-xr-x 2 akshay akshay 4096 ... docs
docs/  scripts/
```

**5. Recursive listing**

```bash
ls -R
```

Example output:

```text
.:
docs  notes.txt  readme.txt  scripts

./docs:
a.txt  b.txt

./scripts:
hello.sh
```

**6. Sort by size**

```bash
mkdir sizes
cd sizes
echo 12345 > a-small.txt
echo 1234567890123456789 > b-big.txt
echo 1234567890 > c-medium.txt
ls
ls -lS
ls -lSr
```

Example output:

```text
a-small.txt  b-big.txt  c-medium.txt
total 12
-rw-r--r-- 1 akshay akshay 20 ... b-big.txt
-rw-r--r-- 1 akshay akshay 11 ... c-medium.txt
-rw-r--r-- 1 akshay akshay  6 ... a-small.txt
total 12
-rw-r--r-- 1 akshay akshay  6 ... a-small.txt
-rw-r--r-- 1 akshay akshay 11 ... c-medium.txt
-rw-r--r-- 1 akshay akshay 20 ... b-big.txt
```

**7. Sort by time**

```bash
mkdir ../times
cd ../times
touch first.txt
sleep 1
touch second.txt
sleep 1
touch third.txt
ls -t
ls -tr
```

Example output:

```text
third.txt  second.txt  first.txt
first.txt  second.txt  third.txt
```

Try `ls -ltr` too. The newest file is at the bottom.

**8. System directories and errors**

```bash
ls -ld /bin
ls nothing
ls *.xyz
ls /root
```

Example output:

```text
lrwxrwxrwx 1 root root 7 ... /bin -> usr/bin
ls: cannot access 'nothing': No such file or directory
ls: cannot access '*.xyz': No such file or directory
ls: cannot open directory '/root': Permission denied
```

The first line starts with `l`, so `/bin` is a symbolic link to `usr/bin`. This is the merged `/usr` from [06-file-hierarchy.md](../../01__fundamentals/documentation/06-file-hierarchy.md). The `/root` error is normal for a regular user.

**9. See the `ll` alias**

```bash
type ll
```

Example output:

```text
ll is aliased to `ls -alF'
```

**10. Clean up**

> **Warning:** `rm -r` deletes a folder and everything inside it, with no undo. Check the path before you press Enter. Move out of the folder first.

```bash
cd ~
rm -r ~/ls-lab
```

---

## **Common Mistakes**

| Mistake | What happens | Fix |
|---|---|---|
| `ls-l` (no space) | `command not found` | Type `ls -l` with a space |
| `LS` or `Ls` | `command not found`, because Linux is case-sensitive | Use small letters: `ls` |
| Looking for a hidden file with plain `ls` | The file is not shown | Use `ls -a` or `ls -A` |
| `ls -l docs` to see details of `docs` | It shows what is inside `docs` | Use `ls -ld docs` |
| `ls -h` alone | No change, because `-h` only affects sizes in `-l` | Use `ls -lh` |
| `ls -R /` | Floods the screen | Press `Ctrl+C`. Use `-R` on a small folder |
| Reading `total 16` as "16 files" | Wrong count | `total` is disk blocks, not a file count |
| Thinking a directory size of `4096` is its content size | Wrong size | It is the size of the directory entry. Use `du` (Phase 19) for content size |
| `ls *.txt` when no file matches | `cannot access '*.txt'` error | Run `ls` first and check the names |

---

## **Summary**

- `ls` lists the current directory. `ls PATH` lists another one.
- `-a` shows hidden files. `-A` does the same without `.` and `..`.
- `-l` gives details. `-h` makes sizes readable. `-lah` is a very common combination.
- `-d` shows the directory itself. `-R` lists subdirectories. `-F` marks types.
- `-t` sorts by time. `-S` sorts by size. `-r` reverses the order.
- In `ls -l`, the first character shows the file type: `-`, `d`, or `l`.
- `total` is disk blocks, and a directory size of `4096` is not its content size.
- Names are sorted by your language settings, so the order may differ between systems.

---

## **Practice**

1. Which command lists hidden files too? What is the difference between `-a` and `-A`?
2. What does each part of `-rw-r--r--` and `drwxr-xr-x` start with, and what does that first character mean?
3. Which command shows the details of the `/etc` directory itself, not its contents?
4. Write one command that shows the biggest files first, with readable sizes and hidden files.
5. Which command shows the newest file at the bottom of a long list?
6. What does `ls -F` add to a directory name? To a symbolic link?
7. Why is `ls -R /` a bad idea? How do you stop it?
8. Why does `ls *.xyz` show an error when no `.xyz` file exists?
9. What does `ls -ld /bin` show on Ubuntu, and why?
10. What does the `total` line in `ls -l` mean?