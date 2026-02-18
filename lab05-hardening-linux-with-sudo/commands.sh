#!/bin/bash
# Lab 05 - Hardening Linux with sudo
# Commands Executed During Lab

# ===============================
# Environment Verification
# ===============================

cat /etc/os-release
sudo --version
sudo -l
ls -la /etc/sudoers
ls -la /etc/sudoers.d/

# ===============================
# Task 1 - Secure sudoers Configuration
# ===============================

sudo visudo

sudo cp /etc/sudoers /etc/sudoers.backup.$(date +%Y%m%d)
ls -la /etc/sudoers.backup.*

sudo -l

# ===============================
# Task 2 - User & Group Setup
# ===============================

sudo useradd -m -s /bin/bash webadmin
sudo useradd -m -s /bin/bash dbadmin
sudo useradd -m -s /bin/bash developer
sudo useradd -m -s /bin/bash auditor

sudo passwd webadmin
sudo passwd dbadmin
sudo passwd developer
sudo passwd auditor

sudo groupadd web-operators
sudo groupadd db-operators
sudo groupadd dev-team
sudo groupadd audit-team

sudo usermod -a -G web-operators webadmin
sudo usermod -a -G db-operators dbadmin
sudo usermod -a -G dev-team developer
sudo usermod -a -G audit-team auditor

id webadmin
id dbadmin
id developer
id auditor

# ===============================
# Configure sudoers.d Policies
# ===============================

sudo visudo -f /etc/sudoers.d/web-operators
sudo visudo -f /etc/sudoers.d/db-operators
sudo visudo -f /etc/sudoers.d/dev-team
sudo visudo -f /etc/sudoers.d/audit-team

# ===============================
# Test Role-Based Access
# ===============================

su - webadmin
sudo systemctl status apache2
sudo systemctl restart apache2
sudo cat /etc/passwd
exit

su - dbadmin
sudo systemctl status mysql
sudo systemctl restart mysql
sudo apt update
exit

su - developer
sudo apt update
sudo apt install curl -y
sudo rm -rf /etc/passwd
exit

su - auditor
sudo tail /var/log/syslog
sudo systemctl status ssh
sudo systemctl restart ssh
exit

# ===============================
# Task 3 - Logging Configuration
# ===============================

sudo mkdir -p /var/log/sudo-io
sudo chmod 750 /var/log/sudo-io
sudo chown root:adm /var/log/sudo-io
ls -ld /var/log/sudo-io

sudo visudo

sudo nano /etc/rsyslog.d/50-sudo.conf
sudo systemctl restart rsyslog
sudo systemctl status rsyslog

# ===============================
# Log Rotation Setup
# ===============================

sudo nano /etc/logrotate.d/sudo
sudo logrotate -d /etc/logrotate.d/sudo

# ===============================
# Logging Validation
# ===============================

sudo ls /root
sudo cat /etc/passwd | head -5
sudo systemctl status ssh

sudo tail -f /var/log/sudo.log
sudo tail -f /var/log/auth.log | grep sudo
sudo tail -f /var/log/sudo-commands.log

sudo ls -la /var/log/sudo-io/
sudo find /var/log/sudo-io -name "*.log" -type f | head -1 | xargs sudo cat

# ===============================
# Monitoring Script Deployment
# ===============================

sudo nano /usr/local/bin/sudo-monitor.sh
sudo chmod +x /usr/local/bin/sudo-monitor.sh
ls -la /usr/local/bin/sudo-monitor.sh

sudo /usr/local/bin/sudo-monitor.sh
sudo tail -5 /var/log/auth.log | grep sudo-monitor

sudo crontab -e
sudo crontab -l

# ===============================
# Configuration Validation
# ===============================

sudo visudo -c

su - webadmin -c "sudo -l"
su - dbadmin -c "sudo -l"
su - developer -c "sudo -l"
su - auditor -c "sudo -l"

sudo tail -20 /var/log/sudo.log
sudo tail -20 /var/log/auth.log | grep sudo

ls -la /var/log/sudo*

sudo logrotate -d /etc/logrotate.d/sudo
