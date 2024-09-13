### View Content of the Files  
We can view the content of a file by using the following commands:  
1) `cat`  
2) `tac`  
3) `rev`  
4) `head`  
5) `tail`  
6) `less`  
7) `more`  

#### 1. View Content of the File by using `cat` Command:  
```bash
$ cat < file1.txt  
```
or  
```bash
$ cat file1.txt  
```  
`<` is optional.  
```bash
$ cat < file1.txt  
This is first line  
This is second line  
This is third line  
This is extra line  
```  
```bash
$ cat file1.txt  
This is first line  
This is second line  
This is third line  
This is extra line  
```  
- To include line numbers, use the `-n` option:  
```bash
$ cat -n file1.txt  
 1 This is first line  
 2 This is second line  
 3 This is third line  
 4 This is extra line  
```  
- To skip blank lines, use the `-b` option:  
```bash
$ cat -b file1.txt  
 1 This is first line  
 2 This is second line  
 3 This is third line  
 4 This is extra line  
```  
- To view content of multiple files:  
```bash
$ cat file1.txt file2.txt file3.txt  
```  
*Note*: The word `cat` is derived from **con**'cat'**enation**.  

#### Various Utilities of `cat` Command:  
1) To create a new file with some content:  
```bash
$ cat > filename  
data  
ctrl+d  
```  
2) To append data to an existing file:  
```bash
$ cat >> filename  
extra data  
ctrl+d  
```  
3) To view the content of a file:  
```bash
$ cat < filename  
```
or  
```bash
$ cat filename  
```  
4) To copy the content of one file to another:  
```bash
$ cat input.txt > output.txt  
```  
5) To copy the content of multiple files to a single file:  
```bash
$ cat file1.txt file2.txt file3.txt > file4.txt  
```  
6) To append the content of one file to another:  
```bash
$ cat file1.txt >> file2.txt  
```  

#### 2. `tac` Command:  
- It displays the file content in reverse order of lines (vertical reversal):  
```bash
$ tac abc.txt  
MAT  
RAT  
CAT  
```  

#### 3. `rev` Command:  
- It reverses each line content (horizontal reversal):  
```bash
$ rev abc.txt  
TAC  
TAR  
TAM  
```  

#### 4. `head` Command:  
- To view the top few lines of the file:  
```bash
$ head file1.txt  
```
- Default: displays the top 10 lines.  
- To display the top 30 lines:  
```bash
$ head -n 30 file1.txt  
```
or  
```bash
$ head -30 file1.txt  
```  
- To display all lines except the last 20:  
```bash
$ head -n -20 file1.txt  
```  
- To display the first 100 bytes:  
```bash
$ head -c 100 file1.txt  
```  

#### 5. `tail` Command:  
- To view the last few lines of the file:  
```bash
$ tail file1.txt  
```
- Default: displays the last 10 lines.  
- To display the last 30 lines:  
```bash
$ tail -n 30 file1.txt  
```
or  
```bash
$ tail -30 file1.txt  
```  
- To display lines from the 4th to the last:  
```bash
$ tail -n +4 file1.txt  
```  
- To display 200 bytes from the bottom:  
```bash
$ tail -c 200 file1.txt  
```  

#### 6. `more` Command:  
- To view file content page by page:  
```bash
$ more file1.txt  
```
- Controls:  
    - `Enter`: next line  
    - `Space Bar`: next page  
    - `q`: quit  

#### 7. `less` Command:  
- To view the content page by page, with both forward and backward navigation:  
```bash
$ less file1.txt  
```  
- Controls:  
    - `d`: next page  
    - `b`: previous page  

#### Examples:  
- To display lines from the 3rd to 7th:  
```bash
$ head -7 demo.txt | tail -5  
```  
- To display lines from the 21st to 30th:  
```bash
$ head -30 demo.txt | tail -10  
```  