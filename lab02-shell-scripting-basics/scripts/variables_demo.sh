#!/bin/bash
# Variables demonstration script

NAME="John Doe"
AGE=25
CURRENT_DATE=$(date)
CURRENT_USER=$(whoami)
HOME_DIR=$HOME

echo "=== Personal Information ==="
echo "Name: $NAME"
echo "Age: $AGE"
echo "Current User: $CURRENT_USER"
echo "Home Directory: $HOME_DIR"
echo "Current Date: $CURRENT_DATE"

echo ""
echo "Please enter your favorite color:"
read FAVORITE_COLOR
echo "Your favorite color is: $FAVORITE_COLOR"
