
# Absolute Path vs Relative Path

### Absolute Path:
An absolute path is the path from the root (`/`) to the destination, meaning it is the complete path.

### Relative Path:
A relative path is the path from the current working directory to the destination directory. It is always relative to the current location.

---

### Example Directory Structure:

```
home
  └── akshay
      └── Desktop
          ├── X
          │   ├── X1
          │   │   ├── X11
          │   │   └── X12
          │   └── X2
          └── Y
              ├── Y1
              │   ├── Y11
              │   └── Y12
              └── Y2
```

---

### Command to create the directory structure:

```bash
mkdir -p x/x1/x1{1,2} x/x2 y/y1/y1{1,2} y/y2
```

### Output of `tree` command:

```
/F  [error opening dir]
test
├── x
│   ├── x1
│   │   ├── x11
│   │   └── x12
│   └── x2
└── y
    ├── y1
    │   ├── y11
    │   └── y12
    └── y2
```

---

## Examples of Absolute and Relative Paths:

### Example 1: Changing from `x11` directory to `y2` directory

- **Absolute Path**:
    ```bash
    $ cd /home/akshay/Desktop/y/y2
    $ cd ~/Desktop/y/y2
    ```
- **Relative Path**:
    ```bash
    $ cd ./../../../y/y2
    $ cd ../../../y/y2
    ```

### Example 2: Changing from `y2` directory to `x11`

- **Absolute Path**:
    ```bash
    $ cd /home/akshay/Desktop/x/x1/x11
    $ cd ~/Desktop/x/x1/x11
    ```
- **Relative Path**:
    ```bash
    $ cd ../../x/x1/x11
    ```

### Example 3: Creating a new directory `y21` inside `y2` without entering into `y2`

- **Absolute Path**:
    ```bash
    $ mkdir /home/akshay/Desktop/y/y2/y21
    $ mkdir ~/Desktop/y/y2/y21
    ```
- **Relative Path**:
    ```bash
    $ mkdir ../../../y/y2/y21
    ```
