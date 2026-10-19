# **Creating Directories**

A directory is a folder that holds files and other directories. Every real project starts with a folder structure: source code, tests, docs, configuration, logs. The `mkdir` command (make directory) creates these folders.

---

## **Basic Use**

```bash
mkdir NAME                # one directory
mkdir NAME1 NAME2 NAME3   # several directories at once
```

Syntax: `mkdir [OPTION]... DIRECTORY...`

```bash
mkdir project             # create one directory
mkdir reports logs backups   # create three directories
mkdir project/docs        # create a directory inside an existing one
```

`project` must already exist before you create `project/docs`. If it does not, use `-p` (see below).

`mkdir` creates directories only. It does not create files. To create files, see [02-creating-files.md](02-creating-files.md). To remove directories, see [05-removing-files-and-directories.md](05-removing-files-and-directories.md).

---

## **Common Options**

| Option | Meaning |
|---|---|
| `-p` | Create missing **parent** directories. No error if the directory already exists |
| `-v` | Verbose: print a message for each directory created |
| `-m MODE` | Set the permissions when creating (for example `-m 700`) |
| `--help` | Show a short help text |

You can join short options: `mkdir -pv a/b/c` is the same as `mkdir -p -v a/b/c`. For more about reading help, see [08-command-syntax-and-help.md](../../01__fundamentals/documentation/08-command-syntax-and-help.md).

---

## **Creating Parent Directories with `-p`**

Without `-p`, `mkdir` creates only the **last** name in the path. All parent directories must already exist.

```bash
mkdir api/v1/users       # fails if api/v1 does not exist
mkdir -p api/v1/users    # creates api, api/v1 and api/v1/users
```

`-p` has a second use. If the directory already exists, `mkdir -p` does nothing and gives no error. This matters in setup scripts, CI jobs, and install scripts that run more than once:

```bash
mkdir -p ~/.config/myapp    # safe to run again and again
```

```mermaid
flowchart TD
    A["mkdir a/b/c"] --> B{"Does a/b exist?"}
    B -- Yes --> C["Creates c"]
    B -- No --> D{"Did you use -p?"}
    D -- Yes --> E["Creates a, a/b and c"]
    D -- No --> F["Error: No such file or directory"]
```

`mkdir -p` still fails if the name already exists as a **file**, because a file and a directory cannot have the same name in the same place.

---

## **Creating Many Directories at Once**

Before `mkdir` runs, Bash expands braces `{}` into several words. This is called **brace expansion**. It is a feature of the shell, not of `mkdir`.

| Pattern | Expands to |
|---|---|
| `{dev,staging,prod}` | `dev staging prod` |
| `sprint-{1..3}` | `sprint-1 sprint-2 sprint-3` |
| `{a..c}` | `a b c` |
| `{01..12}` | `01 02 03 ... 12` (zero-padded) |
| `{a..c}{1..3}` | `a1 a2 a3 b1 b2 b3 c1 c2 c3` (nine words) |
| `src/{components,pages}` | `src/components src/pages` |
| `app/{src,tests}/{unit,e2e}` | all four combinations |

Rules:

- Do **not** put spaces inside the braces. `{src, tests}` does not expand.
- You can put braces inside braces: `my-app/{src/{components,pages},tests}`.
- Preview the result first with `echo`. It prints the words and creates nothing: `echo sprint-{1..3}`.
- Two braces in one path multiply. `{dev,staging,prod}/{config,logs}` gives 3 × 2 = 6 paths.

The expansion happens even if you did not mean it, so check that your braces and commas are correct.

---

## **Case Study 1: Start a New Web App**

You start a new frontend project. You want folders for source code, tests, docs, static files, and CI configuration.

```text
my-app/
├── .github/
│   └── workflows/
├── docs/
├── public/
├── src/
│   ├── components/
│   ├── hooks/
│   └── pages/
└── tests/
```

One command creates all of it:

```bash
mkdir -p my-app/{src/{components,pages,hooks},public,tests,docs,.github/workflows}
```

Things to notice:

- Nested braces create the three folders inside `src`.
- `.github/workflows` starts with a dot, so it is a hidden directory (see [07-hidden-directories.md](../../01__fundamentals/documentation/07-hidden-directories.md)). Plain `ls` will not show `.github`. Use `ls -A my-app`.
- `-p` creates `my-app` itself and every parent.

---

## **Case Study 2: Deployment Folders and Dated Backups**

A service runs in three environments, and each one needs its own `config` and `logs` folders. You also want one backup folder per month.

```bash
mkdir -p deploy/{dev,staging,prod}/{config,logs}
mkdir -p backups/2026/{01..12}
```

```text
deploy/
├── dev/
│   ├── config/
│   └── logs/
├── staging/
│   ├── config/
│   └── logs/
└── prod/
    ├── config/
    └── logs/
backups/
└── 2026/
    ├── 01/
    ├── 02/
    ...
    └── 12/
```

`{01..12}` keeps the leading zero, so the folders sort in the right order (`01`, `02`, ... `12`). With `{1..12}` the names would be `1`, `2`, ... `12`, and `10` would come before `2` in a plain list.

---

## **Case Study 3: Create a Directory in Another Place**

`mkdir` works with absolute and relative paths. You do not have to go into a directory to create something inside it.

Here is a project with a frontend and a backend:

```text
workspace/
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   └── pages/
│   └── tests/
└── backend/
    ├── src/
    │   ├── routes/
    │   └── models/
    └── tests/
```

```bash
mkdir -p workspace/{frontend,backend}/{src,tests}
mkdir -p workspace/frontend/src/{components,pages}
mkdir -p workspace/backend/src/{routes,models}
```

You are in `~/workspace/frontend/src/components`. You want to create `middleware` inside `backend/src` without leaving this directory.

| Type | Command |
|---|---|
| Absolute path | `mkdir ~/workspace/backend/src/middleware` |
| Relative path | `mkdir ../../../backend/src/middleware` |

How to count the `..` in the relative path:

| Path | Directory |
|---|---|
| `..` | `src` |
| `../..` | `frontend` |
| `../../..` | `workspace` |

Then `backend/src/middleware` goes down from `workspace`. An absolute path works from anywhere. A relative path depends on where you are, so run `pwd` first. See [01-paths-and-current-directory.md](../../02__navigation/documentation/01-paths-and-current-directory.md) for more.

---

## **Setting Permissions with `-m`**

A new directory gets a default permission mode. The default depends on a setting called `umask`, so it can be different on different systems. With `-m` you choose the mode yourself:

```bash
mkdir -m 700 private       # only you can open this directory
```

`-m` applies only to the **last** directory. With `mkdir -p -m 700 a/b/c`, only `c` gets mode 700. The parents `a` and `a/b` get the default mode.

Permissions and `umask` are explained in [Phase 9](../../09__permissions/).

---

## **Naming Directories**

| Rule | Details |
|---|---|
| Letters, digits, `.`, `_`, `-` | Safe to use |
| Case-sensitive | `Docs` and `docs` are two different directories |
| No `/` in a name | `/` separates parts of a path |
| Maximum length | 255 bytes for one name |
| Leading dot | `.config` is a hidden directory |
| Leading dash | `-test` looks like an option. Use `mkdir -- -test` |
| Spaces | Allowed, but you must quote the name every time: `mkdir "My Notes"` |
| Special characters | Avoid `* ? $ & ; | < > \ ' "`. The shell gives them a special meaning |

Without quotes, `mkdir my notes` creates **two** directories, `my` and `notes`.

Good habit: use lowercase names and join words with `-` or `_`, like `release-notes` or `my_notes`. Then you never need quotes.

---

## **Try It**

Run these in your own terminal (WSL2 Ubuntu) before you commit. Do the lab in your Linux home folder, as shown. Do not do it under `/mnt/c` or `/mnt/d`, because permissions can behave differently there. Dates are shown as `...`, and numbers may differ on your system.

Steps 6 to 8 use `tree`. It may not be installed. See [04-viewing-directory-structure.md](../../02__navigation/documentation/04-viewing-directory-structure.md) for how to install it. Use `tree`, not `tree /F`. The `/F` option is from Windows and does not work on Linux. If you do not want to install it, use `ls -RA` instead.

**1. Create one directory and several at once**

```bash
mkdir ~/mkdir-lab
cd ~/mkdir-lab
mkdir docs
mkdir scripts data logs
ls
```

Example output:

```text
data  docs  logs  scripts
```

**2. See the two common errors**

```bash
mkdir docs
mkdir projects/web/src
```

Example output:

```text
mkdir: cannot create directory 'docs': File exists
mkdir: cannot create directory 'projects/web/src': No such file or directory
```

The first fails because `docs` already exists. The second fails because `projects` and `projects/web` do not exist.

**3. Fix it with `-p`**

```bash
mkdir -p projects/web/src
mkdir -p projects/web/src
mkdir -p docs
ls -R projects
```

Example output:

```text
projects:
web

projects/web:
src

projects/web/src:
```

The second and third commands print nothing and give no error.

**4. Watch it work with `-v`**

```bash
mkdir -v backup
mkdir -pv reports/2026/october
```

Example output:

```text
mkdir: created directory 'backup'
mkdir: created directory 'reports'
mkdir: created directory 'reports/2026'
mkdir: created directory 'reports/2026/october'
```

**5. Brace expansion**

```bash
echo dir{1..3}
echo {a..c}{1..3}
mkdir sprint-{1..3}
ls -d sprint-*
```

Example output:

```text
dir1 dir2 dir3
a1 a2 a3 b1 b2 b3 c1 c2 c3
sprint-1  sprint-2  sprint-3
```

The `echo` lines only print the words. `mkdir sprint-{1..3}` creates three directories. The `*` in the last command is a wildcard. Wildcards are explained in [08-wildcards.md](08-wildcards.md).

**6. Case Study 1: new web app**

```bash
mkdir -p my-app/{src/{components,pages,hooks},public,tests,docs,.github/workflows}
tree -a my-app
```

Example output:

```text
my-app
├── docs
├── .github
│   └── workflows
├── public
├── src
│   ├── components
│   ├── hooks
│   └── pages
└── tests

9 directories, 0 files
```

The position of `.github` can be different on your system.

**7. Case Study 2: environments and monthly folders**

```bash
mkdir -p deploy/{dev,staging,prod}/{config,logs}
mkdir -p backups/2026/{01..12}
tree deploy
ls backups/2026
```

Example output:

```text
deploy
├── dev
│   ├── config
│   └── logs
├── prod
│   ├── config
│   └── logs
└── staging
    ├── config
    └── logs

9 directories, 0 files
01  02  03  04  05  06  07  08  09  10  11  12
```

**8. Case Study 3: absolute and relative paths**

```bash
mkdir -p workspace/{frontend,backend}/{src,tests}
mkdir -p workspace/frontend/src/{components,pages}
mkdir -p workspace/backend/src/{routes,models}
cd workspace/frontend/src/components
pwd
mkdir ../../../backend/src/middleware
mkdir ~/mkdir-lab/workspace/backend/src/services
cd ~/mkdir-lab
ls workspace/backend/src
```

Example output:

```text
/home/akshay/mkdir-lab/workspace/frontend/src/components
middleware  models  routes  services
```

You created `middleware` with a relative path and `services` with an absolute path, both without leaving `components`.

**9. Names with spaces, and capital letters**

```bash
mkdir "My Notes"
ls -d "My Notes"
mkdir Docs
ls -d Docs
ls -d docs
```

Example output:

```text
My Notes
Docs
docs
```

`Docs` and `docs` are two different directories.

**10. Set permissions while creating**

```bash
mkdir -m 700 private
ls -ld private
```

Example output:

```text
drwx------ 2 akshay akshay 4096 ... private
```

`drwx------` means only the owner can read, write, and enter this directory.

**11. A permission error**

```bash
mkdir /test
```

Example output:

```text
mkdir: cannot create directory '/test': Permission denied
```

A normal user cannot create directories in `/`. This is expected. Create your own directories under your home folder (`~`) instead.

**12. Clean up**

> **Warning:** `rm -r` deletes a folder and everything inside it, with no undo. Check the path before you press Enter. Move out of the folder first.

```bash
cd ~
rm -r ~/mkdir-lab
```

---

## **Common Mistakes**

| Mistake | What happens | Fix |
|---|---|---|
| `mkdir a/b/c` when `a/b` does not exist | `No such file or directory` | Use `mkdir -p a/b/c` |
| `mkdir docs` when it already exists | `File exists` | Use `mkdir -p docs` if this is fine, or choose another name |
| `mkdir My Notes` | Two directories are created: `My` and `Notes` | Quote the name: `mkdir "My Notes"` |
| `mkdir app/{src, tests}` (space in braces) | Braces are not expanded. You get odd names like `{src,` and `tests}` | Remove the space: `{src,tests}` |
| `mkdir -test` | `invalid option` | Use `mkdir -- -test` or `mkdir ./-test` |
| `Docs` and `docs` used as if they were the same | They are two separate directories | Pick one style and keep it, for example all lowercase |
| `mkdir -p -m 700 a/b/c` and expecting all three to be 700 | Only `c` gets mode 700 | Set the parents with `chmod` (Phase 9) |
| Wrong number of `..` in a relative path | The directory is created in the wrong place, or you get an error | Run `pwd` first, or use an absolute path |
| `mkdir /test` | `Permission denied` | Create directories in your home folder |
| `mkdir -p` with a name that is already a file | `File exists` | Choose another name |

---

## **Summary**

- `mkdir NAME` creates a directory. You can give several names at once.
- `-p` creates missing parent directories. It gives no error if the directory already exists, so it is safe in scripts.
- `-v` prints what was created. `-m MODE` sets permissions on the last directory only.
- Brace expansion, like `mkdir -p my-app/{src,tests}` or `backups/{01..12}`, creates many directories with one command. Preview it with `echo`.
- You can create a directory anywhere with an absolute or a relative path. Check your location with `pwd`.
- Names are case-sensitive. Avoid spaces and special characters.

---

## **Practice**

1. What is the difference between `mkdir api/v1/users` and `mkdir -p api/v1/users`? When does each one fail?
2. Write a command that creates a directory called `side-project` inside `Projects` in your home folder.
3. Write one command that creates `a`, with `b` inside it, and `c` inside `b`.
4. How many directories does `mkdir {a..c}{1..3}` create? Name them. How can you check before you run it?
5. What does `mkdir release notes` create? How do you create one directory called `release notes`?
6. Write one command that creates `service/src`, `service/tests`, and `service/docs`.
7. Write one command that creates `dev`, `qa`, and `prod`, each with a `config` and a `logs` directory.
8. Write a command that creates twelve directories named `01` to `12` inside `reports`.
9. You are in `~/workspace/frontend/src/components`. Write a relative command and an absolute command that create `~/workspace/backend/src/middleware`.
10. Why does `mkdir -p -m 700 a/b/c` not make `a` and `b` private? How do you create a directory named `-test`?