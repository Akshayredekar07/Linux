# **Directory Navigation with `cd`**

The shell always has a current working directory. Use `cd` (change directory) to move to another directory. Use `pwd` to see where you are.

This note uses absolute and relative paths. If they are not clear, read [01-paths-and-current-directory.md](01-paths-and-current-directory.md) first.

---

## **Basic `cd` Commands**

| Command | Result |
|---|---|
| `cd /etc` | Move to `/etc` |
| `cd ..` | Move to the parent directory (one level up) |
| `cd ../..` | Move up two levels |
| `cd .` | Stay in the current directory |
| `cd` or `cd ~` | Move to your home directory |
| `cd -` | Go back to the previous directory and print its path |

Always put a space between `cd` and the path. `cd..` is not the same as `cd ..`. The shell reads `cd..` as one command name, and it fails with `command not found`.

The shell replaces `~` with your home directory, for example `/home/akshay`. This is why `cd ~` and `cd` do the same thing.

---

## **Move Between Locations**

You can use absolute or relative paths with `cd`:

```bash
cd /var/log       # absolute path
cd ..             # now in /var
cd /etc           # another absolute path
cd -              # back to /var, and it prints /var
```

`cd -` is useful when you switch between two places. The shell keeps the previous directory in a variable called `OLDPWD`:

```bash
cd /etc
cd /var/log
cd -              # back to /etc
cd -              # back to /var/log
```

Use `pwd` at any time to check your location.

---

## **Move Around a Directory Tree**

Look at this structure:

```text
~/work/
├── project/
│   └── src/
└── archive/
```

From `~/work/project/src`:

- `..` is `project`
- `../..` is `work`
- `../../archive` is `archive`

```bash
cd ~/work/project/src
cd ../../archive
pwd
```

At `/`, the command `cd ..` keeps you at `/`. The root directory is the top of the tree and has no parent.

---

## **Directory Names with Spaces**

The shell splits words at spaces. A name with a space must be quoted or escaped.

```bash
cd "My Projects"      # quotes
cd My\ Projects       # backslash before the space
cd "$HOME/My Projects"
```

Be careful with `~` inside quotes. The shell does **not** expand `~` inside quotes, so `cd "~/My Projects"` fails. Use `cd ~/"My Projects"` or `cd "$HOME/My Projects"` instead.

Tip: press `Tab` to complete names. The shell adds the backslashes for you. See [08-command-syntax-and-help.md](../../01__fundamentals/documentation/08-command-syntax-and-help.md).

---

## **Try It**

> Run these in your own terminal (WSL2 Ubuntu) before you commit. The lab uses `mkdir` and `touch`. They are explained in [Phase 3](../../03__file-operations/). Your paths depend on your username.

**1. Build a small practice tree**

```bash
akshay@ubuntu:~$ mkdir -p ~/navigation-lab/work/project/src ~/navigation-lab/work/archive
akshay@ubuntu:~$ mkdir ~/navigation-lab/"My Projects"
akshay@ubuntu:~$ touch ~/navigation-lab/notes.txt
```

**2. Move down and up**

```bash
akshay@ubuntu:~$ cd ~/navigation-lab/work/project/src
akshay@ubuntu:~/navigation-lab/work/project/src$ pwd
/home/akshay/navigation-lab/work/project/src
akshay@ubuntu:~/navigation-lab/work/project/src$ cd ..
akshay@ubuntu:~/navigation-lab/work/project$ pwd
/home/akshay/navigation-lab/work/project
akshay@ubuntu:~/navigation-lab/work/project$ cd ../archive
akshay@ubuntu:~/navigation-lab/work/archive$ pwd
/home/akshay/navigation-lab/work/archive
```

**3. Switch back with `cd -`**

```bash
akshay@ubuntu:~/navigation-lab/work/archive$ cd -
/home/akshay/navigation-lab/work/project
akshay@ubuntu:~/navigation-lab/work/project$ cd ~
akshay@ubuntu:~$ pwd
/home/akshay
```

**4. Try the root directory**

```bash
akshay@ubuntu:~$ cd /
akshay@ubuntu:/$ cd ..
akshay@ubuntu:/$ pwd
/
```

**5. Names with spaces and common errors**

```bash
akshay@ubuntu:~$ cd ~/navigation-lab
akshay@ubuntu:~/navigation-lab$ cd My Projects
bash: cd: too many arguments
akshay@ubuntu:~/navigation-lab$ cd "My Projects"
akshay@ubuntu:~/navigation-lab/My Projects$ cd ..
akshay@ubuntu:~/navigation-lab$ cd notes.txt
bash: cd: notes.txt: Not a directory
akshay@ubuntu:~/navigation-lab$ cd nothing
bash: cd: nothing: No such file or directory
akshay@ubuntu:~/navigation-lab$ cd..
cd..: command not found
```

**6. Clean up**

> **Warning:** `rm -r` deletes a folder and everything inside it, with no undo. Check the path before you press Enter. Move out of the folder first.

```bash
akshay@ubuntu:~/navigation-lab$ cd ~
akshay@ubuntu:~$ rm -r ~/navigation-lab
```

---

## **Common Mistakes**

| Mistake | What happens | Fix |
|---|---|---|
| `cd..` | `command not found` | Type `cd ..` with a space |
| `cd My Projects` | `too many arguments` | Use `cd "My Projects"` |
| `cd "~/My Projects"` | `No such file or directory`, because `~` is not expanded in quotes | Use `cd ~/"My Projects"` |
| Using a relative path from the wrong place | `No such file or directory` | Run `pwd` first, or use an absolute path |
| `cd notes.txt` (a file) | `Not a directory` | `cd` works only on directories |
| Thinking `cd -` goes to the parent | It goes to the previous directory | Use `cd ..` for the parent |
| Wrong capital letters, like `cd Documents` vs `cd documents` | `No such file or directory`, because Linux names are case-sensitive | Match the exact name, or use `Tab` |

---

## **Summary**

- `cd PATH` changes the current directory. `pwd` shows where you are.
- `cd ..` goes up one level. `cd ../..` goes up two.
- `cd` or `cd ~` goes home. `cd -` goes to the previous directory.
- At `/`, `cd ..` stays at `/`.
- Quote names with spaces, or escape them with `\`. `~` does not expand inside quotes.
- `cd` works only on directories. File and directory names are case-sensitive.

---

## **Practice**

1. You are in `/var/log`. Which command takes you to `/var`? Which takes you to `/`?
2. What is the difference between `cd` and `cd -`?
3. You are in `/home/akshay/work/project/src`. Write one relative command to reach `/home/akshay/work/archive`.
4. Why does `cd Project Files` fail? Show two ways to fix it.
5. What does `cd ..` do when you are already at `/`?
6. Run `cd /etc`, then `cd /tmp`, then `cd -`, then `cd -`. Where are you after each command?
7. Why does `cd "~/My Projects"` fail?