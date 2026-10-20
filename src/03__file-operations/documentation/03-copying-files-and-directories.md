# **Copying Files and Directories**

The `cp` command copies files and directories. The original stays where it is, and the copy is created at the destination.

---

## **Basic Use**

```bash
cp SOURCE DESTINATION              # copy one file
cp SOURCE1 SOURCE2 DIRECTORY        # copy several files into a directory
```

```bash
cp report.txt report-backup.txt
cp notes.txt todo.txt archive/
```

In the first command, `report-backup.txt` is the new copy. In the second, both files are copied into the existing `archive` directory. `cp` does not create missing parent directories; create them first with `mkdir -p` (see [01-creating-directories.md](01-creating-directories.md)).

To copy a file to another directory and give it a new name, put the new name after the directory:

```bash
cp report.txt archive/report-2026.txt
```

---

## **Copy Directories with `-r`**

Use `-r` (recursive) to copy a directory and everything inside it:

```bash
cp -r SOURCE_DIRECTORY DESTINATION
```

```bash
cp -r website website-backup
cp -r website ~/backups/
```

When the destination directory exists, `cp -r website ~/backups/` creates `~/backups/website` and copies the directory contents into it. When the destination path does not exist, that path becomes the copied directory's new name.

```text
Before:                 After `cp -r website website-backup`:
website/                website/
├── index.html           ├── index.html
└── css/                 └── css/
    └── style.css            └── style.css
                        website-backup/
                        ├── index.html
                        └── css/
                            └── style.css
```

`cp` without `-r` cannot copy a directory. For a simple directory copy, `-r` is enough. The archive option `-a` (below) is often a good choice for backups because it also preserves metadata and copies symbolic links as links.

---

## **Copy Several Files at Once**

When you give `cp` multiple source names, the last argument must be an existing directory:

```bash
mkdir -p archive
cp january.txt february.txt march.txt archive/
```

The destination directory needs to exist. This form copies the files into it with their existing names. To copy a directory and its contents, add `-r`:

```bash
cp -r reports archive/
```

---

## **Common Options**

| Option | Meaning |
|---|---|
| `-r`, `-R` | Copy directories recursively |
| `-i` | Ask before overwriting a destination file |
| `-n` | Do not overwrite an existing destination file |
| `-u` | Copy only when the source is newer than the destination, or the destination is missing |
| `-v` | Verbose: print each copy as it happens |
| `-p` | Preserve file mode, ownership where permitted, and timestamps |
| `-a` | Archive: copy recursively and preserve common file metadata and symbolic links |
| `--help` | Show a short help text |

Options can be combined. For example, `cp -iv report.txt archive/` shows the copy and asks before replacing an existing file. For more about command help, see [08-command-syntax-and-help.md](../../01__fundamentals/documentation/08-command-syntax-and-help.md).

Use `-i` when you want a prompt before overwriting:

```bash
cp -i report.txt archive/report.txt
```

If the destination exists, `cp` asks whether to overwrite it. Use `-n` to skip existing files without a prompt:

```bash
cp -n report.txt archive/
```

For backups where permissions and times matter, use archive mode:

```bash
cp -a project project-backup
```

---

## **Copy Hidden Files**

Names beginning with a dot, such as `.env` and `.config`, are hidden in a normal `ls` listing. Copy a named hidden file by including its full name:

```bash
cp .env .env.backup
```

To copy all items in a directory, including hidden ones, use `cp -a` with the directory itself:

```bash
cp -a project project-backup
```

Avoid relying on `project/*` to include hidden items: the shell's `*` wildcard normally skips names beginning with a dot. Wildcards are covered in [08-wildcards.md](08-wildcards.md).

---

## **Copy to Another Location**

The source and destination can use relative paths, home shortcuts, or absolute paths. You do not need to change directories first.

```bash
cp draft.txt ~/Documents/draft.txt
cp ~/Downloads/data.csv ./data.csv
```

The destination's parent directory must exist, and you need permission to write there. A relative path starts from the current directory; an absolute path starts at `/`. Use `pwd` to check your current location. See [01-paths-and-current-directory.md](../../02__navigation/documentation/01-paths-and-current-directory.md).

---

## **Try It**

Run these commands in your own terminal (WSL2 Ubuntu), starting from the repository root (the folder that contains `src`). The exercise uses `src/03__file-operations/lab/data`, which is the phase's sample-data area. It creates a separate `cp-practice` folder there and removes only that folder at the end. Output order, dates, and usernames may differ on your system.

**1. Make sample files**

```bash
mkdir -p src/03__file-operations/lab/data/cp-practice/{source,archive}
cd src/03__file-operations/lab/data/cp-practice
printf 'First version\n' > source/report.txt
printf 'Project notes\n' > source/notes.txt
```

**2. Copy and inspect one file**

```bash
cp source/report.txt archive/report.txt
ls -l source/report.txt archive/report.txt
cat archive/report.txt
```

Both files contain `First version`. Editing the copy does not change the original:

```bash
printf 'Changed copy\n' > archive/report.txt
cat source/report.txt
cat archive/report.txt
```

**3. Copy multiple files into a directory**

```bash
cp source/report.txt source/notes.txt archive/
ls archive
```

**4. See how overwrite protection works**

```bash
cp -i source/report.txt archive/report.txt
```

If asked, type `n` and press `Enter` to keep the existing copy. You can also try `cp -n` to skip overwriting without a prompt.

**5. Copy a directory**

```bash
mkdir -p source/project/{src,docs}
printf 'print("hello")\n' > source/project/src/main.py
printf '# Project\n' > source/project/README.md
cp -r source/project archive/
find archive/project -type f
```

`archive/project` now contains the copied files and subdirectories.

**6. Copy a hidden file**

```bash
printf 'TOKEN=example\n' > source/.env
cp source/.env archive/.env.backup
ls -la archive
```

**7. Copy a directory as a backup**

```bash
cp -a source source-backup
find source-backup -type f
```

**8. Clean up**

```bash
cd "$(git rev-parse --show-toplevel)"
rm -r src/03__file-operations/lab/data/cp-practice
```

> **Warning:** `rm -r` permanently removes the directory and everything inside it. Run the cleanup command from the repository root and check the path before pressing Enter. It removes only `cp-practice`.

---

## **Common Mistakes**

| Mistake | What happens | Fix |
|---|---|---|
| `cp file.txt new-folder` when you meant a directory named `new-folder` | If that directory does not exist, the copy is created as a regular file named `new-folder` | Create the directory first: `mkdir -p new-folder`, then use `cp file.txt new-folder/` |
| `cp file.txt archive/` when `archive` does not exist | `cp` reports that it cannot create the destination | Create `archive`, or give the intended new filename as the destination |
| `cp a.txt b.txt archive/` when `archive` is missing | The multi-source form requires an existing destination directory | Run `mkdir -p archive` first |
| `cp directory backup` without `-r` | `cp` reports that the source is a directory | Use `cp -r directory backup` or `cp -a directory backup` |
| Copying over a file with the same name | The destination is overwritten by default | Use `cp -i` to confirm, or `cp -n` to skip existing files |
| Using `*` and expecting hidden files to copy | Dotfiles are usually excluded by the shell wildcard | Name the hidden file, or copy the whole directory with `cp -a` |
| Using a path with a typo | The file may end up at an unintended location, or the command fails | Check the path and use `pwd` before copying |
| Expecting a copy to stay synchronized with its source | `cp` makes a separate copy; later changes do not sync | Run the copy again when you need an updated copy |

---

## **Summary**

- `cp SOURCE DESTINATION` copies a file. The original remains in place.
- The destination's parent directory must exist. Multiple source files require the destination to be an existing directory.
- Use `cp -r` to copy a directory and everything inside it. Use `cp -a` for a backup that preserves common metadata and symbolic links.
- `cp` overwrites destination files by default. Use `-i` to confirm or `-n` to skip existing files.
- Hidden files begin with a dot. A wildcard such as `*` usually excludes them; `cp -a directory backup` includes them.
- A copy is a separate file or directory. Later edits to the source do not update the copy.

---

## **Practice**

1. Write a command to copy `draft.txt` to `draft-backup.txt` in the same directory.
2. Write a command to copy `report.txt` into an existing `archive` directory.
3. How do you copy `a.txt` and `b.txt` into `archive`? What must be true about `archive` first?
4. Write a command to copy a directory named `website` and all its contents to `website-backup`.
5. What is the difference between `cp -i` and `cp -n`?
6. Which option is a good fit for copying a project directory as a backup while preserving metadata?
7. Why might `cp project/* backup/` omit `.env`? How can you copy the directory including hidden files?
8. Write a command to copy `~/Downloads/data.csv` to `~/Documents/data.csv`.
9. If you change the original after copying it, does the copy change too? Explain.
10. What happens if you try `cp project backup` when `project` is a directory? How should the command be changed?
