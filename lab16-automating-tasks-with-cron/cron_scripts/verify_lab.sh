#!/bin/bash

echo "=== Lab 16 Verification ==="
echo ""

echo "1. Cron Service Status:"
systemctl is-active cron && echo "✓ Cron service is running" || echo "✗ Cron service is not running"
echo ""

echo "2. Cron Jobs Configured:"
JOB_COUNT=$(crontab -l 2>/dev/null | grep -v '^#' | grep -v '^$' | wc -l)
echo "✓ $JOB_COUNT cron jobs configured"
echo ""

echo "3. Scripts Created:"
SCRIPT_COUNT=$(ls ~/cron_scripts/*.sh 2>/dev/null | wc -l)
echo "✓ $SCRIPT_COUNT scripts created"
echo ""

echo "4. Log Files Generated:"
LOG_COUNT=$(ls ~/cron_logs/*.log ~/cron_logs/*.txt 2>/dev/null | wc -l)
echo "✓ $LOG_COUNT log files generated"
echo ""

echo "5. Recent Cron Activity:"
if [ -f ~/cron_logs/date_log.txt ]; then
 ENTRIES=$(wc -l < ~/cron_logs/date_log.txt)
 echo "✓ Date logger has $ENTRIES entries"
else
 echo "✗ Date logger not working"
fi
echo ""

echo "6. Dashboard Status:"
if [ -f ~/cron_logs/dashboard.html ]; then
 echo "✓ Dashboard created successfully"
else
 echo "✗ Dashboard not found"
fi
echo ""

echo "=== Current Cron Jobs ==="
crontab -l
echo ""

echo "=== Recent Log Activity ==="

echo "Date Logger (last 3 entries):"
tail -3 ~/cron_logs/date_log.txt 2>/dev/null || echo "No entries found"
echo ""

echo "System Monitor (last 3 entries):"
tail -3 ~/cron_logs/system_monitor.log 2>/dev/null || echo "No entries found"
echo ""

echo "Health Check (last 3 entries):"
tail -3 ~/cron_logs/health_check.log 2>/dev/null || echo "No entries found"
echo ""

echo "=== Lab Verification Complete ==="
