# **Creating Files**

Files hold things such as notes, source code, configuration, and data. Linux has several ways to create a file. Use `touch` when you need an empty file, a text editor when you want to write interactively, or shell redirection when a command should write text into a file.

---

## **Create an Empty File with `touch`**

```bash
touch NAME                 # create one empty file
touch NAME1 NAME2 NAME3    # create several empty files
```

```bash
touch notes.txt
touch index.html style.css app.js
touch src/main.py
```

The parent directory must already exist. `touch src/main.py` fails if `src` does not exist. Create the directory first with `mkdir -p src` (see [01-creating-directories.md](01-creating-directories.md)).

`touch` does not create directories. It also does not erase a file that already exists: it updates the file's access and modification timestamps. Use `ls -l` to see the modified time.

---

## **Common Options**

| Option | Meaning |
|---|---|
| `-c`, `--no-create` | Do not create a file if it does not already exist; timestamps can still be updated on existing files |
| `-a` | Change only the access time |
| `-m` | Change only the modification time |
| `-t STAMP` | Set the time using a timestamp such as `202610191430` |
| `--help` | Show a short help text |

Most beginners only need `touch NAME`. `-c` is useful when you want to update timestamps without accidentally creating a missing file:

```bash
touch -c existing.txt missing.txt
```

This updates `existing.txt` and leaves `missing.txt` absent. For more about command help, see [08-command-syntax-and-help.md](../../01__fundamentals/documentation/08-command-syntax-and-help.md).

---

## **Write Text into a File**

The shell can send command output into a file using redirection. Redirection is a shell feature, not a `touch` option. Stream handling is covered in [Phase 6](../../06__streams-pipes/).

| Command | Result |
|---|---|
| `printf 'Hello\n' > hello.txt` | Create the file or replace its contents |
| `printf 'Another line\n' >> hello.txt` | Create the file if needed, or add text to the end |
| `cat > notes.txt` | Type lines; press `Ctrl+D` on an empty line to finish |

Be careful with `>`: it **overwrites** an existing file, including replacing all its text. `>>` appends instead.

```bash
printf 'First line\n' > notes.txt
printf 'Second line\n' >> notes.txt
cat notes.txt
```

Example output:

```text
First line
Second line
```

Use `printf` for predictable text and newlines. `echo` is also common for short examples, but its handling of special characters can vary between shells:

```bash
echo 'Hello, Linux' > greeting.txt
```

To write or edit longer text, use a terminal editor such as `nano`:

```bash
nano notes.txt
```

In Nano, type the text, press `Ctrl+O` to save, press `Enter` to confirm the name, and press `Ctrl+X` to exit. If Nano is not installed, use the editor available in your Linux environment.

---

## **Create Several Files and a Project Skeleton**

Give `touch` multiple names to create several files at once:

```bash
touch README.md LICENSE .gitignore
```

You can combine `mkdir -p` and `touch` to lay out a small project. The directory must be created before the files inside it:

```bash
mkdir -p website/{css,js,images}
touch website/index.html website/css/style.css website/js/app.js
```

The `{css,js,images}` part is Bash brace expansion. The shell expands it before `mkdir` runs. See [01-creating-directories.md](01-creating-directories.md) for more brace expansion examples.

Check the result with `find` or `ls`:

```bash
find website -type f
```

Example output (the order may differ):

```text
website/index.html
website/css/style.css
website/js/app.js
```

---

## **Create Files in Another Location**

`touch` accepts relative and absolute paths. You do not need to change directories first.

```bash
touch ~/notes/todo.txt
touch /tmp/example.txt
```

The containing directory must exist, and you need permission to write there. A relative path is interpreted from the current directory; an absolute path starts at `/`. Use `pwd` to check your location. See [01-paths-and-current-directory.md](../../02__navigation/documentation/01-paths-and-current-directory.md).

| Path | Example | Meaning |
|---|---|---|
| Relative | `touch drafts/idea.txt` | `drafts` under the current directory |
| Home shortcut | `touch ~/idea.txt` | `idea.txt` in your home directory |
| Absolute | `touch /tmp/idea.txt` | `idea.txt` under `/tmp` |

---

## **File Names and Paths**

| Rule | Details |
|---|---|
| Letters, digits, `.`, `_`, `-` | Safe choices for names |
| Case-sensitive | `Notes.txt` and `notes.txt` are different files |
| `/` in a path | Separates directories; it cannot be part of one name |
| Leading dot | `.env` is hidden from a plain `ls` listing |
| Leading dash | `-draft` may look like an option; use `touch -- -draft` or `touch ./-draft` |
| Spaces | Allowed, but quote the complete name: `touch "meeting notes.txt"` |
| Maximum name length | Common Linux filesystems allow up to 255 bytes for one name |

Without quotes, `touch meeting notes.txt` creates two files: `meeting` and `notes.txt`. Prefer simple lowercase names with `-` or `_`, such as `meeting-notes.txt`.

---

## **Try It**

Run these commands in your own terminal (WSL2 Ubuntu). Work in your Linux home folder, not under `/mnt/c` or `/mnt/d`, because file permissions can behave differently there. Dates, usernames, and file order may differ on your system.

**1. Create an empty file and inspect it**

```bash
mkdir -p ~/file-lab
cd ~/file-lab
touch todo.txt
ls -l todo.txt
```

The size should be `0` because the file is empty.

**2. Create multiple files**

```bash
touch one.txt two.txt three.txt
ls
```

**3. Notice what `touch` does to an existing file**

```bash
printf 'Keep this text\n' > one.txt
cat one.txt
touch one.txt
cat one.txt
```

`touch` updates the timestamp. It leaves the contents unchanged.

**4. Write and append text with redirection**

```bash
printf 'First line\n' > notes.txt
printf 'Second line\n' >> notes.txt
cat notes.txt
```

Expected output:

```text
First line
Second line
```

**5. See why `>` needs care**

```bash
printf 'Replacement text\n' > notes.txt
cat notes.txt
```

The original two lines have been replaced. Use `>>` to add to the end instead.

**6. Create files inside directories**

```bash
mkdir -p project/{src,tests,docs}
touch project/README.md project/src/main.py project/tests/test_main.py
find project -type f
```

**7. Create a hidden file and a name with spaces**

```bash
touch .env "meeting notes.txt"
ls -la
```

The `-a` option includes hidden names such as `.env`.

**8. Use Nano (optional)**

```bash
nano journal.txt
```

Type a line, save with `Ctrl+O`, confirm with `Enter`, and exit with `Ctrl+X`.

**9. Clean up**

```bash
cd ~
rm -r ~/file-lab
```

> **Warning:** `rm -r` permanently removes the directory and its contents. Check the path before running it.

---

## **Common Mistakes**

| Mistake | What happens | Fix |
|---|---|---|
| `touch src/main.py` when `src` does not exist | `No such file or directory` | Create the directory first: `mkdir -p src` |
| Expecting `touch` to make a directory | It creates files only | Use `mkdir` for directories |
| Expecting `touch existing.txt` to empty the file | It changes timestamps but keeps contents | Use an editor or redirection when you intend to change contents |
| Using `>` on a file with useful contents | The old contents are replaced | Use `>>` to append, or check the target before using `>` |
| `touch meeting notes.txt` | Creates two files | Quote one filename: `touch "meeting notes.txt"` |
| `touch -draft` | `-draft` may be read as an option | Use `touch -- -draft` or `touch ./-draft` |
| Trying to create a file in a protected directory | `Permission denied` | Use a directory you own, such as `~` |
| `touch` on a path with a typo | Creates a file at the unintended path if its parent exists | Check with `pwd` and inspect the path first |

---

## **Summary**

- `touch NAME` creates an empty file if it is missing. If it exists, `touch` updates its timestamps without changing its contents.
- `touch` can create several files in one command, but the parent directories must already exist.
- Use a text editor such as `nano` to write interactively.
- `>` writes output and replaces the target file's contents. `>>` appends output. Both are shell redirections.
- Quote names with spaces, and use `--` or `./` for names that start with a dash.
- Use absolute or relative paths to create files away from the current directory; the parent must exist and be writable.

---

## **Practice**

1. What does `touch report.txt` do when the file does not exist? What does it do when the file already exists?
2. Write one command that creates `a.txt`, `b.txt`, and `c.txt`.
3. Why does `touch project/src/main.py` fail if `project/src` does not exist? Write the commands to create the directory and file.
4. What is the difference between `>` and `>>`?
5. Which command replaces `notes.txt` with the text `Done` followed by a newline?
6. Which command adds `One more line` to the end of `notes.txt`?
7. How do you create a single file named `meeting notes.txt`?
8. How do you create a hidden file named `.env`? How can you see it with `ls`?
9. Write commands to create `app/src` and `app/tests`, then create `app/README.md` and `app/src/main.py`.
10. Why can `touch /root/secret.txt` fail for a normal user? Where could you create a file instead?
