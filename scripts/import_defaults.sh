#!/bin/bash

# Default input directories for various options
default_dir="$HOME/.config/defaults"
dropbox_dir="$HOME/Dropbox/config/defaults"
icloud_dir="$HOME/Library/Mobile Documents/com~apple~CloudDocs/config/defaults"
workdocs_dir="$HOME/Library/CloudStorage/WorkDocsDrive-Documents/config/defaults"
box_dir="$HOME/Library/CloudStorage/Box-Box/config/defaults"  # Box.com default directory

# Show help if the user asks for it
function show_help {
    echo "Usage: $0 [custom_input_directory] [options]"
    echo "Options:"
    echo "  -d, --dropbox        Use Dropbox default input directory"
    echo "  -i, --icloud         Use iCloud default input directory"
    echo "  -wd, --workdocs      Use WorkDocs default input directory"
    echo "  -b, --box            Use Box.com default input directory"
    echo "  -h, --help           Show this help message"
    echo "If no option is provided, ~/.config/defaults will be used."
    exit 0
}

# Initialize input_dir to the default directory
input_dir="$default_dir"

# Parse command-line options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -d|--dropbox)
            input_dir="$dropbox_dir"
            shift
            ;;
        -i|--icloud)
            input_dir="$icloud_dir"
            shift
            ;;
        -wd|--workdocs)
            input_dir="$workdocs_dir"
            shift
            ;;
        -b|--box)
            input_dir="$box_dir"
            shift
            ;;
        -h|--help)
            show_help
            ;;
        *)
            # If the argument is a valid directory, treat it as a custom directory
            if [[ -d "$1" ]]; then
                input_dir="$1"
                shift
            else
                echo "Invalid option or directory: $1"
                show_help
            fi
            ;;
    esac
done

# Display the input directory being used
echo "Using input directory: $input_dir"

# Check if directory exists
if [ ! -d "$input_dir" ]; then
    echo "The directory $input_dir does not exist."
    exit 1
fi

# Initialize a counter for the number of files imported
file_count=0

# Loop through all plist files in the directory
for plist_file in "$input_dir"/*.plist; do
    if [ -f "$plist_file" ]; then
        # Extract the domain from the filename
        domain=$(basename "$plist_file" .plist | tr '_' '.')

        # Import the plist file for the domain
        defaults import "$domain" "$plist_file"

        echo "Imported $domain from $plist_file"
        file_count=$((file_count + 1)) # Increment the file counter
    fi
done

# Check if no plist files were found
if [ "$file_count" -eq 0 ]; then
    echo "No plist files found in $input_dir."
else
    # Print the final message
    echo -e "\n***\n\nAll imports are complete. $file_count .plist files were imported from $input_dir."
fi