# 🛠 Troubleshooting Guide - Lab 16: Automating Tasks with Cron

---

# 📌 Issue 1: Cron Jobs Not Executing

## 🔎 Symptoms
- Script runs manually but not via cron
- No new entries in log file
- No CRON entries in system logs

---

## ✅ Step 1: Verify Cron Service

Check if cron is running:

```
sudo systemctl status cron
```

If not running:

```
sudo systemctl start cron
sudo systemctl enable cron
```

---

## ✅ Step 2: Check System Logs

On Ubuntu:

```
sudo grep CRON /var/log/syslog | tail -10
```

Look for:

- Permission denied errors
- Command not found
- Script execution failures

---

## ✅ Step 3: Validate Crontab Syntax

```
crontab -l
```

Common mistakes:
- Extra spaces
- Missing fields
- Incorrect time format
- Invalid characters

---

# 📌 Issue 2: Script Works Manually But Not Through Cron

## 🔎 Root Cause
Cron runs with a minimal environment (limited PATH).

---

## ✅ Fix: Use Absolute Paths

Instead of:

```
df -h
```

Use:

```
/bin/df -h
```

Or define PATH at the top of the script:

```
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

---

## ✅ Add Debug Logging

Create debug script:

```
#!/bin/bash
DEBUG_LOG="$HOME/cron_logs/debug.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "$DATE: Debug started" >> $DEBUG_LOG
echo "PATH: $PATH" >> $DEBUG_LOG
echo "USER: $USER" >> $DEBUG_LOG
echo "PWD: $PWD" >> $DEBUG_LOG
```

Schedule temporarily for diagnostics.

---

# 📌 Issue 3: Permission Denied Errors

## 🔎 Symptoms
- Script does not execute
- Logs show permission denied

---

## ✅ Fix Permissions

```
chmod +x ~/cron_scripts/*.sh
chmod 755 ~/cron_scripts/
chmod 755 ~/cron_logs/
```

Verify ownership:

```
ls -la ~/cron_scripts/
ls -la ~/cron_logs/
```

---

# 📌 Issue 4: Cron Job Produces No Output

## 🔎 Cause
Cron discards stdout and stderr unless redirected.

---

## ✅ Solution

Modify crontab entry:

```
*/5 * * * * /path/to/script.sh >> /path/to/logfile.log 2>&1
```

---

# 📌 Issue 5: Environment Variables Not Available

## 🔎 Symptoms
- Variables like $HOME behave unexpectedly
- Script fails due to missing variables

---

## ✅ Solution

Explicitly define required variables inside script:

```
HOME=/home/toor
USER=toor
```

Or use absolute paths.

---

# 📌 Issue 6: Cron Service Stopped Unexpectedly

## 🔎 Check Service

```
systemctl is-active cron
```

If inactive:

```
sudo systemctl restart cron
```

Check for crash logs:

```
journalctl -u cron --since "1 hour ago"
```

---

# 📌 Issue 7: Backup Script Fails

## 🔎 Possible Causes
- Insufficient disk space
- Invalid directory
- tar command failure

---

## ✅ Check Disk Usage

```
df -h
```

## ✅ Validate Backup Directory

```
ls -ld ~/backups
```

---

# 📌 Issue 8: Dashboard Not Updating

## 🔎 Check Script Execution

Run manually:

```
~/cron_scripts/cron_dashboard.sh
```

Verify file:

```
ls -lh ~/cron_logs/dashboard.html
```

Ensure crontab entry exists:

```
crontab -l | grep dashboard
```

---

# 📌 Issue 9: Too Many Cron Jobs Causing High Load

## 🔎 Symptoms
- High CPU usage
- System slowdown

---

## ✅ Review Scheduled Frequency

```
crontab -l
```

Avoid:
- Heavy jobs every minute
- Overlapping execution times

---

# 📌 Issue 10: Log Files Growing Too Large

## 🔎 Check File Sizes

```
ls -lh ~/cron_logs/
```

---

## ✅ Implement Rotation

Use:

```
find ~/cron_logs -name "*.log" -size +10M
```

Or configure `logrotate` for production systems.

---

# 🔐 Security Considerations

When using cron in production:

- Restrict script permissions
- Avoid storing plaintext credentials
- Use dedicated service accounts
- Monitor for unauthorized cron entries
- Regularly audit crontab configurations

Check allowed cron users:

```
cat /etc/cron.allow
cat /etc/cron.deny
```

---

# 🧠 Best Practices Summary

✔ Always test scripts manually first  
✔ Use absolute paths  
✔ Log everything  
✔ Monitor cron service health  
✔ Implement retention policies  
✔ Review crontab periodically  
✔ Limit job frequency  
✔ Use verification scripts  

---

# ✅ Conclusion

This troubleshooting guide ensures reliable and secure cron automation.  
Understanding how to diagnose scheduling failures is critical in:

- System administration
- DevOps environments
- Security operations
- Cloud infrastructure management

Proper cron troubleshooting ensures automation reliability and system stability.
