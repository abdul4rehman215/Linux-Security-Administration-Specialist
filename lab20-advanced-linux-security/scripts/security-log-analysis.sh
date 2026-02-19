#!/bin/bash

LOG_REPORT="security_log_analysis_$(date +%Y%m%d_%H%M%S).txt"

echo "=== Security Log Analysis Report ===" > $LOG_REPORT
echo "Analysis Date: $(date)" >> $LOG_REPORT
echo >> $LOG_REPORT

echo "=== AUTHENTICATION FAILURES ===" >> $LOG_REPORT
grep "Failed password" /var/log/auth.log 2>/dev/null | tail -10 >> $LOG_REPORT
echo >> $LOG_REPORT

echo "=== SUDO USAGE ===" >> $LOG_REPORT
grep "sudo:" /var/log/auth.log 2>/dev/null | tail -10 >> $LOG_REPORT
echo >> $LOG_REPORT

echo "=== SYSTEM ERRORS ===" >> $LOG_REPORT
grep -i "error" /var/log/syslog 2>/dev/null | tail -10 >> $LOG_REPORT
echo >> $LOG_REPORT

echo "=== FIREWALL LOGS ===" >> $LOG_REPORT
grep "IPTABLES-DROPPED" /var/log/syslog 2>/dev/null | tail -10 >> $LOG_REPORT
grep "nftables-dropped" /var/log/syslog 2>/dev/null | tail -10 >> $LOG_REPORT
echo >> $LOG_REPORT

echo "=== NETWORK ACTIVITY ===" >> $LOG_REPORT
ss -tuln >> $LOG_REPORT
echo >> $LOG_REPORT

echo "=== PROCESS ANALYSIS ===" >> $LOG_REPORT
echo "Top CPU usage:" >> $LOG_REPORT
ps aux --sort=-%cpu | head -10 >> $LOG_REPORT
echo >> $LOG_REPORT

echo "Top Memory usage:" >> $LOG_REPORT
ps aux --sort=-%mem | head -10 >> $LOG_REPORT
echo >> $LOG_REPORT

echo "Log analysis completed. Report saved to: $LOG_REPORT"
