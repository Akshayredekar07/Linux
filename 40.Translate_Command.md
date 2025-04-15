
## `tr` Command in Linux

The `tr` command (short for **translate**) is used to translate or delete characters. It operates character by character.

Consider `demo.txt` with data
```plaintext
While Learning Linux, It Is Not Required To Eat Anything.
```

### Example 1: Replace Lowercase Vowels with Uppercase Vowels
```bash
$ tr 'aeiou' 'AEIOU' < demo.txt
```
- Replaces all lowercase vowels with their uppercase counterparts.
- **Output:**
  ```
  WhIlE lEArnIng UnIx nOt rEqUIrEd tO EAt.
  ```

### Example 2: Convert Lowercase Letters to Uppercase
```bash
$ tr '[a-z]' '[A-Z]' < demo.txt
```
- Converts all lowercase letters to uppercase.
- **Output:**
  ```
  WHILE LEARNING UNIX NOT REQUIRED TO EAT.
  ```

### Example 3: Swap Case for All Characters
```bash
$ tr '[a-z][A-Z]' '[A-Z][a-z]' < demo.txt
```
- Converts lowercase letters to uppercase and vice versa.
- **Output:**  
  Creates a new file:
  ```bash
  $ tr '[a-z][A-Z]' '[A-Z][a-z]' < demo.txt > temp.txt
  ```

### Example 4: Replace Vowels with a Digit
```bash
$ tr 'aeiou' '7' < demo.txt
```
- Replaces all lowercase vowels with the digit `7`.

### Example 5: Replace Symbols
**`emp.dat` File Content:**
```plaintext
eno|ename|esal|eaddr|dept|gender
100|sunny|1000|mumbai|admin|female
200|bunny|2000|chennai|sales|male
300|chinny|3000|delhi|accounting|female
400|vinny|4000|hyderabad|admin|male
500|pinny|5000|mumbai|sales|female
```

```bash
$ tr '|' '\t' < emp.dat
```
- Replaces the `|` symbol with a tab.
```bash
$ tr '|' ':' < emp.dat
```
- Replaces the `|` symbol with a colon.

### Example 6: Delete Characters
```bash
$ tr -d 'a' < demo.txt
```
- Deletes all occurrences of the letter `a`.
```bash
$ tr -d 'aeiou' < demo.txt
```
- Deletes all lowercase vowels.

### Example 7: Squeeze Repeated Characters
```bash
$ tr -s 'a' < demo.txt
```
- Replaces sequences of repeated `a`s with a single `a`.
- **`-s` Option:** Squeezes repeated characters into a single occurrence.

---

The `tr` command is highly versatile for text manipulation tasks like replacing, deleting, and compressing characters.
