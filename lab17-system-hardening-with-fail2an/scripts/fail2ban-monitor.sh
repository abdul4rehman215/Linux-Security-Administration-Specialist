#!/bin/bash

# Fail2Ban Monitoring Script

LOG_FILE="/var/log/fail2ban-monitor.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "=== Fail2Ban Status Report - $DATE ===" >> $LOG_FILE

# Service Status
echo "Service Status:" >> $LOG_FILE
systemctl is-active fail2ban >> $LOG_FILE

# Overall Jail Status
echo -e "\nOverall Status:" >> $LOG_FILE
fail2ban-client status >> $LOG_FILE

# Detailed Jail Information
for jail in $(fail2ban-client status | grep "Jail list:" | cut -d: -f2 | tr ',' '\n' | tr -d ' ')
do
    echo -e "\n=== $jail Jail Details ===" >> $LOG_FILE
    fail2ban-client status $jail >> $LOG_FILE
done

# Recent Ban Activity
echo -e "\nRecent Ban Activity:" >> $LOG_FILE
tail -20 /var/log/fail2ban.log | grep "Ban" >> $LOG_FILE 2>/dev/null

# System Resource Usage
echo -e "\nSystem Resources:" >> $LOG_FILE
ps aux | grep fail2ban | grep -v grep >> $LOG_FILE

echo "=== End Report ===" >> $LOG_FILE
echo "" >> $LOG_FILE
