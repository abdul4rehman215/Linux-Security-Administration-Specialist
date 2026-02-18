#!/bin/bash
# Advanced conditional logic demonstration

echo "=== Number Analysis Tool ==="
echo "Enter a number:"
read NUMBER

# Validate input is a number
if ! [[ "$NUMBER" =~ ^-?[0-9]+$ ]]; then
 echo "Error: Please enter a valid integer!"
 exit 1
fi

echo "Analyzing number: $NUMBER"

# Positive / Negative / Zero check
if [ "$NUMBER" -gt 0 ]; then
 echo "Number is positive"
elif [ "$NUMBER" -lt 0 ]; then
 echo "Number is negative"
else
 echo "Number is zero"
fi

# Even or Odd
if [ $((NUMBER % 2)) -eq 0 ]; then
 echo "Number is even"
else
 echo "Number is odd"
fi

# Range checking
if [ "$NUMBER" -ge 1 ] && [ "$NUMBER" -le 10 ]; then
 echo "Number is between 1 and 10 (inclusive)"
elif [ "$NUMBER" -ge 11 ] && [ "$NUMBER" -le 100 ]; then
 echo "Number is between 11 and 100 (inclusive)"
else
 echo "Number is outside the range 1-100"
fi

# Multiple condition example
if [ "$NUMBER" -gt 0 ] && [ $((NUMBER % 5)) -eq 0 ]; then
 echo "Number is positive and divisible by 5"
fi
