#!/bin/bash

echo "======================================"
echo "UFW Firewall Monitoring Report"
echo "======================================"
echo

echo "Current UFW Status:"
sudo ufw status
echo

echo "--------------------------------------"
echo "Recent Blocked Connections (Last 10)"
echo "--------------------------------------"
sudo grep "UFW BLOCK" /var/log/syslog | tail -10 | awk '{print $1, $2, $3, $12}'
echo

echo "--------------------------------------"
echo "Recent Allowed Connections (Last 5)"
echo "--------------------------------------"
sudo grep "UFW ALLOW" /var/log/syslog | tail -5 | awk '{print $1, $2, $3, $12}'
echo

echo "--------------------------------------"
echo "Top Blocked IP Addresses"
echo "--------------------------------------"
sudo grep "UFW BLOCK" /var/log/syslog | \
awk -F'SRC=' '{print $2}' | awk '{print $1}' | \
sort | uniq -c | sort -nr | head -5
echo

echo "--------------------------------------"
echo "Listening Services Allowed by UFW"
echo "--------------------------------------"
sudo ufw show listening
echo

echo "Monitoring complete!"
