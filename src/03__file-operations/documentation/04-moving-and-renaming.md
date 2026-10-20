# **Moving and Renaming Files and Directories**

The `mv` command moves files and directories to another location. It also renames them: when the source and destination are in the same directory, the new name replaces the old one.

---

## **Basic Use**

```bash
mv SOURCE DESTINATION                 # move one item or rename it
mv SOURCE1 SOURCE2 DIRECTORY          # move several items into a directory
```

```bash
mv draft.txt final.txt               # rename a file
mv report.txt archive/               # move a file into a directory
mv notes.txt todo.txt archive/       # move several files into a directory
```

In the first example, `draft.txt` is renamed `final.txt`. In the second, the file moves into the existing `archive` directory and keeps its name. The destination directory must already exist when moving multiple items. `mv` does not create missing parent directories; create them first with `mkdir -p` (see [01-creating-directories.md](01-creating-directories.md)).

---

## **Rename Files and Directories**

To rename, provide the old name and the new name in the same directory:

```bash
mv old-name.txt new-name.txt
mv draft-folder final-folder
```

The original name is no longer present after a successful rename. You can also move and rename in one command by giving a destination path with a new basename:

```bash
mv report.txt archive/report-2026.txt
```

Here `report.txt` moves into `archive` and is renamed `report-2026.txt`.

---

## **Move Directories**

Unlike `cp`, `mv` does not need a recursive option to move a directory. It moves the directory and its contents together:

```bash
mv project archived-projects/
```

If `archived-projects` already exists as a directory, `project` is moved inside it. If the destination path does not exist, it becomes the directory's new name:

```bash
mv project project-old
```

This renames the directory. The files and subdirectories inside it move with it.

---

## **Common Options**

| Option | Meaning |
|---|---|
| `-i` | Ask before overwriting a destination file |
| `-n` | Do not overwrite an existing destination file |
| `-u` | Move only when the source is newer than the destination, or the destination is missing |
| `-v` | Verbose: print each move as it happens |
| `--help` | Show a short help text |

Options can be combined. For example, `mv -iv draft.txt archive/` shows the move and asks before replacing an existing file. For more about command help, see [08-command-syntax-and-help.md](../../01__fundamentals/documentation/08-command-syntax-and-help.md).

Use `-i` to check before replacing a destination:

```bash
mv -i report.txt archive/report.txt
```

If `archive/report.txt` exists, `mv` asks whether to overwrite it. Use `-n` to skip an existing destination without a prompt:

```bash
mv -n report.txt archive/
```

---

## **What Happens When the Destination Exists?**

The destination's type and whether it exists affect the result:

| Command | Result |
|---|---|
| `mv file.txt archive/` and `archive` is a directory | Moves the file into `archive` with the same name |
| `mv file.txt new-name.txt` and `new-name.txt` does not exist | Renames the file |
| `mv file.txt existing.txt` and `existing.txt` is a file | Replaces `existing.txt` by default |
| `mv folder existing-folder/` and `existing-folder` is a directory | Moves `folder` inside `existing-folder` |

Be careful with an existing destination file: the default behavior can replace it. Use `mv -i` to confirm or `mv -n` to skip it. If the destination is a directory, moving a directory with the same basename into it may fail because that name already exists there.

---

## **Paths, Spaces, and Hidden Names**

The source and destination can be relative paths, home shortcuts, or absolute paths. You do not need to change directories first:

```bash
mv draft.txt ~/Documents/draft.txt
mv ~/Downloads/data.csv ./data.csv
```

Names with spaces must be quoted. Names beginning with a dash can look like options, so use `--` or prefix the name with `./`:

```bash
mv "meeting notes.txt" "meeting notes old.txt"
mv -- -draft.txt draft.txt
mv ./-draft.txt draft.txt
```

Hidden files begin with a dot. Move one by writing its full name:

```bash
mv .env .env.backup
```

The destination's parent directory must exist, and you need permission to write there. Relative paths start from the current directory; absolute paths start at `/`. Use `pwd` to check your location. See [01-paths-and-current-directory.md](../../02__navigation/documentation/01-paths-and-current-directory.md).

---

## **Try It**

Run these commands in your own terminal (WSL2 Ubuntu), starting from the repository root (the folder that contains `src`). The exercise uses `src/03__file-operations/lab/data`, the phase's sample-data area. It creates a separate `mv-practice` folder and removes only that folder at the end. Output order may differ on your system.

**1. Make practice files**

```bash
mkdir -p src/03__file-operations/lab/data/mv-practice/{inbox,archive}
cd src/03__file-operations/lab/data/mv-practice
printf 'Draft content\n' > draft.txt
printf 'Meeting notes\n' > "meeting notes.txt"
mkdir project
printf 'Project readme\n' > project/README.md
```

**2. Rename a file**

```bash
mv draft.txt final.txt
ls
```

`final.txt` is present, and `draft.txt` is no longer there.

**3. Move a file into a directory**

```bash
mv final.txt archive/
ls archive
```

**4. Move and rename in one command**

```bash
mv "meeting notes.txt" archive/meeting-notes.txt
ls archive
```

**5. Move a directory**

```bash
mv project archive/
find archive/project -type f
```

`project` and its contents are now inside `archive`.

**6. See overwrite protection**

```bash
printf 'Original destination\n' > archive/report.txt
printf 'New source\n' > report.txt
mv -i report.txt archive/report.txt
```

When asked, type `n` and press `Enter` to keep the destination. The source `report.txt` remains in the current directory. Try `mv -n` with another source to skip an existing destination without a prompt.

**7. Rename a directory**

```bash
mv archive archived
ls archived
```

**8. Clean up**

```bash
cd "$(git rev-parse --show-toplevel)"
rm -r src/03__file-operations/lab/data/mv-practice
```

> **Warning:** `rm -r` permanently removes the directory and everything inside it. Check the path before running the cleanup command. It removes only `mv-practice`.

---

## **Common Mistakes**

| Mistake | What happens | Fix |
|---|---|---|
| `mv file.txt archive/` when `archive` does not exist | The file may be renamed to `archive` instead of moved into a folder | Create the directory first: `mkdir -p archive` |
| `mv a.txt b.txt archive/` when `archive` is missing | The multiple-source form requires an existing destination directory | Run `mkdir -p archive` first |
| Moving over a file with the same name | The destination is replaced by default | Use `mv -i` to confirm or `mv -n` to skip it |
| `mv project archive/` when `archive/project` already exists | The move may fail because the target name already exists | Choose another destination name or inspect the existing directory first |
| `mv meeting notes.txt archive/` | Treats the words as separate arguments | Quote the filename: `mv "meeting notes.txt" archive/` |
| `mv -draft.txt draft.txt` | `-draft.txt` may be read as an option | Use `mv -- -draft.txt draft.txt` or `mv ./-draft.txt draft.txt` |
| Expecting `mv` to create missing destination folders | The command fails if parent directories are missing | Create them first with `mkdir -p` |
| Expecting to have both old and new names after renaming | `mv` changes the name or location; it does not make a second copy | Use `cp` if you want to keep the original too (see [03-copying-files-and-directories.md](03-copying-files-and-directories.md)) |

---

## **Summary**

- `mv SOURCE DESTINATION` moves an item. The same command renames it when the destination is a new name in the same directory.
- `mv` moves directories and their contents without a recursive option.
- Multiple sources require an existing destination directory. `mv` does not create parent directories.
- Existing destination files are replaced by default. Use `-i` to confirm or `-n` to skip an overwrite.
- Quote names with spaces, and use `--` or `./` for names beginning with a dash.
- `mv` changes the original item's location or name. Use `cp` when you need to keep the original and make another copy.

---

## **Practice**

1. Write a command to rename `draft.txt` to `final.txt`.
2. Write a command to move `report.txt` into an existing `archive` directory.
3. How do you move `report.txt` into `archive` and rename it `report-old.txt`?
4. Write a command to move a directory named `project` and all its contents into `archive`.
5. What happens when you run `mv old.txt new.txt` and `new.txt` already exists? How can you ask before replacing it?
6. How can you skip overwriting an existing destination without being prompted?
7. Why should you create a destination directory before moving files into it?
8. Write a command to rename `meeting notes.txt` to `meeting-notes.txt`.
9. How do you rename a file called `-draft.txt` to `draft.txt`?
10. Which command should you use if you need the original file to stay where it is while making another copy?
