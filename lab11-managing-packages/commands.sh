#!/bin/bash
# Lab 11 – Managing Packages with APT / YUM (DNF)
# All Commands Executed During Lab

############################
# 🟢 UBUNTU 24.04 – APT
############################

# Identify distribution
cat /etc/os-release

# Verify package manager
which apt || which dnf || which yum

# Update package repository cache
sudo apt update

# Search package
apt search htop

# View package details
apt show htop

# Install package
sudo apt install htop -y

# Verify installation
dpkg -l | grep htop

# Launch htop
htop

# Install multiple packages
sudo apt install curl wget tree vim -y

# Upgrade all packages
sudo apt upgrade -y

# Upgrade specific package
sudo apt install --only-upgrade htop -y

# Remove package (keep config)
sudo apt remove tree -y

# Purge package
sudo apt purge tree -y

# Remove unused dependencies
sudo apt autoremove -y

############################
# 🔵 CENTOS STREAM 9 – DNF
############################

# Identify distribution
cat /etc/os-release

# Update metadata
sudo dnf update -y

# Search package
dnf search htop

# View package info
dnf info htop

# Install package
sudo dnf install htop -y

# Verify installation
rpm -qa | grep htop

# Launch htop
htop

# Install multiple packages
sudo dnf install curl wget tree vim -y

# Remove package
sudo dnf remove tree -y

# Remove unused dependencies
sudo dnf autoremove -y

# Clean cache
sudo dnf clean all

############################
# 🟢 APT Repository Management
############################

# View APT sources
cat /etc/apt/sources.list

# View additional sources
ls -la /etc/apt/sources.list.d/

# Backup sources list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

ls -l /etc/apt/sources.list.backup

# Add Sublime repository key (modern keyring method)
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/sublimehq-archive-keyring.gpg > /dev/null

# Add repository source
echo "deb [signed-by=/usr/share/keyrings/sublimehq-archive-keyring.gpg] https://download.sublimetext.com/ apt/stable/" | \
sudo tee /etc/apt/sources.list.d/sublime-text.list

# Update repository list
sudo apt update

############################
# 🔵 DNF Repository Management
############################

# List repositories
dnf repolist

# View repo configuration directory
ls -la /etc/yum.repos.d/

# Install EPEL repository
sudo dnf install epel-release -y

# Verify EPEL
dnf repolist | grep epel

# Create custom repository
sudo nano /etc/yum.repos.d/custom.repo

# Verify custom repository
dnf repolist all | grep custom

############################
# 🟢 Package Checker Script
############################

nano package_checker.sh
chmod +x package_checker.sh
./package_checker.sh

############################
# 🟢 Repository Checker Script
############################

nano repo_checker.sh
chmod +x repo_checker.sh
./repo_checker.sh

############################
# 🟢 Package Automation Script
############################

nano package_automation.sh
chmod +x package_automation.sh
./package_automation.sh

############################
# 🟢 Automated Update Script
############################

nano auto_update.sh
chmod +x auto_update.sh
sudo ./auto_update.sh
sudo cat /var/log/auto_update.log

############################
# 🟢 Package Inventory Script
############################

nano package_inventory.sh
chmod +x package_inventory.sh
./package_inventory.sh

ls -la inventory_20260218_150245/
