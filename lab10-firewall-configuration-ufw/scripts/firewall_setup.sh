#!/bin/bash

echo "========================================="
echo "Starting UFW Firewall Configuration..."
echo "========================================="

# Reset firewall to clean state
sudo ufw --force reset

# Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow essential services
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow 'Apache Full'

# Allow database & custom app ports
sudo ufw allow 3306/tcp
sudo ufw allow 8080/tcp

# Deny insecure services
sudo ufw deny 23/tcp
sudo ufw deny ftp

# Enable logging
sudo ufw logging medium

# Enable firewall
sudo ufw --force enable

echo
echo "-----------------------------------------"
echo "Current UFW Status:"
sudo ufw status verbose
echo "-----------------------------------------"
echo

echo "UFW Configuration Complete!"
echo "Firewall setup completed successfully!"
