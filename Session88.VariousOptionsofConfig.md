
## Various Possibilities of Specifying Date and Time
1. **Every minute**  
   ```plaintext
   * * * * *
   ```
2. **Every 2 minutes**  
   ```plaintext
   */2 * * * *
   ```
3. **Every even minute**  
   ```plaintext
   */2 * * * *
   ```
4. **Every odd minute**  
   ```plaintext
   1-59/2 * * * *
   ```
5. **Every 3 minutes**  
   ```plaintext
   */3 * * * *
   ```
6. **Every 4 minutes**  
   ```plaintext
   */4 * * * *
   ```
7. **Every 15 minutes (quarter-hour)**  
   ```plaintext
   */15 * * * *
   ```
8. **Every hour at 30th minute**  
   ```plaintext
   30 * * * *
   ```
9. **Every half hour**  
   ```plaintext
   */30 * * * *
   ```
10. **Every hour**  
    ```plaintext
    0 * * * *
    ```
11. **Every 2 hours**  
    ```plaintext
    0 */2 * * *
    ```
12. **Every even hour**  
    ```plaintext
    0 */2 * * *
    ```
13. **Every odd hour**  
    ```plaintext
    0 1-23/2 * * *
    ```
14. **Execute at 6:00, 14:00, and 22:00**  
    ```plaintext
    0 6,14,22 * * *
    ```
15. **Every day at midnight**  
    ```plaintext
    0 0 * * *
    ```
16. **Every day at 1:00 AM**  
    ```plaintext
    0 1 * * *
    ```
17. **Every Sunday only once**  
    ```plaintext
    0 0 * * SUN
    ```
18. **Only on weekdays**  
    ```plaintext
    0 0 * * 1-5
    ```
19. **Only on weekends**  
    ```plaintext
    0 0 * * 6,0
    ```
20. **Every month on the 1st**  
    ```plaintext
    0 0 1 * *
    ```
21. **Every other month**  
    ```plaintext
    0 0 1 */2 *
    ```
22. **Every 6 months**  
    ```plaintext
    0 0 1 */6 *
    ```
23. **Every year on January 1st**  
    ```plaintext
    0 0 1 1 *
    ```
24. **Every leap year**  
    ```plaintext
    0 0 29 2 *
    ```
25. **Every February 14th**  
    ```plaintext
    0 0 14 2 *
    ```


## Crontab Shortcuts

| Shortcut    | Equivalent Schedule   |
|-------------|------------------------|
| `@yearly`   | `0 0 1 1 *`           |
| `@annually` | `0 0 1 1 *`           |
| `@monthly`  | `0 0 1 * *`           |
| `@weekly`   | `0 0 * * 0`           |
| `@daily`    | `0 0 * * *`           |
| `@midnight` | `0 0 * * *`           |
| `@hourly`   | `0 0-23 * * *`        |

### Example:
```bash
@hourly echo "Hello from hourly crontab" >> ~/Desktop/hours.txt
```

### Notes:
1. **Crontab shortcuts may not be supported by most Linux flavors.**
2. Use [Crontab Guru](https://crontab.guru/) to verify your configurations.
