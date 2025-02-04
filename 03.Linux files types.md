## Types of Files in Linux

In Linux, everything is treated as a file. All files are divided into three types:

1. **Normal files or ordinary files**
2. **Directory files**
3. **Device files**

### {A} Ordinary Files

- These files contain data, which can be either text or binary (e.g., video, image, audio).
- Examples:
  - `abc.txt`
  - `index.html`
  - `test.java`
  - `test.py`
  - `script.sh`
  - `image.jpg`
  - `song.mp4`

- In Linux, file extensions are not important; Linux identifies file types based on their content.
  - Example:
    ```bash
    touch img.jpg
    ls -l img.jpg
    file img.jpg
    gedit img.jpg   # Add some content to it
    cat img.jpg
    file img.jpg
    ```

    ```bash
    akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ touch img.jpg
    akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ ls -l img.jpg
    -rw-rw-r-- 1 akshay akshay 0 Aug 30 14:31 img.jpg
    akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ file img.jpg
    img.jpg: empty
    akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ gedit img.jpg
    akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ cat img.jpg
    Added some content to it
    akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ file img.jpg
    img.jpg: ASCII text
    ```

- Renaming `img.jpg` to `img.durga`:
    ```bash
    akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ mv img.jpg img.durga
    akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ file img.durga
    img.durga: ASCII text
    ```

### {B} Directory Files

- These files represent directories.
- In Windows, the term "folder" is used, while in Linux, the term "directory" is preferred.
- A directory can contain files and subdirectories.

### {C} Device Files

- In Linux, every device is represented as a file, allowing communication with the device.
* Device files in Linux represent hardware devices, such as hard drives, keyboards, and network interfaces. 
* They are located in the `/dev/` directory. 
* Two main types: character devices (for sequential data) and block devices (for random access). 
* Accessing device files through system calls allows interaction with hardware.
  - Example:
    ```bash
    tty  # This file represents the terminal
    ```

    - **External terminal**:
        ```bash
        akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ tty
        /dev/pts/0
        ```
    - **VSCode terminal**:
        ```bash
        akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ tty
        /dev/pts/1
        ```

  - Sending output from one terminal to another:
    - **First terminal**:
        ```bash
        akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ tty
        /dev/pts/0
        akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ echo "Hello I am in first terminal"
        Hello I am in first terminal
        akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ echo "Hello I am in first terminal" > /dev/pts/1
        ```
    - **Second terminal**:
        ```bash
        akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ Hello I am in first terminal
        ```

    - Clearing output on the second terminal:
        ```bash
        akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ clear > /dev/pts/1
        ```

### Shortcut Commands for Terminal
- **Open terminal**: `Ctrl + Alt + T`
- **Close terminal**: `Ctrl + D`

### How to Check File Type

- In Ubuntu, blue-colored files represent directories, while other colors represent normal files. However, this color convention varies by distribution, so it is not a standard method.
- Use the `ls -l` command to check file types.

  ```bash
  total 4576
  -rw-rw-r-- 1 akshay akshay     342 Aug 29 07:52  directory-hierarchy-linux.mermaid
  -rw-rw-r-- 1 akshay akshay 4633146 Aug 28 11:05 'DurgaSir Linux.pdf'
  -rw-rw-r-- 1 akshay akshay     463 Aug 29 07:15  flow-example.mermaid
  -rw-rw-r-- 1 akshay akshay      25 Aug 30 14:32  img.durga
  -rw-rw-r-- 1 akshay akshay     300 Aug 28 18:39  index.html
  -rw-rw-r-- 1 akshay akshay      58 Aug 28 10:58  README.md
  -rw-rw-r-- 1 akshay akshay     367 Aug 28 11:42 'Session 01.Intoduction.txt'
  -rw-rw-r-- 1 akshay akshay    4870 Aug 29 08:04 'Session 02.Components of Unix & Execution Flow.txt'
  -rw-rw-r-- 1 akshay akshay    3086 Aug 30 14:54 'Session 03.Linux File Ststem.txt'
  -rwxrw-r-- 1 akshay akshay      50 Aug 28 19:11  test.sh
  -rw-rw-r-- 1 akshay akshay     672 Aug 28 18:26  unix-flow-digram.mermaid
  -rw-rw-r-- 1 akshay akshay     710 Aug 28 19:43  user-os-hardware.mermaid
  ```