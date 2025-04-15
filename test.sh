#!/bin/bash

# Loop through all files that start with "Session" in the current directory
for file in Session*.md; do
    # Check if file exists (to avoid issues if no matching files)
    if [ -f "$file" ]; then
        # Create new filename by removing "Session" from the original filename
        newname="${file#Session}"
        
        # Rename the file
        mv "$file" "$newname"
        
        # Print information about the renaming
        echo "Renamed: $file → $newname"
    fi
done

echo "Renaming complete!"


