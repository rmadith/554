#!/bin/bash

# Define the folder containing the items
folder=images_bmp;

# Check if the folder exists
# if [ ! -d $folder ]; then
#     echo Folder $folder not found
#     exit 1
# fi

echo "hello world!";

# Iterate over each item in the folder
for item in "$folder"/*; do
    echo $item
    # Check if the item is a file
    if [ -f $item ]; then
        echo Running Perl script for $item
        # Run your Perl script here
        perl bmp24_to_hex6.pl $item images_out
    fi
done

