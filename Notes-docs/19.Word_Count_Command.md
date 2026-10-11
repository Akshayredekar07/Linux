# Word Count  
## Command (wc Command)

The `wc` command is used to count the number of lines, words, and characters in a given file. 

```bash
wc filename
```
This will output:  

```
no_of_lines no_of_words no_of_characters filename
```

### Example:
```bash
# Create the file a.txt with the following content

#Mango is very Sweet
#Linux is very easy language to learn
#Java is just like ocean
#Python is next level very useful programming language

akshay@Ubuntu:~/Desktop$ gedit a.txt
akshay@Ubuntu:~/Desktop$ wc a.txt
  4  24 135 a.txt

```
- `4` → Number of lines  
- `24` → Number of words  
- `135` → Number of characters (file size in bytes)

### Options with `wc` Command:
- `-l` → To print only the number of lines
- `-w` → To print only the number of words
- `-c` → To print only the number of characters
- `-lw` → To print only the number of lines and words
- `-lc` → To print only the number of lines and characters
- `-wc` → To print only the number of words and characters
- `-L` → To print the number of characters present in the longest line

### Examples with Options:
```bash
akshay@Ubuntu:~/Desktop$ wc a.txt
  4  24 135 a.txt
akshay@Ubuntu:~/Desktop$ wc -l a.txt 
4 a.txt
akshay@Ubuntu:~/Desktop$ wc -w a.txt 
24 a.txt
akshay@Ubuntu:~/Desktop$ wc -c a.txt 
135 a.txt
akshay@Ubuntu:~/Desktop$ wc -lw a.txt 
  4  24 a.txt
akshay@Ubuntu:~/Desktop$ wc -lc a.txt 
  4 135 a.txt
akshay@Ubuntu:~/Desktop$ wc -wc a.txt 
 24 135 a.txt
akshay@Ubuntu:~/Desktop$ wc L a.txt 
wc: L: No such file or directory
  4  24 135 a.txt
  4  24 135 total
```

### Using `wc` for Multiple Files:
```
$ wc a.txt b.txt c.txt
 4 26 166 a.txt
 3  4  27 b.txt
 4  4 112 c.txt
11 34 305 total
```
