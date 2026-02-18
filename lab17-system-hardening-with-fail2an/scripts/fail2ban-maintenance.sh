#!/bin/bash

# Fail2Ban Maintenance Script

LOG_FILE="/var/log/fail2ban-maintenance.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "=== Fail2Ban Maintenance - $DATE ===" >> $LOG_FILE

# Reload Configuration
echo "Reloading Fail2Ban configuration..." >> $LOG_FILE
fail2ban-client reload >> $LOG_FILE 2>&1

# Clean Old Database Entries
echo "Cleaning database..." >> $LOG_FILE
fail2ban-client set dbpurgeage 604800 >> $LOG_FILE 2>&1

# Rotate Log If Too Large
if [ -f /var/log/fail2ban.log ]; then
    LOG_SIZE=$(stat -c%s /var/log/fail2ban.log)
    if [ $LOG_SIZE -gt 10485760 ]; then
        echo "Rotating large log file..." >> $LOG_FILE
        logrotate -f /etc/logrotate.d/fail2ban >> $LOG_FILE 2>&1
    fi
fi

# Check Configuration Validity
echo "Checking configuration..." >> $LOG_FILE
fail2ban-client -t >> $LOG_FILE 2>&1

echo "Maintenance completed." >> $LOG_FILE
echo "" >> $LOG_FILE
