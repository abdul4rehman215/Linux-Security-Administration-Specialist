# 🛠 Troubleshooting Guide - Lab 17: System Hardening with Fail2Ban

---

# 📌 Issue 1: Fail2Ban Service Not Starting

## 🔎 Symptoms
- `systemctl status fail2ban` shows failed
- Service exits immediately after restart

## ✅ Check Service Status

```
sudo systemctl status fail2ban
```

## ✅ Test Configuration

```
sudo fail2ban-client -t
```

If error appears:
- Check syntax in `jail.local`
- Verify indentation and section headers
- Confirm filter file exists

---

# 📌 Issue 2: Jail Not Appearing in Status

## 🔎 Symptoms
```
fail2ban-client status
```
Does not list expected jail.

## ✅ Verify Configuration

Check jail.local:

```
sudo nano /etc/fail2ban/jail.local
```

Ensure:
```
enabled = true
```

Then restart:

```
sudo systemctl restart fail2ban
```

---

# 📌 Issue 3: IP Not Getting Banned

## 🔎 Possible Causes
- Incorrect log path
- Log format mismatch
- Wrong regex pattern
- Too high maxretry value

## ✅ Verify Log Path

```
sudo fail2ban-client get sshd logpath
```

Ensure file exists:

```
ls -la /var/log/auth.log
```

---

## ✅ Test Regex Pattern

Use:

```
sudo fail2ban-regex /var/log/auth.log /etc/fail2ban/filter.d/sshd.conf
```

Check match statistics.

---

# 📌 Issue 4: Firewall Rules Not Applied

## 🔎 Symptoms
IP shows banned but traffic still allowed.

## ✅ Check iptables Rules

```
sudo iptables -L -n
```

Look for chain:

```
f2b-sshd
```

If missing:
- Restart Fail2Ban
- Verify firewall backend

---

# 📌 Issue 5: Log File Permission Errors

## 🔎 Symptoms
Fail2Ban cannot read monitored logs.

## ✅ Check Permissions

```
ls -la /var/log/auth.log
```

Ensure Fail2Ban has access (usually via syslog group).

---

# 📌 Issue 6: Too Many False Positives

## 🔎 Symptoms
Legitimate users getting banned.

## ✅ Adjust Settings

Increase:

```
maxretry
findtime
```

Add whitelist:

```
ignoreip = 192.168.1.0/24
```

---

# 📌 Issue 7: Log Rotation Breaking Monitoring

## 🔎 Symptoms
Fail2Ban stops detecting attacks after log rotation.

## ✅ Force Log Rotation Test

```
sudo logrotate -f /etc/logrotate.d/rsyslog
```

Restart Fail2Ban:

```
sudo systemctl restart fail2ban
```

Ensure backend set to:

```
backend = systemd
```

---

# 📌 Issue 8: Custom Filter Not Matching

## 🔎 Causes
- Incorrect regex syntax
- Missing __prefix_line
- Log format mismatch

## ✅ Validate Regex

```
sudo fail2ban-regex /var/log/apache2/access.log /etc/fail2ban/filter.d/webapp-custom.conf
```

Check match count.

---

# 📌 Issue 9: High CPU Usage

## 🔎 Causes
- Too many jails enabled
- Large log files
- Aggressive regex patterns

## ✅ Check Resource Usage

```
ps aux | grep fail2ban
```

## ✅ Reduce Database Retention

Set in fail2ban.local:

```
dbpurgeage = 86400
dbmaxmatches = 10
```

---

# 📌 Issue 10: Email Notifications Not Working

## 🔎 Causes
- Mail service not configured
- Postfix not running
- Incorrect MTA setting

## ✅ Check Mail Service

```
sudo systemctl status postfix
```

## ✅ Test Mail Sending

```
echo "Test" | mail -s "Fail2Ban Test" admin@yourdomain.com
```

---

# 📌 Issue 11: Progressive Ban Not Working

## 🔎 Verify Settings

Check jail.local:

```
bantime.increment = true
bantime.factor = 2
```

Restart Fail2Ban.

---

# 🔐 Security Best Practices

- Always use `.local` files for configuration
- Limit whitelist ranges
- Monitor ban logs regularly
- Rotate logs properly
- Avoid excessive jail activation
- Use backend = systemd for better performance
- Audit jails periodically

---

# 🧠 Diagnostic Checklist

```
sudo systemctl status fail2ban
sudo fail2ban-client -t
sudo fail2ban-client status
sudo fail2ban-client status sshd
sudo iptables -L -n
sudo tail -f /var/log/fail2ban.log
```

---

# ✅ Conclusion

Fail2Ban is a powerful intrusion prevention system, but correct configuration and monitoring are essential.

This troubleshooting guide ensures:

- Reliable ban enforcement
- Proper log monitoring
- Firewall integration validation
- Reduced false positives
- Stable production deployment

Proper Fail2Ban maintenance significantly strengthens Linux server security posture.
