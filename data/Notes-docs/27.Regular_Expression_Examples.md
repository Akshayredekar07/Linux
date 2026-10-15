1. **To list out all files present in the current working directory**  
   `$ ls *`

2. **To list out all files with some extension**  
   `$ ls *.*`

3. **To list out all files that start with 'a'**  
   `$ ls a*`

4. **To list out all files that start with 'a' and end with 't'**  
   `$ ls a*t`

5. **To list out all `.java` files**  
   `$ ls *.java`

6. **To list out all files where the file name contains only 2 characters and the first character should be 'a'**  
   `$ ls a?`

7. **To list out all files where the file name contains only 3 characters**  
   `$ ls ???`

8. **To list out all files where the file name contains at least 3 characters**  
   `$ ls ???*`

9. **To list out all files where the file name starts with 'a', 'b', or 'c'**  
   `$ ls [abc]*`

10. **To list out all files where the file name should not start with 'a', 'b', or 'c'**  
    `$ ls [!abc]*`

11. **To list out all files that start with a lowercase alphabet symbol**  
    `$ ls [a-z]*` or `$ ls [[:lower:]]*`

12. **To list out all files that start with an uppercase alphabet symbol**  
    `$ ls [A-Z]*` or `$ ls [[:upper:]]*`

13. **To list out all files that start with a digit**  
    `$ ls [0-9]*` or `$ ls [[:digit:]]*`

14. **To list out all files where the first letter should be an uppercase alphabet symbol, the second letter should be a digit, and the third letter should be a lowercase alphabet symbol**  
    `$ ls [[:upper:]][[:digit:]][[:lower:]]`

15. **To list out all files that start with a special symbol**  
    `$ ls [![:alnum:]]*`

16. **To list out all files with `.java` and `.py` extensions**  
    `$ ls {*.java,*.py}`

*Note: You can use these wildcard characters with the following commands as well: `cp`, `mv`, `rm`.*

17. **To copy all files that start with a digit to the `dir1` directory**  
    `$ cp [[:digit:]]* dir1`  
    `$ cp [0-9]* dir1`

18. **To move all files that start with an alphabet symbol and have a `.txt` extension to the `dir2` directory**  
    `$ mv [[:alpha:]]*.txt dir2`

19. **To remove all files that start with 'a', 'b', or 'c' and end with 'e' or 't'**  
    `$ rm [abc]*[et]`


**Q1 Which of the following Command will List all Files that have exactly 3 Characters Present in the Current Working Directory?**

- A `ls ***`
- B `ls ???`
- C `ls !!!`
-  `ls &&&`
  
**Ans:** B

---

**Q2 Which of the following Commands will Copy all Files that End with `.pdf` to `dir1`?**

- A `cp ?.pdf dir1`
- B `cp .pdf* dir1`
- C `cp *.pdf dir1`
  
**Ans:** C

---

**Q3 Which of the following Command will Move all the Files that Begin with the Letter 'a' and End with the Letter 'n' to `dir1`?**

- `$ mv a*n dir1`

---

**Q4 Which of the following Commands will Display Contents of all Files that Begin with a Digit and End with the Letter 'a' OR 'e' OR 'i' OR 'o' OR 'u'?**

- `$ cat [[:digit:]]*[aeiou]`
- `$ cat [0-9]*[aeiou]`

---

**Q5 Which of the following Commands will List all Files that Begin with a Lowercase Alphabet Symbol, have the Letter 'd' in the 3rd Character Position, and End with an Uppercase Letter?**

- `$ ls [[:lower:]]?d*[[:upper:]]`

---

**Q6 Which of the following Commands will List all `.jpg` Files Present in the `Pictures` Directory?**

- `$ ls /home/durgasoft/Pictures/*.jpg`
- `$ ls ~/Pictures/*.jpg`

---
**Q7 Which of the following Regular Expressions will Match the File Named `demoA.txt`?**

- A `*`
- B `demo?.txt`
- C `demo*`
- D `*.txt`
- E `demo[A-Z].txt`
- F All of these

**Ans:** F

---
**Q8 Which of the following Regular Expressions can Match the Files:**

`student_reportA.pdf`, `student_reportB.pdf`, `student_reportC.pdf`

- A `??.pdf`
- B `report*.pdf`
- C `*[A-Z].pdf`
- D `student*.pdf`

**Ans:** C, D
