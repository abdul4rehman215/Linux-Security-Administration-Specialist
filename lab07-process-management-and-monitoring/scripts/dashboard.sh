#!/bin/bash
# Process monitoring dashboard

clear
echo "=== Process Monitoring Dashboard ==="
echo "Current Time: $(date)"
echo

echo "=== System Load ==="
uptime
echo

echo "=== Top 5 CPU Processes ==="
ps aux --sort=-%cpu | head -6
echo

echo "=== Top 5 Memory Processes ==="
ps aux --sort=-%mem | head -6
echo

echo "=== Recent Alerts ==="
echo "CPU Alerts:"
tail -5 ~/process_monitoring/cpu_alerts.log 2>/dev/null || echo "No CPU alerts"
echo
echo "Memory Alerts:"
tail -5 ~/process_monitoring/memory_alerts.log 2>/dev/null || echo "No memory alerts"
