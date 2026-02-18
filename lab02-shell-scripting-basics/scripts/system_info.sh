#!/bin/bash
# System Information Gathering Script

REPORT_FILE="system_report_$(date +%Y%m%d_%H%M%S).txt"

echo "=== System Information Report Generator ==="
echo "Generating report: $REPORT_FILE"

add_section() {
 echo "" >> "$REPORT_FILE"
 echo "================================" >> "$REPORT_FILE"
 echo "$1" >> "$REPORT_FILE"
 echo "================================" >> "$REPORT_FILE"
}

echo "System Information Report" > "$REPORT_FILE"
echo "Generated on: $(date)" >> "$REPORT_FILE"

add_section "SYSTEM OVERVIEW"
echo "Hostname: $(hostname)" >> "$REPORT_FILE"
echo "Operating System: $(lsb_release -d | cut -f2)" >> "$REPORT_FILE"
echo "Kernel Version: $(uname -r)" >> "$REPORT_FILE"
echo "Architecture: $(uname -m)" >> "$REPORT_FILE"
echo "Uptime: $(uptime -p)" >> "$REPORT_FILE"

add_section "CPU INFORMATION"
echo "CPU Model: $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)" >> "$REPORT_FILE"
echo "CPU Cores: $(nproc)" >> "$REPORT_FILE"
echo "CPU Usage:" >> "$REPORT_FILE"
top -bn1 | grep "Cpu(s)" >> "$REPORT_FILE"

add_section "MEMORY INFORMATION"
free -h >> "$REPORT_FILE"

add_section "DISK USAGE"
df -h >> "$REPORT_FILE"

add_section "NETWORK INFORMATION"
echo "Network Interfaces:" >> "$REPORT_FILE"
ip addr show | grep -E "^[0-9]+:|inet " >> "$REPORT_FILE"

add_section "TOP PROCESSES (by CPU)"
ps aux --sort=-%cpu | head -10 >> "$REPORT_FILE"

add_section "USER INFORMATION"
echo "Current User: $(whoami)" >> "$REPORT_FILE"
echo "Logged in Users:" >> "$REPORT_FILE"
who >> "$REPORT_FILE"

echo "Report generated successfully: $REPORT_FILE"
echo "Use 'cat $REPORT_FILE' to view the complete report"
