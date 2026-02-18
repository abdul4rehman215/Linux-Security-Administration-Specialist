# 🛠 Troubleshooting Guide – Lab 7: Process Management and Monitoring

---

## 🔎 Issue 1: `ps` command not showing expected processes

### Root Cause
- Process may have already terminated
- Incorrect filtering with `grep`
- Running under different user context

### Diagnostic Commands
```bash
ps aux | grep process_name
ps -ef | grep process_name
ps -u $(whoami)
```

### Resolution
- Confirm process is running
- Avoid matching the `grep` process itself
- Use `pgrep` for cleaner filtering:
```bash
pgrep -a process_name
```

### Prevention
- Use `pgrep` instead of `ps | grep`
- Always confirm PID before managing process

---

## 🔎 Issue 2: `htop` command not found

### Root Cause
Package not installed.

### Diagnostic Command
```bash
which htop
```

### Resolution
```bash
sudo apt update
sudo apt install htop -y
```

### Prevention
Ensure required monitoring tools are installed during system setup.

---

## 🔎 Issue 3: Unable to set negative nice value

### Root Cause
Only root user can assign negative nice values.

### Diagnostic Command
```bash
ps -o pid,ni,cmd -p <PID>
```

### Resolution
Run with sudo:
```bash
sudo nice -n -5 ./script.sh
```

### Prevention
Understand Linux privilege boundaries before modifying priority.

---

## 🔎 Issue 4: `renice` fails with permission denied

### Root Cause
Attempting to change priority of process owned by another user.

### Diagnostic Command
```bash
ps aux | grep PID
```

### Resolution
Use sudo:
```bash
sudo renice 5 PID
```

### Prevention
Only modify processes you own or use elevated privileges properly.

---

## 🔎 Issue 5: `kill` does not terminate process

### Root Cause
Process ignoring SIGTERM signal.

### Diagnostic Command
```bash
ps -p PID
```

### Resolution
Force termination:
```bash
kill -9 PID
```

### Prevention
Use `kill -9` only when necessary, as it prevents cleanup operations.

---

## 🔎 Issue 6: Cron job not executing

### Root Cause
- Cron service not running
- Incorrect script path
- Script not executable
- Environment variable issue

### Diagnostic Commands
```bash
sudo systemctl status cron
crontab -l
ls -l /home/toor/process_monitoring/system_monitor.sh
```

### Resolution
- Ensure cron service is active:
```bash
sudo systemctl start cron
```
- Use absolute paths in crontab
- Make script executable:
```bash
chmod +x script.sh
```

### Prevention
Always:
- Use full file paths
- Verify execution permissions
- Test scripts manually before scheduling

---

## 🔎 Issue 7: CPU alert not triggering

### Root Cause
- CPU usage below threshold
- Incorrect parsing of CPU value from `top`
- Script not executed by cron

### Diagnostic Commands
```bash
top -bn1 | grep "Cpu(s)"
crontab -l
```

### Resolution
- Lower threshold temporarily for testing
- Verify parsing logic
- Create artificial load:
```bash
yes > /dev/null &
```

### Prevention
Test alert scripts manually before automation.

---

## 🔎 Issue 8: Log files not generating

### Root Cause
- Script not writing to correct path
- Permission issue
- Cron execution environment difference

### Diagnostic Commands
```bash
ls -la ~/process_monitoring
echo $HOME
```

### Resolution
Use absolute path:
```bash
LOG_FILE="/home/toor/process_monitoring/system_monitor.log"
```

### Prevention
Avoid relying on relative paths in cron scripts.

---

## 🔎 Issue 9: High system load but low CPU usage

### Root Cause
Processes may be waiting for I/O instead of CPU.

### Diagnostic Commands
```bash
top
iostat
```

### Resolution
Investigate disk or network bottlenecks.

### Prevention
Monitor both CPU and I/O metrics for full system visibility.

---

## 🔎 Issue 10: Zombie process detected

### Root Cause
Parent process failed to reap child process.

### Diagnostic Command
```bash
ps aux | grep Z
```

### Resolution
Restart parent process or system if necessary.

### Prevention
Ensure proper process handling in custom scripts.

---

## 🔎 Issue 11: Dashboard script shows "No alerts" even after spike

### Root Cause
Alert script may not have run yet due to cron interval.

### Diagnostic Command
```bash
tail -f ~/process_monitoring/cpu_alerts.log
```

### Resolution
Run alert script manually:
```bash
./cpu_alert.sh
```

### Prevention
Wait for scheduled cron interval or test manually.

---

## 🔎 Issue 12: Process manager script freezes

### Root Cause
User input not provided or stuck in `top`.

### Resolution
Press:
```
q
```
to exit `top`.

### Prevention
Inform users that real-time monitoring requires manual exit.

---

# 🧠 Best Practices Learned

- Always verify PID before terminating processes.
- Use least privilege when modifying priorities.
- Avoid excessive use of `kill -9`.
- Automate monitoring in production systems.
- Log monitoring output for audit trails.
- Regularly review cron jobs.
- Implement log cleanup to avoid disk exhaustion.

---

# ✅ Troubleshooting Guide Complete

This guide supports:

- Linux system administration
- Production environment monitoring
- Security operations monitoring
- Incident response investigation
- Performance diagnostics

Lab 7 troubleshooting documentation complete.
