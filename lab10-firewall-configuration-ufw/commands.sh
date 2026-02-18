#!/bin/bash

# ==========================================
# Lab 10: Firewall Configuration with UFW
# Commands Executed During Lab
# ==========================================


# ------------------------------------------
# Check UFW Installation & Status
# ------------------------------------------
sudo ufw --version
sudo ufw status
sudo ufw status verbose


# ------------------------------------------
# Configure Default Policies
# ------------------------------------------
sudo ufw default deny incoming
sudo ufw default allow outgoing


# ------------------------------------------
# Allow SSH (Critical Before Enable)
# ------------------------------------------
sudo ufw allow ssh


# ------------------------------------------
# Enable Firewall
# ------------------------------------------
sudo ufw enable
sudo ufw status


# ------------------------------------------
# Allow Common Services
# ------------------------------------------
sudo ufw allow http
sudo ufw allow https
sudo ufw allow ftp
sudo ufw status numbered
sudo ufw allow 8080
sudo ufw allow 3306/tcp


# ------------------------------------------
# Deny Specific Services
# ------------------------------------------
sudo ufw deny 23
sudo ufw deny smtp
sudo ufw status verbose


# ------------------------------------------
# IP-Based Rules
# ------------------------------------------
sudo ufw allow from 192.168.1.100
sudo ufw allow from 192.168.1.100 to any port 22
sudo ufw allow from 192.168.1.0/24
sudo ufw deny from 203.0.113.100
sudo ufw allow from 10.0.0.50 to any port 80
sudo ufw status numbered


# ------------------------------------------
# Port Range Rules
# ------------------------------------------
sudo ufw allow 6000:6010/tcp
sudo ufw allow 60000:61000/udp
sudo ufw deny 135:139/tcp


# ------------------------------------------
# Interface-Specific Rules
# ------------------------------------------
ip addr show
sudo ufw allow in on eth0 to any port 80
sudo ufw allow in on lo to any port 3306


# ------------------------------------------
# Application Profiles
# ------------------------------------------
sudo ufw app list
sudo ufw app info 'Apache Full'
sudo ufw allow 'Apache Full'

sudo nano /etc/ufw/applications.d/myapp
sudo ufw app update MyWebApp
sudo ufw allow MyWebApp


# ------------------------------------------
# Logging Configuration
# ------------------------------------------
sudo ufw logging on
sudo ufw logging medium
sudo ufw logging --help
sudo ufw logging high


# ------------------------------------------
# View Logs
# ------------------------------------------
sudo journalctl -u ufw
sudo journalctl -u ufw -n 20
sudo journalctl -u ufw -f
sudo grep UFW /var/log/syslog | tail -5
sudo grep "UFW BLOCK" /var/log/syslog | tail -5


# ------------------------------------------
# Generate Test Traffic
# ------------------------------------------
sudo apt install telnet -y
telnet localhost 23
sudo grep "UFW BLOCK" /var/log/syslog | tail -5
curl -I http://localhost
sudo grep "UFW ALLOW" /var/log/syslog | tail -5


# ------------------------------------------
# Rule Management
# ------------------------------------------
sudo ufw status verbose
sudo ufw status numbered
sudo ufw delete 5
sudo ufw delete allow 8080
sudo ufw insert 1 allow from 192.168.1.50


# ------------------------------------------
# Advanced Inspection
# ------------------------------------------
sudo cat /etc/ufw/ufw.conf
sudo ufw show raw
sudo ufw show listening
sudo ufw show added


# ------------------------------------------
# Reset UFW
# ------------------------------------------
sudo ufw --force reset


# ------------------------------------------
# Automation Script
# ------------------------------------------
nano ~/firewall_setup.sh
chmod +x ~/firewall_setup.sh
./firewall_setup.sh


# ------------------------------------------
# Monitoring Script
# ------------------------------------------
nano ~/ufw_monitor.sh
chmod +x ~/ufw_monitor.sh
./ufw_monitor.sh
