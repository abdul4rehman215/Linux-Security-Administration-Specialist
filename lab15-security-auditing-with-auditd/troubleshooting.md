# 🛠️ Troubleshooting Guide - Lab 15: Security Auditing with Auditd

> This document covers realistic issues encountered when configuring or managing auditd in production environments.

---

# 🔹 Issue 1: Auditd Service Won’t Start

## Symptoms

* `auditd.service` fails to start
* Service shows failed state
* No logs written to `/var/log/audit/audit.log`

## Diagnosis

Check service status:

```
sudo systemctl status auditd -l
```

Check journal logs:

```
journalctl -xe | grep audit
```

Check disk space:

```
df -h /var/log/audit/
```

## Possible Causes

* Insufficient disk space
* Corrupted rule file
* Invalid rule syntax
* Log file permission issues

## Solution

Validate rule syntax:

```
sudo augenrules --check
```

Reset rules (if not immutable):

```
sudo auditctl -D
sudo augenrules --load
```

Restart service:

```
sudo systemctl restart auditd
```

---

# 🔹 Issue 2: Immutable Mode Prevents Rule Changes

## Symptoms

```
The audit system is in immutable mode, no rule changes allowed
```

## Cause

Rule contains:

```
-e 2
```

This locks configuration until reboot.

## Solution

Reboot system:

```
sudo reboot
```

After reboot, modify rule files and reload.

---

# 🔹 Issue 3: Too Many Audit Events (Performance Impact)

## Symptoms

* High CPU usage
* System lag
* Large audit.log size
* High event rate

## Diagnosis

Check audit rate:

```
sudo auditctl -s
```

Check disk usage:

```
du -sh /var/log/audit/
```

Check memory usage:

```
ps aux | grep auditd
```

## Solutions

Reduce audit rate temporarily:

```
sudo auditctl -r 100
```

Optimize rules:

* Remove unnecessary syscall rules
* Avoid monitoring large directories
* Use specific paths instead of wildcards

Adjust `/etc/audit/auditd.conf`:

```
max_log_file = 50
num_logs = 10
max_log_file_action = rotate
```

Restart auditd:

```
sudo systemctl restart auditd
```

---

# 🔹 Issue 4: Missing Expected Audit Events

## Symptoms

* Rule exists but no logs appear
* ausearch returns no results

## Diagnosis

Check loaded rules:

```
sudo auditctl -l
```

Verify rule key exists:

```
sudo auditctl -l | grep expected_rule
```

Check audit daemon status:

```
sudo systemctl status auditd
```

Verify log file permissions:

```
ls -la /var/log/audit/
```

## Solution

Reload rules:

```
sudo augenrules --load
sudo systemctl restart auditd
```

Manually trigger test action to confirm rule functionality.

---

# 🔹 Issue 5: Audit Log File Growing Too Large

## Symptoms

* `/var/log/audit/audit.log` consuming disk
* System storage filling

## Diagnosis

```
du -sh /var/log/audit/
```

Check configuration:

```
sudo cat /etc/audit/auditd.conf
```

## Solution

Enable log rotation:

```
max_log_file = 50
num_logs = 10
max_log_file_action = rotate
```

Restart auditd:

```
sudo systemctl restart auditd
```

---

# 🔹 Issue 6: Backlog Overflow

## Symptoms

* Lost events reported
* backlog increasing

Check:

```
sudo auditctl -s
```

Look for:

```
lost > 0
```

## Solution

Increase backlog limit:

```
sudo auditctl -b 16384
```

Modify rules file to permanently set:

```
-b 16384
```

Reload rules.

---

# 🔹 Issue 7: Auditctl Command Not Working

## Symptoms

* auditctl shows permission error
* Command fails without sudo

## Solution

Always run as root:

```
sudo auditctl -l
```

Ensure auditd installed:

```
dpkg -l | grep auditd
```

---

# 🔹 Issue 8: Rule Syntax Error

## Symptoms

* augenrules fails
* auditd won’t start

## Diagnosis

```
sudo augenrules --check
```

Look for error line number.

## Solution

Edit problematic file in `/etc/audit/rules.d/`

Fix syntax and reload.

---

# 🔹 Issue 9: High Disk I/O Due to Execve Monitoring

Monitoring:

```
-a always,exit -S execve
```

Generates very high event volume.

## Optimization

* Limit by user ID
* Limit by directory
* Remove if not required
* Use key grouping to filter efficiently

---

# 🔹 Issue 10: Cannot Clear Rules

If immutable mode active:

```
auditctl -D
```

Will fail.

Only fix:

```
sudo reboot
```

---

# 🔹 Best Practices for Production

✔ Use immutable mode after validation
✔ Monitor only critical paths
✔ Use meaningful rule keys (-k)
✔ Implement log rotation
✔ Monitor disk usage regularly
✔ Use centralized logging if required
✔ Avoid excessive syscall rules
✔ Test rules before production deployment

---

# 🔐 Professional Security Recommendation

Auditd should be:

* Enabled at boot
* Protected with immutable rules
* Integrated with SIEM systems
* Configured with proper log retention
* Monitored regularly

Proper audit configuration significantly strengthens Linux system security posture.
