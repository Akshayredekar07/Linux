
# Case Statement in Linux

### Overview
- **Case Statement**: Useful when multiple options are available; avoids using nested `if-else` statements, improving readability and reducing code length.
- **Syntax**:
  ```bash
  case $variable in
    option1 )
      action-1
      ;;
    option2 )
      action-2
      ;;
    option3 )
      action-3
      ;;
    * )
      default action
      ;;
  esac
  ```

#### Notes:
1. Space is optional while defining options.
2. `;;` is used to exit a `case` statement.
3. `;;` is mandatory for all options except the default option.
4. If the default option is placed at the beginning, it will always execute regardless of the input.

---

### Example 1: Number to Word Conversion
```bash
#! /bin/bash
read -p "Enter Any digit from 0 to 9:" n
case $n in
  0) echo "ZERO" ;;
  1) echo "ONE" ;;
  2) echo "TWO" ;;
  3) echo "THREE" ;;
  4) echo "FOUR" ;;
  5) echo "FIVE" ;;
  6) echo "SIX" ;;
  7) echo "SEVEN" ;;
  8) echo "EIGHT" ;;
  9) echo "NINE" ;;
  *) echo "Please enter a digit from 0 to 9 only" ;;
esac
```

---

### Example 2: Favorite Brand
```bash
#! /bin/bash
read -p "Enter Your Favourite Brand: " brand
case $brand in
  "KF") echo "It is children's brand" ;;
  "KO") echo "It is not that much kick" ;;
  "RC") echo "It is too light" ;;
  "FO") echo "Buy one get one FREE" ;;
  *) echo "Other brands are not recommended" ;;
esac
```

---

### Character Class Patterns

| **Pattern**         | **Description**                                            |
|----------------------|------------------------------------------------------------|
| `[abc]`             | → Matches any single character that is either "a", "b", or "c". |
| `[^abc]`            | → Matches any single character that is not "a", "b", or "c".     |
| `[a-z]`             | → Matches any single lowercase letter.                     |
| `[A-Z]`             | → Matches any single uppercase letter.                     |
| `[a-zA-Z]`          | → Matches any single letter (lowercase or uppercase).      |
| `[0-9]`             | → Matches any single digit from 0 to 9.                    |
| `[a-zA-Z0-9]`       | → Matches any single alphanumeric character (letter or digit). |
| `[^a-zA-Z0-9]`      | → Matches any single character that is not alphanumeric (i.e., a special symbol). |


### Example 3: Character Type Check
```bash
#! /bin/bash
read -p "Enter Any Character to check: " ch
case $ch in
  [a-zA-Z]) echo "It is an Alphabet symbol" ;;
  [0-9]) echo "It is a Digit" ;;
  [^a-zA-Z0-9]) echo "It is a Special Symbol" ;;
  *) echo "Enter only one character" ;;
esac
```

**Example Execution:**
```bash
durgasoft@durgasoft:~/scripts$ test.sh
Enter Any Character to check: a
It is an Alphabet symbol

durgasoft@durgasoft:~/scripts$ test.sh
Enter Any Character to check: 8
It is a Digit

durgasoft@durgasoft:~/scripts$ test.sh
Enter Any Character to check: $
It is a Special Symbol

durgasoft@durgasoft:~/scripts$ test.sh
Enter Any Character to check: durga
Enter only one character
```

---

### Example 4: Character Analysis
```bash
#! /bin/bash
read -p "Enter Any Character to check: " ch
case $ch in
  [^a-zA-Z0-9]) echo "It is a Special Character" ;;
  [0-9]) echo "It is a Digit" ;;
  [aeiouAEIOU]) echo "It is a Vowel" ;;
  [^aeiouAEIOU]) echo "It is a Consonant" ;;
  *) echo "Enter only one character" ;;
esac
```

**Example Execution:**
```bash
durgasoft@durgasoft:~/scripts$ test.sh
Enter Any Character to check: a
It is a Vowel

durgasoft@durgasoft:~/scripts$ test.sh
Enter Any Character to check: s
It is a Consonant

durgasoft@durgasoft:~/scripts$ test.sh
Enter Any Character to check: 7
It is a Digit

durgasoft@durgasoft:~/scripts$ test.sh
Enter Any Character to check: $
It is a Special Character
```

---

### Example 5: File Operations
```bash
#! /bin/bash
echo "A  Display Content"
echo "B  Append Content"
echo "C  Overwrite Content"
echo "D  Delete Content"
read -p "Choose Your Option A|B|C|D: " option
case $option in
  A)
    if [ ! -s "abc.txt" ]; then
      echo "It is an empty file"
    else
      echo "The content of the file is:"
      echo "---------------------------"
      cat abc.txt
    fi ;;
  B)
    read -p "Provide your data to append:" data
    echo $data >> abc.txt
    echo "Data Appended" ;;
  C)
    read -p "Provide your data to overwrite:" data
    echo $data > abc.txt
    echo "Old data Overwritten with new data" ;;
  D)
    cat /dev/null > abc.txt
    echo "Deleted the content of the file" ;;
  *) echo "Choose only A|B|C|D. Execute Again" ;;
esac
```

---

### Example 6: Mathematical Operations
```bash
#! /bin/bash
read -p "Enter First Number: " n1
read -p "Enter Second Number: " n2
echo ""
echo "1 --> Addition Operation"
echo "2 --> Subtraction Operation"
echo "3 --> Multiplication Operation"
echo "4 --> Division Operation"
read -p "Choose Your Option 1|2|3|4: " option
case $option in
  1) echo "$n1 + $n2 = $((n1+n2))" ;;
  2) echo "$n1 - $n2 = $((n1-n2))" ;;
  3) echo "$n1 * $n2 = $((n1*n2))" ;;
  4) echo "$n1 / $n2 = $((n1/n2))" ;;
  *) echo "Choose only 1|2|3|4. Execute Again" ;;
esac
```


### Example: Recognizing File Type by Extension
```bash
#!/bin/bash

read -p "Enter a file name (with extension): " filename

case $filename in
  *.txt)
    echo "This is a text file."
    ;;
  *.sh)
    echo "This is a shell script."
    ;;
  *.jpg | *.png)
    echo "This is an image file."
    ;;
  *.pdf)
    echo "This is a PDF file."
    ;;
  *)
    echo "Unknown file type."
    ;;
esac
```

### Execution Output
1. **Input**: `document.txt`  
   **Output**: `This is a text file.`

2. **Input**: `script.sh`  
   **Output**: `This is a shell script.`

3. **Input**: `picture.jpg`  
   **Output**: `This is an image file.`

4. **Input**: `report.pdf`  
   **Output**: `This is a PDF file.`

5. **Input**: `archive.zip`  
   **Output**: `Unknown file type.`


