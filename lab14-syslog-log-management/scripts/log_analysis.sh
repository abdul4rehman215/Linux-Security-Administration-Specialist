#!/bin/bash

echo "=== System Log Analysis ==="

echo "1. Rsyslog Status:"
sudo systemctl status rsyslog --no-pager

echo -e "\n2. Journal Disk Usage:"
journalctl --disk-usage

echo -e "\n3. Recent System Errors:"
journalctl -p err --since "1 hour ago" --no-pager

echo -e "\n4. Log File Sizes:"
sudo du -sh /var/log/* 2>/dev/null | sort -hr | head -10

echo -e "\n5. Remote Log Status:"
if [ -d /var/log/remote ]; then
 sudo find /var/log/remote -type f -exec ls -lh {} \;
fi

echo -e "\n6. Logrotate Status:"
sudo logrotate -d /etc/logrotate.conf 2>&1 | grep -E "(error|warning)" || echo "No errors found"
