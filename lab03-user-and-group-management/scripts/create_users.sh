#!/bin/bash
# Bulk User Creation Script
# Lab 03 – User and Group Management
# Author: Toor
# Purpose: Create multiple intern users with default settings

# Array of users to create
users=("intern1" "intern2" "intern3")

# Loop through users and create accounts
for user in "${users[@]}"; do
    sudo useradd -m -G users -s /bin/bash "$user"
    echo "Created user: $user"
done
