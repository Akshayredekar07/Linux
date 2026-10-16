# **Paths and the Current Directory**

A **path** tells Linux where a file or directory is in the filesystem. The shell keeps a **current working directory**; a relative path is interpreted from there.

---

## **Find Your Current Directory**

```bash
pwd
```

`pwd` prints the current working directory. For example:

```text
/home/sam/projects
```

---

## **Absolute and Relative Paths**

An **absolute path** starts at the filesystem root, `/`, and identifies a location from there. It works regardless of the current directory.

```text
/home/sam/projects/report.txt
/etc/hostname
```

A **relative path** starts from the current directory and does not begin with `/`.

If the current directory is `/home/sam`, then:

| Path | Refers to |
|---|---|
| `projects` | `/home/sam/projects` |
| `projects/report.txt` | `/home/sam/projects/report.txt` |
| `../alex` | `/home/alex` |
| `.` | The current directory |
| `..` | The parent directory |

Linux paths are case-sensitive: `Projects` and `projects` are different names.

### **Trace a Relative Path**

Suppose these directories are under `~/Desktop`:

```text
Desktop/
├── x/
│   └── x1/
│       └── x11/
└── y/
    └── y2/
```

From `~/Desktop/x/x1/x11`, go up three levels to `~/Desktop`, then down into `y/y2`:

```bash
cd ~/Desktop/x/x1/x11
cd ../../../y/y2
pwd
```

To return to `x11` from `y2`, go up two levels to `~/Desktop`, then down into `x/x1/x11`:

```bash
cd ../../x/x1/x11
pwd
```

Each `..` moves up exactly one directory. Count the levels to the shared parent, then write the remaining directories from that point. You can avoid counting by using an absolute path when it is clearer.

Create nested directories with `mkdir -p`; it creates missing parent directories too:

```bash
mkdir -p ~/Desktop/x/x1/x11 ~/Desktop/y/y2
```

The `~` shortcut is expanded by the shell to your home directory. A leading `./` is also relative: `./script.sh` means a file named `script.sh` in the current directory.

---

## **Change Directories**

Use `cd` to change the shell's current directory.

```bash
cd /etc            # Change to an absolute path
cd                 # Return to your home directory
cd ~/projects      # ~ is a shortcut for your home directory
cd ..              # Move to the parent directory
cd -               # Return to the previous directory
```

Use `pwd` after `cd` to confirm where you are:

```bash
cd /tmp
pwd
```

`cd` with no path and `cd ~` both take you to your home directory. `cd -` switches to the previous working directory and prints its path.

---

## **Use a Path with `ls`**

`ls` can list the current directory or a path you provide. The listing options are covered in [the `ls` lesson](../../01__fundamentals/documentation/08-command-syntax-and-help.md).

```bash
ls                 # List the current directory
ls /etc            # List /etc
ls ~/projects      # List a directory under your home
ls ..              # List the parent directory
```

---

## **Try It**

Run these commands and observe how the current directory changes:

```bash
pwd
cd /
pwd
cd /etc
pwd
cd ..
pwd
cd ~
pwd
```

Then compare absolute and relative paths from your home directory:

```bash
ls /etc/hostname
ls .
ls ..
```

---

## **Summary**

- `pwd` prints the current working directory.
- An absolute path starts with `/`; a relative path is interpreted from the current directory.
- `.` means the current directory, and `..` means its parent.
- `cd PATH` changes directories; `cd` or `cd ~` goes home, and `cd -` returns to the previous directory.
- Use `ls PATH` to list a directory without first changing into it.
