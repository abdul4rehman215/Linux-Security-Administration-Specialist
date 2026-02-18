# 🛠 Troubleshooting Guide - Lab 05: Hardening Linux with sudo

---

# 🔴 Issue 1: Syntax Error in sudoers File

## ❌ Problem
After editing sudoers, running sudo returns:
`
sudo: parse error in /etc/sudoers near line XX
`

## 🔎 Cause
Incorrect syntax in sudoers configuration.

Common mistakes:
- Missing commas
- Incorrect wildcard usage
- Missing backslashes for line continuation
- Invalid command paths

## ✅ Solution

Always edit using:
```
sudo visudo
```

Validate configuration:
```
sudo visudo -c
```

If locked out:
- Boot into recovery mode
- Use:
```
pkexec visudo
```

---

# 🔴 Issue 2: User Cannot Run Allowed Command

## ❌ Problem
User receives:
`
Sorry, user is not allowed to execute ...
`

## 🔎 Possible Causes

- Incorrect command path
- Missing group membership
- secure_path restriction
- Typo in sudoers.d file

## ✅ Solution

Verify command path:
```
which systemctl
```

Check group membership:
```
id username
```

Re-login user or use:
```
newgrp groupname
```

Validate sudo configuration:
```
sudo visudo -c
```

---

# 🔴 Issue 3: Logging Not Working

## ❌ Problem
Sudo commands are not appearing in logs.

## 🔎 Causes

- rsyslog not running
- Wrong log file permissions
- Incorrect sudoers logging configuration

## ✅ Solution

Check rsyslog:
```
sudo systemctl status rsyslog
```

Restart if needed:
```
sudo systemctl restart rsyslog
```

Verify permissions:
```
ls -ld /var/log/sudo-io
```

Correct permissions:
```
sudo chmod 750 /var/log/sudo-io
sudo chown root:adm /var/log/sudo-io
```

---

# 🔴 Issue 4: Too Many Password Prompts

## ❌ Problem
User prompted for password repeatedly.

## 🔎 Cause
timestamp_timeout too low.

## ✅ Solution

Edit sudoers:
```
sudo visudo
```

Adjust:
```
Defaults timestamp_timeout=30
```

---

# 🔴 Issue 5: secure_path Breaking Commands

## ❌ Problem
User gets:
`
command not found
`

## 🔎 Cause
secure_path excludes required binary directory.

## ✅ Solution

Edit sudoers:
```
Defaults secure_path="..."
```

Add missing path carefully.

---

# 🔴 Issue 6: Wildcard Misconfiguration

## ❌ Problem
Users bypass restrictions using wildcards.

Example:
`
/usr/bin/apt *
`

May allow unintended subcommands.

## ✅ Solution

Use specific command restrictions.

Avoid broad wildcards.

Use negative rules:
```
!/usr/bin/apt remove *
```

---

# 🔴 Issue 7: Monitoring Script Not Triggering Alerts

## ❌ Problem
sudo-monitor.sh runs but no alerts generated.

## 🔎 Causes

- LOG_FILE path incorrect
- No matching dangerous commands
- Cron not running

## ✅ Solution

Test script manually:
```
sudo /usr/local/bin/sudo-monitor.sh
```

Verify cron:
```
sudo crontab -l
```

Check logs:
```
sudo tail -20 /var/log/auth.log
```

---

# 🔴 Issue 8: Logrotate Not Rotating Logs

## ❌ Problem
Logs growing indefinitely.

## 🔎 Cause
Misconfigured logrotate policy.

## ✅ Solution

Test configuration:
```
sudo logrotate -d /etc/logrotate.d/sudo
```

Force rotation:
```
sudo logrotate -f /etc/logrotate.d/sudo
```

---

# 🔴 Issue 9: User Locked Out of sudo

## ❌ Problem
User cannot use sudo at all.

## 🔎 Cause
Removed from sudo group or configuration broken.

## ✅ Solution

Check group:
```
groups username
```

Re-add:
```
sudo usermod -aG sudo username
```

Validate config:
```
sudo visudo -c
```

---

# 🔴 Issue 10: Too Broad Access Granted

## ❌ Problem
User accidentally given:
`
(ALL : ALL) ALL
`

## 🔎 Risk

- Full privilege escalation
- No separation of duties
- Security violation

## ✅ Solution

Remove broad rule.

Create role-based sudoers file in:
```
/etc/sudoers.d/
```

Apply least privilege.

---

# 🔎 Security Audit Checklist

Before completing configuration:

- [ ] sudoers syntax validated
- [ ] No unnecessary ALL privileges
- [ ] Logging enabled
- [ ] logrotate configured
- [ ] Monitoring script active
- [ ] Cron job scheduled
- [ ] secure_path enforced
- [ ] Negative command restrictions verified

---

# 🛡 Enterprise Best Practices

✔ Always use visudo  
✔ Use /etc/sudoers.d/ for modular policies  
✔ Avoid broad wildcards  
✔ Enforce least privilege  
✔ Enable I/O logging  
✔ Rotate logs regularly  
✔ Monitor for suspicious commands  
✔ Review sudo access quarterly  

---

# 🎯 Final Note

Misconfigured sudo is one of the most common privilege escalation vectors in Linux environments.

Proper hardening ensures:

- Controlled privilege escalation
- Complete audit visibility
- Reduced insider threat risk
- Compliance readiness
- Secure cloud deployments

---

## ✅ Lab 05 Troubleshooting Complete
