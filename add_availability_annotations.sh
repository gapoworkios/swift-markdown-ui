#!/bin/bash

# Script to add @available(iOS 15.0, *) annotations to Swift declarations
# Usage: ./add_availability_annotations.sh [directory] [--dry-run]

set -e

DIRECTORY="${1:-.}"
DRY_RUN="${2}"
IOS_VERSION="15.0"

echo "🔍 Adding @available(iOS $IOS_VERSION, *) annotations to Swift files in: $DIRECTORY"

if [[ "$DRY_RUN" == "--dry-run" ]]; then
    echo "🔍 DRY RUN MODE - No files will be modified"
fi

# Find all Swift files, excluding common test and build directories
find "$DIRECTORY" -name "*.swift" \
    -not -path "*/Tests/*" \
    -not -path "*/*Test*" \
    -not -path "*/test/*" \
    -not -path "*/build/*" \
    -not -path "*/.build/*" \
    -not -path "*/DerivedData/*" \
    -not -path "*/.*" \
    | while read -r file; do
    
    echo "📄 Processing: $(basename "$file")"
    
    # Create a temporary file for processing
    temp_file=$(mktemp)
    
    # Process the file line by line
    changed=0
    while IFS= read -r line; do
        # Check if line matches our patterns and doesn't already have @available
        if [[ $line =~ ^[[:space:]]*(public[[:space:]]+struct[[:space:]]+|public[[:space:]]+extension[[:space:]]+|struct[[:space:]]+|extension[[:space:]]+|private[[:space:]]+struct[[:space:]]+|private[[:space:]]+extension[[:space:]]+|internal[[:space:]]+struct[[:space:]]+|internal[[:space:]]+extension[[:space:]]+|@frozen[[:space:]]+public[[:space:]]+struct[[:space:]]+|@frozen[[:space:]]+struct[[:space:]]+) ]]; then
            # Get the indentation
            indent=$(echo "$line" | sed 's/[^ \t].*//')
            
            # Check if the previous line already has @available
            if [[ ! "$prev_line" =~ @available ]]; then
                # Add @available annotation with same indentation
                echo "${indent}@available(iOS $IOS_VERSION, macOS 12.0, tvOS $IOS_VERSION, watchOS 8.0, *)" >> "$temp_file"
                echo "$line" >> "$temp_file"
                echo "  ✅ Added @available to: $(echo "$line" | xargs)"
                changed=1
            else
                echo "$line" >> "$temp_file"
            fi
        else
            echo "$line" >> "$temp_file"
        fi
        prev_line="$line"
    done < "$file"
    
    # Replace original file if changes were made and not in dry-run mode
    if [[ $changed -eq 1 ]]; then
        if [[ "$DRY_RUN" != "--dry-run" ]]; then
            mv "$temp_file" "$file"
            echo "  📝 Updated: $file"
        else
            echo "  🔍 Would update: $file"
            rm "$temp_file"
        fi
    else
        echo "  ⚪ No changes needed"
        rm "$temp_file"
    fi
done

echo "🎉 Processing complete!"