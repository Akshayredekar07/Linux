# **Hidden Files**

In Linux, a filename that begins with a dot is treated as hidden by many listing tools. Examples include `.bashrc`, `.profile`, `.gitignore`, and the `.config` directory. The dot is part of the name; it does not encrypt the file or restrict access to it.

---

## **How Hidden Names Work**

These are ordinary files and directories whose names begin with `.`:

```text
.bashrc       hidden file
.config/      hidden directory
notes.txt     regular file
```

Linux does not require a special setting to make a file hidden. Renaming `notes.txt` to `.notes.txt` makes it hidden in common directory listings. Removing the leading dot makes it visible again:

```bash
mv notes.txt .notes.txt      # hide it in normal listings
mv .notes.txt notes.txt      # make it visible again
```

The leading dot is only a naming convention. Anyone who knows the path and has permission can still read or change a hidden file. Use file permissions to control access (covered in [Phase 9](../../09__permissions/)).

---

## **List Hidden Files**

Plain `ls` usually omits names beginning with a dot. Use `-a` or `-A` to show them:

| Command | What it shows |
|---|---|
| `ls` | Regular visible names |
| `ls -a` | All names, including `.` (current directory) and `..` (parent directory) |
| `ls -A` | Hidden names, but not the special `.` and `..` entries |
| `ls -la` | A detailed listing of all names, including `.` and `..` |
| `ls -lA` | A detailed listing including hidden names, but not `.` and `..` |

```bash
ls -A ~
ls -la ~/.config
```

In a long listing, names beginning with a dot are still just names. The first character in the permissions column describes the item type, not whether it is hidden.

---

## **Create, Read, and Edit Hidden Files**

Use the full name like any other file:

```bash
touch .notes
printf 'A hidden note\n' > .notes
cat .notes
nano .notes
```

The parent directory must exist, and you need permission to write there. Quote a hidden filename if it contains spaces, such as `".private notes"`.

Hidden configuration names are common in a home directory. For example, `.bashrc` stores Bash shell settings, and `.config` commonly contains application settings. Be careful when editing system or application configuration: changing it can affect how programs work.

---

## **Move, Copy, and Remove Hidden Files**

Hidden files work with the regular file commands. Include the leading dot in the path:

```bash
cp .env .env.backup
mv .draft.txt draft.txt
rm -i .old-config
```

To copy a directory that contains hidden files, copy the directory itself:

```bash
cp -a project project-backup
```

The archive copy includes dotfiles inside `project`. A wildcard such as `project/*` normally skips those names. See [03-copying-files-and-directories.md](03-copying-files-and-directories.md), [04-moving-and-renaming.md](04-moving-and-renaming.md), and [05-removing-files-and-directories.md](05-removing-files-and-directories.md) for more.

---

## **Hidden Files and Wildcards**

In Bash, a wildcard such as `*` normally does not match names beginning with a dot:

```bash
ls *
```

This lists matching visible names, but usually leaves out `.env` and `.config`. To include hidden names in a list, use `ls -A` rather than changing shell wildcard behavior.

Be especially careful with removal commands and dotfile patterns. Do not run commands like `rm -r .*` or `rm -rf .*`: dot patterns can match important directory entries and files. List exact names with `ls -A`, then remove only the specific item you intend, for example `rm -i .old-file`.

Wildcards are explained in [08-wildcards.md](08-wildcards.md).

---

## **Common Hidden Names**

| Name | Common use |
|---|---|
| `.bashrc` | Bash settings for interactive shells |
| `.profile` | Login shell settings |
| `.config/` | Per-user application configuration directory |
| `.ssh/` | SSH configuration and keys; access should be restricted with permissions |
| `.gitignore` | Patterns Git uses to ignore files |
| `.env` | Often used by applications for environment settings; may contain secrets |

The exact files vary by system and installed software. A leading dot does not make a secret safe to share. Avoid printing or publishing files that may contain credentials.

---

## **Try It**

Run these commands in your own terminal (WSL2 Ubuntu), starting from the repository root (the folder that contains `src`). The exercise uses `src/03__file-operations/lab/data`, the phase's sample-data area. It creates a separate `hidden-practice` folder and removes only that folder at the end. Output order may differ on your system.

**1. Create a visible and a hidden file**

```bash
mkdir -p src/03__file-operations/lab/data/hidden-practice
cd src/03__file-operations/lab/data/hidden-practice
printf 'Visible example\n' > notes.txt
printf 'Hidden example\n' > .secret-note
mkdir .settings
```

**2. Compare normal and all-name listings**

```bash
ls
ls -A
ls -la
```

The first listing normally shows `notes.txt` and `.settings` is hidden from it. `ls -A` and `ls -la` show both hidden names.

**3. Read and rename a hidden file**

```bash
cat .secret-note
mv .secret-note secret-note.txt
ls -A
```

The file is visible under its new name because it no longer starts with a dot.

**4. Make it hidden again and copy it**

```bash
mv secret-note.txt .secret-note
cp .secret-note .secret-note.backup
ls -A
```

**5. Remove one hidden file with a prompt**

```bash
rm -i .secret-note.backup
```

Type `y` and press `Enter` to remove the backup, or `n` to leave it for cleanup.

**6. Clean up the practice folder**

```bash
cd "$(git rev-parse --show-toplevel)"
rm -r src/03__file-operations/lab/data/hidden-practice
```

> **Warning:** `rm -r` permanently removes the directory and everything inside it. Check the path before running the cleanup command. It removes only `hidden-practice`.

---

## **Common Mistakes**

| Mistake | What happens | Fix |
|---|---|---|
| Looking for `.env` with plain `ls` | The hidden name is omitted | Use `ls -A` or `ls -la` |
| Treating a leading dot as file protection | Anyone with access to the path may still read the file | Use permissions to restrict access; do not store secrets in an exposed location |
| Using `*` and expecting it to match dotfiles | Bash normally leaves hidden names out of the expansion | Name the hidden file directly, or list all names with `ls -A` |
| Running `rm -r .*` to clear a folder | Dot patterns may match more than intended | Inspect with `ls -A` and remove exact names only |
| Forgetting the dot in a command | The command refers to a different filename or reports that it cannot find the file | Copy the exact name from `ls -A` |
| Assuming every file beginning with a dot is a configuration file | It may be a note, application file, or something else | Inspect the file and its location before changing or removing it |

---

## **Summary**

- A name beginning with `.` is hidden from many normal listings; it remains an ordinary file or directory.
- Use `ls -A` to show hidden names without the special `.` and `..` entries. Use `ls -la` for a detailed listing.
- Create, read, edit, copy, move, and remove hidden files by using their full names, including the dot.
- Bash wildcards such as `*` normally skip hidden names. Avoid broad dotfile patterns with `rm`.
- A leading dot does not protect a file or make its contents secret. Use permissions and safe storage for sensitive data.

---

## **Practice**

1. Why does plain `ls` not show `.env`? Which option shows it?
2. What is the difference between `ls -a` and `ls -A`?
3. Write commands to create a hidden empty file named `.draft` and display it with `ls`.
4. How do you rename `.draft` to `draft.txt`?
5. How can you copy `.env` to a backup named `.env.backup`?
6. Does a leading dot prevent another user with permission from reading a file? Explain.
7. Why might `cp project/* backup/` omit hidden files inside `project`? What is one way to copy the directory including them?
8. Why is `rm -r .*` unsafe? What should you do before removing a hidden file?
9. Name two common hidden files or directories in a Linux home folder and what they are used for.
10. Which command removes the hidden file `.old-config` after asking for confirmation?
