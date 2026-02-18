#!/bin/bash
# Lab 7 – Process Management and Monitoring
# Commands Executed

# Environment Verification
cat /etc/os-release | grep PRETTY_NAME

# ==============================
# Task 1 – Process Monitoring
# ==============================

ps
ps aux
ps auxf
ps -u $(whoami)
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head
ps aux | grep bash

top
top -u $(whoami)

sudo apt update && sudo apt install htop -y
htop

# ==============================
# Task 2 – Process Management
# ==============================

nano cpu_intensive.sh
chmod +x cpu_intensive.sh

nano memory_test.sh
chmod +x memory_test.sh

ps -o pid,ni,cmd -p $$
./cpu_intensive.sh &
jobs -l
ps -o pid,ni,cmd | grep cpu_intensive

nice -n 10 ./cpu_intensive.sh &
sudo nice -n -5 ./cpu_intensive.sh &
ps -o pid,ni,cmd | grep cpu_intensive

ps aux | grep cpu_intensive
renice 15 1245
ps -o pid,ni,cmd -p 1245
sudo renice 5 -u $(whoami)

jobs -l
kill %1
pkill -f cpu_intensive
pkill -9 -f cpu_intensive
echo "This would kill all processes for user: $(whoami)"
killall -9 cpu_intensive.sh 2>/dev/null || true
killall -9 memory_test.sh 2>/dev/null || true

# ==============================
# Task 3 – Automation with Cron
# ==============================

mkdir -p ~/process_monitoring
cd ~/process_monitoring

nano system_monitor.sh
chmod +x system_monitor.sh
./system_monitor.sh
cat system_monitor.log

nano cpu_alert.sh
nano memory_alert.sh
chmod +x cpu_alert.sh memory_alert.sh

sudo systemctl status cron
crontab -l
crontab -e
crontab -l

ls -la
tail -20 system_monitor.log

yes > /dev/null &
sleep 180
cat cpu_alerts.log 2>/dev/null || echo "No CPU alerts yet"
kill $CPU_PID

nano dashboard.sh
chmod +x dashboard.sh
./dashboard.sh

nano process_manager.sh
chmod +x process_manager.sh
./process_manager.sh

# ==============================
# Verification Section
# ==============================

ps aux | head -10
timeout 5 top -b -n 1
which htop && echo "htop is available"

sleep 300 &
ps -p $TEST_PID
kill $TEST_PID
ps -p $TEST_PID 2>/dev/null || echo "Process successfully terminated"

crontab -l | grep -c process_monitoring
ls -la ~/process_monitoring/*.log 2>/dev/null | wc -l

echo "=== Lab 7 Completion Check ==="
which ps top htop 2>/dev/null | wc -l
ls ~/process_monitoring/*.sh 2>/dev/null | wc -l
crontab -l 2>/dev/null | wc -l
ls ~/process_monitoring/*.log 2>/dev/null | wc -l
echo "Lab 7 verification complete!"
