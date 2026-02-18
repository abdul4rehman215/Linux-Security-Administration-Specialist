#!/bin/bash
# Conditional statements demonstration

echo "=== File and Directory Checker ==="
echo "Enter a file or directory path:"
read PATH_INPUT

if [ -e "$PATH_INPUT" ]; then
 echo "Path exists!"

 if [ -f "$PATH_INPUT" ]; then
  echo "It's a regular file."
  FILE_SIZE=$(stat -c%s "$PATH_INPUT")
  echo "File size: $FILE_SIZE bytes"

  if [ -r "$PATH_INPUT" ]; then
   echo "File is readable."
  else
   echo "File is not readable."
  fi

 elif [ -d "$PATH_INPUT" ]; then
  echo "It's a directory."
  FILE_COUNT=$(ls -1 "$PATH_INPUT" | wc -l)
  echo "Number of items in directory: $FILE_COUNT"
 fi

else
 echo "Path does not exist!"
 echo "Would you like to create it? (y/n)"
 read CREATE_CHOICE

 if [ "$CREATE_CHOICE" = "y" ] || [ "$CREATE_CHOICE" = "Y" ]; then
  echo "Creating directory..."
  mkdir -p "$PATH_INPUT"
  echo "Directory created successfully!"
 else
  echo "No action taken."
 fi
fi
