#!/bin/bash
# Nested loops and pattern demonstrations

echo "=== Nested Loop Examples ==="

# Example 1: Multiplication table
echo "Multiplication Table (1-5):"
echo " | 1 2 3 4 5"
echo "---|---------------"

for i in {1..5}; do
 printf "%2d |" $i
 for j in {1..5}; do
  result=$((i * j))
  printf "%3d" $result
 done
 echo ""
done

echo ""

# Example 2: Pattern printing
echo "Number Pattern:"
for i in {1..5}; do
 for j in $(seq 1 $i); do
  echo -n "$j "
 done
 echo ""
done

echo ""

# Example 3: File processing with nested loops
echo "Creating test directories and files..."

for dir in "docs" "images" "scripts"; do
 mkdir -p "test_$dir"
 for file in "file1" "file2" "file3"; do
  touch "test_$dir/${file}.txt"
  echo "Sample content for $file" > "test_$dir/${file}.txt"
 done
done

echo "Directory structure created:"

for dir in test_*; do
 if [ -d "$dir" ]; then
  echo "Directory: $dir"
  for file in "$dir"/*; do
   if [ -f "$file" ]; then
    echo "  File: $(basename "$file")"
   fi
  done
 fi
done
