
### Search Multiple Content in a File

To search for multiple patterns within a file, we can use `grep` with the `-e` option or directly use `egrep` for extended regular expressions.

#### Using `grep` with `-e` Option

```bash
durgasoft@durgasoft:~/Desktop$ grep -i -e "java" -e "unix" demo.txt
```

**Output:**
```
This is java demo
UnixDemo session
unix material
UNIX classes and videos
java is slowly going down
```

#### Using `egrep` (Extended `grep`)

The `egrep` command allows us to use extended regular expressions directly without needing the `-e` option.

```bash
durgasoft@durgasoft:~/Desktop$ egrep -i "(java|unix)" demo.txt
```

**Output:**
```
This is java demo
UnixDemo session
unix material
UNIX classes and videos
java is slowly going down
```

### `grep` with `-F` Option (OR `fgrep`)

- `fgrep` stands for "Fixed String Global Regular Expression Print."
- It searches for a group of fixed strings in a file, each separated by a newline.
- Unlike `grep` or `egrep`, `fgrep` cannot interpret regular expressions and only matches exact strings.

#### Using `grep -F` with Multiple Fixed Strings

```bash
durgasoft@durgasoft:~/Desktop$ grep -F "java
> unix" demo.txt
```

**Output:**
```
This is java demo
unix material
java is slowly going down
```

#### Using `fgrep` Directly

```bash
durgasoft@durgasoft:~/Desktop$ fgrep "java
> unix
> friends
> demo" demo.txt
```

**Output:**
```
This is java demo
this is python demo
Hello friends how are you
unix material
java is slowly going down
```

**Note:** `fgrep` can only be used for exact strings and not for regular expressions.
