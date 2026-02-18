#!/bin/bash

# ===============================
# Lab 17 – System Hardening with Fail2Ban
# Commands Executed
# ===============================


# -------------------------------
# Task 1: Installation
# -------------------------------

sudo apt update
sudo apt install fail2ban -y

fail2ban-client version


# -------------------------------
# Explore Fail2Ban Structure
# -------------------------------

cd /etc/fail2ban
ls -la
sudo head -10 fail2ban.conf
sudo head -15 jail.conf


# -------------------------------
# Create Local Config Files
# -------------------------------

sudo cp jail.conf jail.local
sudo cp fail2ban.conf fail2ban.local
ls -la *.local


# -------------------------------
# Configure SSH Jail
# -------------------------------

sudo nano /etc/fail2ban/jail.local
sudo nano /etc/fail2ban/filter.d/sshd-custom.conf


# -------------------------------
# Start and Enable Service
# -------------------------------

sudo systemctl start fail2ban
sudo systemctl enable fail2ban
sudo systemctl status fail2ban

sudo fail2ban-client status
sudo fail2ban-client status sshd


# -------------------------------
# Configure Apache / Web Jails
# -------------------------------

sudo nano /etc/fail2ban/jail.local
sudo nano /etc/fail2ban/filter.d/webapp-custom.conf


# -------------------------------
# Configure FTP Jails
# -------------------------------

sudo nano /etc/fail2ban/jail.local


# -------------------------------
# Restart Service
# -------------------------------

sudo systemctl restart fail2ban
sudo fail2ban-client status


# -------------------------------
# Progressive Ban Configuration
# -------------------------------

sudo nano /etc/fail2ban/jail.local
sudo systemctl restart fail2ban


# -------------------------------
# Create Monitoring Script
# -------------------------------

sudo nano /usr/local/bin/fail2ban-monitor.sh
sudo chmod +x /usr/local/bin/fail2ban-monitor.sh
sudo /usr/local/bin/fail2ban-monitor.sh
sudo tail -15 /var/log/fail2ban-monitor.log


# -------------------------------
# Add Monitoring Cron Job
# -------------------------------

sudo crontab -e


# -------------------------------
# Create Management Script
# -------------------------------

sudo nano /usr/local/bin/fail2ban-manage.sh
sudo chmod +x /usr/local/bin/fail2ban-manage.sh
sudo /usr/local/bin/fail2ban-manage.sh --status


# -------------------------------
# Restart and Verify
# -------------------------------

sudo systemctl restart fail2ban
sudo systemctl status fail2ban
sudo fail2ban-client status
sudo fail2ban-client status sshd


# -------------------------------
# Test Ban Functionality
# -------------------------------

sudo tail -f /var/log/auth.log &
ssh invaliduser@localhost
sudo fail2ban-client status sshd
sudo tail -20 /var/log/fail2ban.log


# -------------------------------
# Log Monitoring Validation
# -------------------------------

sudo fail2ban-client get sshd logpath
ls -la /var/log/auth.log

sudo logrotate -f /etc/logrotate.d/rsyslog
sudo systemctl restart fail2ban


# -------------------------------
# Configure Whitelist
# -------------------------------

sudo nano /etc/fail2ban/jail.local
sudo systemctl restart fail2ban


# -------------------------------
# Install Mail Utilities
# -------------------------------

sudo apt install mailutils -y
sudo nano /etc/fail2ban/jail.local
sudo systemctl restart fail2ban


# -------------------------------
# Performance Optimization
# -------------------------------

sudo nano /etc/fail2ban/fail2ban.local
sudo systemctl restart fail2ban


# -------------------------------
# Maintenance Script
# -------------------------------

sudo nano /usr/local/bin/fail2ban-maintenance.sh
sudo chmod +x /usr/local/bin/fail2ban-maintenance.sh
sudo crontab -e


# -------------------------------
# Troubleshooting Checks
# -------------------------------

sudo fail2ban-client -t
sudo iptables -L -n


# -------------------------------
# Final Verification Script
# -------------------------------

sudo nano /usr/local/bin/fail2ban-verify.sh
sudo chmod +x /usr/local/bin/fail2ban-verify.sh
sudo /usr/local/bin/fail2ban-verify.sh
