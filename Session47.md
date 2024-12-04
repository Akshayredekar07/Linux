
## Working with Editors

We can use editors to edit file content.  
There are multiple editors available:  

1. **geditor**  
2. **vi editor**  
3. **nano editor**  
   etc.

---

## 1. Working with geditor:  
It is a graphical editor, similar to Windows Notepad.  

### Commands:  

```bash
$ gedit file1.txt
$ gedit first.sh
```

### Script Example:
```bash
echo "This is my first shell script"
mkdir dir{1..6}
echo "six directories got created"
date
cal
```

### Making the Script Executable and Running It:  
```bash
$ chmod u+x first.sh
$ ./first.sh
```

### Note:
- **gedit** can work only on the desktop version and does not work on server versions.  
- If we are connecting to a remote server using **putty**, then **gedit** cannot be used.  
- In such cases, we must use **vi editor**.  

---

## Key Differences:  
- **gedit** and **nano** are Linux-based editors.  
- **vi editor** is Unix-based.  
- **vi editor** can work in both desktop and server environments.  
