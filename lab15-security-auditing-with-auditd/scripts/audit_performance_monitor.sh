#!/bin/bash

echo "=== Audit Performance Monitor ==="
echo ""

echo "Audit daemon status:"
sudo auditctl -s
echo ""

echo "Disk usage for audit logs:"
du -sh /var/log/audit/
echo ""

echo "Current audit rate:"
sudo auditctl -s | grep rate
echo ""

echo "Memory usage by auditd:"
ps aux | grep auditd | grep -v grep
echo ""

echo "=== End of Performance Report ==="
