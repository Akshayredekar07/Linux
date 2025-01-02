#!/bin/bash

factorial() {
    local n=$1
    
    # Input validation
    if ! [[ "$n" =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter a valid non-negative integer" >&2
        exit 1
    fi
    
    # Handle special cases
    if [ $n -eq 0 ] || [ $n -eq 1 ]; then
        echo "The factorial of $n is: 1"
        return 0
    fi
    
    # Check for reasonable input size to prevent overflow
    if [ $n -gt 20 ]; then
        echo "Warning: Result may overflow for numbers larger than 20" >&2
    fi
    
    # Calculate factorial using arithmetic expansion
    local fact=1
    for ((i=2; i<=n; i++)); do
        fact=$((fact * i))
    done
    
    echo "The factorial of $n is: $fact"
}

# Main program
if [ $# -eq 1 ]; then
    # If argument provided via command line
    factorial "$1"
else
    # Interactive mode
    while true; do
        read -p "Enter a number to find factorial (q to quit): " input
        
        # Check for quit condition
        [[ "$input" == "q" ]] && exit 0
        
        factorial "$input"
    done
fi
