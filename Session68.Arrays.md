
## Arrays in Bash
If we want to represent a group of values with a single name, we use arrays.

### How to Create Arrays:

1. **If Elements Are Known at the Beginning**:
   ```bash
   courses=(Java Python Linux Django)
   ```

    Bash arrays allow non-consecutive indices, meaning you can assign values to specific indices while leaving others unassigned. Missing indices will remain empty and have no values. For example, you can define `courses[3]="Django"` and `courses[10]="DataScience"` without assigning values to the indices in between.

2. **If Elements Are Not Known at the Beginning**:
   ```bash
   courses[0]=Java
   courses[1]=Python
   courses[2]=Linux
   courses[3]=Django
   ```

   **Non-Consecutive Index Values**:
   ```bash
   courses[10]=DataScience
   courses[20]=Devops
   ```

### How to Access Array Elements:

1. **By Index (Zero-Based)**:
   - `${courses[0]}`: First element  
   - `${courses[1]}`: Second element  

2. **Access All Elements**:
   - `${courses[@]}`: All elements in the array.
   - `${courses[*]}`: All elements as a single string (separated by the first character in `IFS`).

3. **Access All Indexes**:
   - `${!courses[@]}`: Returns all indexes where elements are available.

4. **Count Elements**:
   - `${#courses[@]}`: Returns the total number of elements.

5. **Length of an Element**:
   - `${#courses[0]}`: Returns the length of the first element.


### Demo Script:
```bash
#!/bin/bash

# Define the array with some initial and random elements
courses[0]=Java
courses[1]=Python
courses[2]=Linux
courses[3]=Django
courses[10]=DataScience
courses[20]=Devops

# Access elements
echo "First Element : ${courses[0]}"
echo "Second Element : ${courses[1]}"
echo "All Elements with @ : ${courses[@]}"
echo "All Elements with * : ${courses[*]}"
echo "The indices where elements are available : ${!courses[@]}"
echo "The total number of elements : ${#courses[@]}"
echo "The length of the first element : ${#courses[0]}"
```


### Expected Output:
```plaintext
First Element : Java
Second Element : Python
All Elements with @ : Java Python Linux Django DataScience Devops
All Elements with * : Java Python Linux Django DataScience Devops
The indices where elements are available : 0 1 2 3 10 20
The total number of elements : 6
The length of the first element : 4
```

```bash
#!/bin/bash

# Declare an array to track the deployment status of microservices in different environments
deployment[1]="ServiceA - Development"
deployment[5]="ServiceB - Testing"
deployment[10]="ServiceC - Production"

# Display the deployment status of each service in various environments
echo "Service in Development: ${deployment[1]}"
echo "Service in Testing: ${deployment[5]}"
echo "Service in Production: ${deployment[10]}"

# Show all deployments and the corresponding environments (including gaps in deployment)
echo "All deployments: ${deployment[@]}"
echo "Indices of deployments: ${!deployment[@]}"
echo "Total number of deployments: ${#deployment[@]}"
```