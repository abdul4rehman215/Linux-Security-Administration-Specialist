#!/bin/bash
# While loop demonstrations

echo "=== While Loop Examples ==="

# Example 1: Basic counter
echo "Countdown from 5:"
counter=5
while [ $counter -gt 0 ]; do
 echo "T-minus $counter"
 counter=$((counter - 1))
 sleep 1
done
echo "Blast off!"

echo ""

# Example 2: Reading file line by line
echo "Creating a sample file..."
cat > sample_data.txt << EOF
Apple
Banana
Cherry
Date
Elderberry
EOF

echo "Reading file line by line:"
while IFS= read -r line; do
 echo "Fruit: $line"
done < sample_data.txt

echo ""

# Example 3: Menu-driven loop
echo "=== Simple Menu System ==="
choice=""
while [ "$choice" != "4" ]; do
 echo "Please select an option:"
 echo "1. Show current date"
 echo "2. Show current user"
 echo "3. Show current directory"
 echo "4. Exit"
 echo -n "Enter your choice (1-4): "
 read choice

 case $choice in
 1)
  echo "Current date: $(date)"
  ;;
 2)
  echo "Current user: $(whoami)"
  ;;
 3)
  echo "Current directory: $(pwd)"
  ;;
 4)
  echo "Goodbye!"
  ;;
 *)
  echo "Invalid choice. Please try again."
  ;;
 esac
 echo ""
done
