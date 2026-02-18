#!/bin/bash
# Lab 8 – Systemd Service Management Commands Executed

# -----------------------------------------
# Task 1: systemd Basics & Service Control
# -----------------------------------------

systemctl --version
systemctl status
systemctl list-units --type=service
systemctl list-unit-files --type=service

systemctl status ssh

sudo systemctl stop cron
systemctl status cron

sudo systemctl start cron
sudo systemctl restart cron
sudo systemctl reload cron

systemctl is-enabled cron
sudo systemctl disable cron
systemctl is-enabled cron
sudo systemctl enable cron
sudo systemctl enable --now cron

sudo systemctl mask cron
sudo systemctl start cron
sudo systemctl unmask cron

systemctl list-dependencies cron

# -----------------------------------------
# Task 2: Custom Service Creation
# -----------------------------------------

sudo mkdir -p /opt/myapp

sudo nano /opt/myapp/myservice.sh
sudo chmod +x /opt/myapp/myservice.sh
sudo /opt/myapp/myservice.sh &
sudo tail -5 /var/log/myservice.log
sudo pkill -f myservice.sh

sudo nano /etc/systemd/system/myservice.service
sudo systemctl daemon-reload
systemctl status myservice
sudo systemctl start myservice
systemctl status myservice
sudo systemctl enable myservice
sudo tail -f /var/log/myservice.log

# Advanced Service

sudo nano /opt/myapp/advanced-service.sh
sudo chmod +x /opt/myapp/advanced-service.sh

sudo nano /etc/default/advanced-service

sudo nano /etc/systemd/system/advanced-service.service
sudo systemctl daemon-reload
sudo systemctl start advanced-service
sudo systemctl enable advanced-service
systemctl status advanced-service
sudo tail /var/log/advanced-service.log

# -----------------------------------------
# Task 3: journalctl Monitoring
# -----------------------------------------

sudo journalctl
sudo journalctl -u myservice
sudo journalctl -u myservice -f
sudo journalctl -b
sudo journalctl --since "1 hour ago"

sudo journalctl -p err
sudo journalctl -u myservice -u advanced-service
sudo journalctl -u myservice -o json-pretty | head
sudo journalctl -u myservice --since "10 minutes ago" --until "5 minutes ago"
sudo journalctl -k | head

sudo journalctl -u myservice --since "today" | grep -i start
sudo journalctl -u myservice -p err --since "today"
sudo journalctl -u myservice -n 50
sudo journalctl -u myservice --since "1 hour ago" > /tmp/myservice-logs.txt
cat /tmp/myservice-logs.txt | head

sudo journalctl --disk-usage
sudo systemctl status systemd-journald
sudo systemctl kill --kill-who=main --signal=SIGUSR2 systemd-journald
sudo journalctl --vacuum-time=7d
sudo journalctl --verify

# -----------------------------------------
# Troubleshooting Exercise
# -----------------------------------------

sudo nano /opt/myapp/problem-service.sh
sudo chmod +x /opt/myapp/problem-service.sh

sudo nano /etc/systemd/system/problem-service.service
sudo systemctl daemon-reload
sudo systemctl start problem-service
systemctl status problem-service
sudo journalctl -u problem-service -n 20

sudo nano /opt/myapp/problem-service.sh
sudo systemctl restart problem-service
systemctl status problem-service
sudo tail /var/log/problem-service.log

# -----------------------------------------
# Security Hardening
# -----------------------------------------

sudo useradd -r -s /bin/false myservice-user
id myservice-user

sudo nano /etc/systemd/system/myservice.service
sudo chown myservice-user:myservice-user /opt/myapp/myservice.sh

sudo touch /var/log/myservice.log
sudo chown myservice-user:myservice-user /var/log/myservice.log

sudo systemctl daemon-reload
sudo systemctl restart myservice
systemctl status myservice
ps -o user,pid,cmd -p 2614

# -----------------------------------------
# Final Verification
# -----------------------------------------

systemctl list-unit-files | grep -E "(myservice|advanced-service|problem-service)"
systemctl status myservice advanced-service problem-service
systemctl is-enabled myservice advanced-service

sudo systemctl stop myservice advanced-service problem-service
sudo systemctl disable myservice advanced-service problem-service
sudo rm /etc/systemd/system/myservice.service
sudo rm /etc/systemd/system/advanced-service.service
sudo rm /etc/systemd/system/problem-service.service
sudo systemctl daemon-reload

which systemctl journalctl | wc -l
systemctl list-unit-files | grep myservice
