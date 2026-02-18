#!/bin/bash
# For loop demonstrations

echo "=== Basic For Loop Examples ==="

echo "Counting from 1 to 5:"
for i in {1..5}; do
 echo "Count: $i"
done

echo ""

echo "Favorite programming languages:"
for language in "Python" "Bash" "JavaScript" "Java" "C++"; do
 echo "- $language"
done

echo ""

echo "Files in current directory:"
for file in *.sh; do
 if [ -f "$file" ]; then
  echo "Script file: $file"
 fi
done

echo ""

echo "Even numbers from 2 to 10:"
for ((i=2; i<=10; i+=2)); do
 echo "Even number: $i"
done
