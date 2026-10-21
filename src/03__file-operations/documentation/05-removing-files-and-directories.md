# **Removing Files and Directories**

Linux provides `rm` to remove files and directories. It removes items directly; there is no recycle bin or undo command. Check the path before you run `rm`, especially when using recursive removal or wildcards.

---

## **Remove Files with `rm`**

```bash
rm FILE                    # remove one file
rm FILE1 FILE2 FILE3       # remove several files
```

```bash
rm draft.txt
rm old-notes.txt temp.txt
```

After a successful command, the files are removed. `rm` normally asks for no confirmation when removing a file, so be certain that the names are correct. Use `ls` first if you need to inspect the target.

---

## **Remove Empty Directories**

Use `rmdir` to remove an empty directory:

```bash
rmdir empty-folder
```

`rmdir` refuses to remove a directory that still contains files or subdirectories. This makes it a useful choice when you only intend to remove an empty folder. To remove a directory with contents, use `rm -r` (see below).

---

## **Remove Directories and Their Contents with `-r`**

The `-r` (recursive) option removes a directory and everything inside it, including nested directories:

```bash
rm -r old-project
```

This removes `old-project` and its contents. It does not ask before each item unless you add an interactive option. Recursive removal is permanent, so inspect the directory and path before running it:

```bash
ls -la old-project
pwd
```

Use `rmdir` instead if the directory should be empty. For creating directories, see [01-creating-directories.md](01-creating-directories.md).

---

## **Common Options**

| Option | Meaning |
|---|---|
| `-i` | Ask before removing each file |
| `-I` | Ask once before removing more than three files or when removing recursively |
| `-f` | Force removal: ignore missing files and do not prompt |
| `-r`, `-R` | Remove directories and their contents recursively |
| `-v` | Verbose: print each removed item |
| `--help` | Show a short help text |

Options can be combined. For example, `rm -rv old-project` prints each removed item. For help on a command, see [08-command-syntax-and-help.md](../../01__fundamentals/documentation/08-command-syntax-and-help.md).

Use `-i` when you want a prompt for each item:

```bash
rm -i draft.txt old-notes.txt
```

Use `-I` for one confirmation before a larger removal:

```bash
rm -I -r old-project
```

Avoid `rm -f` and especially `rm -rf` unless you have a specific reason and have checked every part of the path. `-f` removes the interactive safeguard and suppresses errors for missing names; `-r` includes all nested contents.

---

## **Remove Several Files with Wildcards**

The shell expands wildcards before `rm` runs. A pattern such as `*.tmp` matches names ending in `.tmp` in the current directory:

```bash
ls *.tmp
rm -i *.tmp
```

First list the matches so you can verify them. `*` normally does not match hidden names that begin with a dot. Wildcards are covered in [08-wildcards.md](08-wildcards.md).

Be careful with patterns such as `*` and `.*`: they can match far more than you intend. Do not run a removal command until you have checked the current directory with `pwd` and confirmed the matches with `ls`.

---

## **Names That Start with a Dash**

A filename such as `-draft.txt` can be mistaken for an option. Put `--` before the filename to mark the end of options, or prefix the filename with `./`:

```bash
rm -- -draft.txt
rm ./-draft.txt
```

Quote names with spaces:

```bash
rm "old meeting notes.txt"
```

---

## **Symbolic Links**

When you remove a symbolic link, `rm` removes the link itself. It does not remove the file or directory the link points to:

```bash
rm shortcut
```

Check a link with `ls -l shortcut` before removing it if you are not sure what it points to. Links are explained in [07-hard-and-symbolic-links.md](07-hard-and-symbolic-links.md).

---

## **Try It**

Run these commands in your own terminal (WSL2 Ubuntu), starting from the repository root (the folder that contains `src`). The exercise uses `src/03__file-operations/lab/data`, the phase's sample-data area. It creates a separate `rm-practice` folder and removes only that folder at the end. Output order may differ on your system.

**1. Create practice files and directories**

```bash
mkdir -p src/03__file-operations/lab/data/rm-practice/{empty,project/src}
cd src/03__file-operations/lab/data/rm-practice
printf 'Temporary draft\n' > draft.txt
printf 'Keep for now\n' > keep.txt
printf 'print("hello")\n' > project/src/main.py
```

**2. Remove one file**

```bash
rm draft.txt
ls
```

`draft.txt` is gone. `keep.txt` and `project` remain.

**3. Remove a file with confirmation**

```bash
rm -i keep.txt
```

Type `y` and press `Enter` to remove it, or `n` to keep it. For the later cleanup step, either choice is fine.

**4. Remove an empty directory**

```bash
rmdir empty
```

`rmdir` succeeds because `empty` contains nothing.

**5. See `rmdir` protect a non-empty directory**

```bash
rmdir project
```

This fails because `project` contains `src/main.py`. Nothing is removed.

**6. Remove a directory recursively**

```bash
rm -ri project
```

Read each prompt carefully. Type `y` to remove an item or `n` to keep it. If you leave anything behind, the final cleanup removes the practice folder.

**7. Check what remains**

```bash
find . -maxdepth 3 -print
```

**8. Clean up the practice folder**

```bash
cd "$(git rev-parse --show-toplevel)"
rm -r src/03__file-operations/lab/data/rm-practice
```

> **Warning:** `rm -r` permanently removes the directory and everything inside it. Check the path before running the cleanup command. It removes only `rm-practice`.

---

## **Common Mistakes**

| Mistake | What happens | Fix |
|---|---|---|
| `rm folder` when `folder` is a directory | `rm` reports that it cannot remove a directory | Use `rmdir folder` if empty, or `rm -r folder` if you intend to remove its contents |
| `rmdir folder` when it contains files | It refuses to remove the directory | Remove or move the contents first, then use `rmdir`; use `rm -r` only if you intend to delete everything inside |
| Using `rm -rf` without checking the path | Removes files recursively without prompts | Check `pwd` and list the target first; prefer `rm -ri` for practice |
| `rm *.tmp` without checking matches | Removes every matching file in the current directory | Preview with `ls *.tmp`, then use `rm -i *.tmp` |
| `rm -draft.txt` | The name may be read as an option | Use `rm -- -draft.txt` or `rm ./-draft.txt` |
| `rm old notes.txt` | Treats the words as separate filenames | Quote the name: `rm "old notes.txt"` |
| Expecting a recycle bin or undo | `rm` removes the name immediately; recovery is not guaranteed | Verify the path and use interactive options when unsure |
| Removing a symbolic link and expecting its target to disappear | Only the link is removed | Remove the target separately only if that is what you intend |

---

## **Summary**

- `rm FILE` permanently removes a file. It normally does not ask for confirmation.
- `rmdir DIRECTORY` removes an empty directory only.
- `rm -r DIRECTORY` removes a directory and everything inside it. Check the path first.
- Use `-i` to confirm each item or `-I` for one confirmation before a larger removal.
- Preview wildcard matches with `ls`; quote names with spaces and use `--` for names starting with a dash.
- Removing a symbolic link removes the link, not its target.

---

## **Practice**

1. Write a command to remove `old.txt` after asking for confirmation.
2. Which command removes an empty directory named `temp`?
3. How do you remove a directory named `build` and all its contents?
4. What is the difference between `rm -i` and `rm -I`?
5. Why should you run `pwd` and list a directory before using `rm -r`?
6. How can you preview the files matched by `*.tmp` before removing them?
7. How do you remove a file named `-draft.txt`?
8. What does `rm "meeting notes.txt"` remove?
9. When removing a symbolic link with `rm`, what happens to its target?
10. Why is `rm -rf *` a dangerous command to run without checking your location and matches?
