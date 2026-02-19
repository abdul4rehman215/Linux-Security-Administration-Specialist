#!/bin/bash

SCAN_REPORT="network_scan_$(date +%Y%m%d_%H%M%S).txt"

echo "=== Network Security Scan Report ===" > $SCAN_REPORT
echo "Scan Date: $(date)" >> $SCAN_REPORT
echo >> $SCAN_REPORT

LOCAL_IP=$(ip route get 8.8.8.8 | awk '{print $7; exit}')
echo "Local IP Address: $LOCAL_IP" >> $SCAN_REPORT
echo >> $SCAN_REPORT

echo "=== LOCALHOST PORT SCAN ===" >> $SCAN_REPORT
nmap -sS -O localhost >> $SCAN_REPORT 2>&1
echo >> $SCAN_REPORT

echo "=== SERVICE DETECTION ===" >> $SCAN_REPORT
nmap -sV localhost >> $SCAN_REPORT 2>&1
echo >> $SCAN_REPORT

echo "=== VULNERABILITY SCAN ===" >> $SCAN_REPORT
nmap --script vuln localhost >> $SCAN_REPORT 2>&1
echo >> $SCAN_REPORT

echo "=== COMMON PORT CONNECTIVITY ===" >> $SCAN_REPORT
for port in 21 22 23 25 53 80 110 143 443 993 995; do
    if nc -z localhost $port 2>/dev/null; then
        echo "Port $port: OPEN" >> $SCAN_REPORT
    else
        echo "Port $port: CLOSED" >> $SCAN_REPORT
    fi
done

echo >> $SCAN_REPORT
echo "Network scan completed. Report saved to: $SCAN_REPORT"
