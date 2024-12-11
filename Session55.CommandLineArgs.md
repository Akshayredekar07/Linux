
**Command Line Arguments**

The arguments which are passed from the command prompt at the time of executing a script are called command line arguments.

Example:
```bash
$ ./test.sh learning linux is very easy
```
The command line arguments are: `learning`, `linux`, `is`, `very`, `easy`.

Inside the script, we can access command line arguments as follows:

- **$#** → Number of Arguments (5)
- **$0** → Script Name (`./test.sh`)
- **$1** → 1st Argument (`learning`)
- **$2** → 2nd Argument (`linux`)
- **$3** → 3rd Argument (`is`)
- **$4** → 4th Argument (`very`)
- **$5** → 5th Argument (`easy`)
- **$*** → All Arguments (`learning linux is very easy`)
- **$@** → All Arguments (`learning linux is very easy`)
- **$?** → Represents exit code of previously executed command or script.

Example script `test.sh`:
```bash
#! /bin/bash
echo "Number of arguments: $#"
echo "Script Name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Third argument: $3"
echo "Fourth argument: $4"
echo "Fifth argument: $5"
echo "Total arguments: $*"
```

Output when executed:
```bash
$ ./test.sh learning linux is very easy
Number of arguments: 5
Script Name: ./test.sh
First argument: learning
Second argument: linux
Third argument: is
Fourth argument: very
Fifth argument: easy
Total arguments: learning linux is very easy
```

**Difference between $@ and $***:
- **$@** → All command line arguments with space separator (`"$1" "$2" "$3" ...`)
- **$*** → All command line arguments as a single string (`"$1c$2c$3c..."`), where `c` is the first character of the Internal Field Separator (IFS). By default, `IFS` is a space.

To check the default `IFS`:
```bash
$ set | grep "IFS"
IFS=$' \t\n'
```

To change `IFS`:
```bash
#! /bin/bash
IFS="-"
echo "Number of arguments: $#"
echo "Script Name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Third argument: $3"
echo "Fourth argument: $4"
echo "Fifth argument: $5"
echo "Total arguments: $@"
echo "Total arguments: $*"
```

Output after changing `IFS`:
```bash
$ test.sh learning unix is very easy
Number of arguments: 5
Script Name: /home/durgasoft/scripts/test.sh
First argument: learning
Second argument: unix
Third argument: is
Fourth argument: very
Fifth argument: easy
Total arguments: learning unix is very easy
Total arguments: learning-unix-is-very-easy
```

**Note**: The main purpose of command line arguments is to customize the behavior of the script.

**Example Scripts**:

1. **Script to Calculate String Length**:
   ```bash
   #! /bin/bash
   l=$(echo -n "DURGA" | wc -c)
   echo "The Length of given String: $l"
   ```
   This script will work only for the string `DURGA`.

   **Generic Version**:
   ```bash
   #! /bin/bash
   len=$(echo -n "$1" | wc -c)
   echo "The Length of given string $1 : $len"
   ```
   This script will work for any string provided from the command prompt.

   Example usage:
   ```bash
   $ test.sh
   The Length of given string : 0

   $ test.sh durgasoft
   The Length of given durgasoft : 9

   $ test.sh adsfkjshfdjkhsfkjhkjsfhk
   The Length of given string adsfkjshfdjkhsfkjhkjsfhk : 24
   ```

2. **Script to Create Log File with Timestamp**:
   ```bash
   #! /bin/bash
   timestamp=$(date +%d_%m_%Y_%H_%M_%S)
   echo "This is data to log file" >> ${timestamp}.log
   echo "This is extra data to log file" >> ${timestamp}.log
   date >> ${timestamp}.log
   echo >> ${timestamp}.log
   echo "Data Written to log file successfully"
   ```
   This script will create a new log file each time it is executed, with the timestamp reflecting the exact second it was run.

   To create a log file for every minute:
   ```bash
   timestamp=$(date +%d_%m_%Y_%H_%M)
   ```

   For a new log file every hour:
   ```bash
   timestamp=$(date +%d_%m_%Y_%H)
   ```

   For a new log file every day:
   ```bash
   timestamp=$(date +%d_%m_%Y)
   ```