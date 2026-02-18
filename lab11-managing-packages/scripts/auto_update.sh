#!/bin/bash

# Automated Update Script
# Can be scheduled with cron

LOGFILE="/var/log/auto_update.log"
LOCKFILE="/tmp/auto_update.lock"

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | sudo tee -a "$LOGFILE" > /dev/null
}

# Check if lock file exists (prevent concurrent runs)
if [ -f "$LOCKFILE" ]; then
    log_message "Another update process is already running. Exiting."
    exit 1
fi

# Create lock file
touch "$LOCKFILE"

log_message "Starting automated update process..."

# Detect package manager
if command -v apt &>/dev/null; then
    PKG_MANAGER="apt"
elif command -v dnf &>/dev/null; then
    PKG_MANAGER="dnf"
elif command -v yum &>/dev/null; then
    PKG_MANAGER="yum"
else
    log_message "No supported package manager found."
    rm -f "$LOCKFILE"
    exit 1
fi

log_message "Detected package manager: $PKG_MANAGER"

# Update package lists/repositories
if [ "$PKG_MANAGER" = "apt" ]; then
    log_message "Updating package lists..."
    sudo apt update -y

    log_message "Upgrading packages..."
    sudo apt upgrade -y

    log_message "Removing unused packages..."
    sudo apt autoremove -y

    log_message "Cleaning cache..."
    sudo apt clean

elif [ "$PKG_MANAGER" = "dnf" ]; then
    log_message "Updating packages..."
    sudo dnf update -y

    log_message "Removing unused packages..."
    sudo dnf autoremove -y

    log_message "Cleaning cache..."
    sudo dnf clean all

elif [ "$PKG_MANAGER" = "yum" ]; then
    log_message "Updating packages..."
    sudo yum update -y

    log_message "Removing unused packages..."
    sudo yum autoremove -y

    log_message "Cleaning cache..."
    sudo yum clean all
fi

# Remove lock file
rm -f "$LOCKFILE"

log_message "Automated update completed successfully."
