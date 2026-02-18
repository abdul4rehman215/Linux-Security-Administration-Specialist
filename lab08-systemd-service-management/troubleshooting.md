# 🛠 Troubleshooting Guide – Lab 8: Systemd Service Management

---

## 🔎 Issue 1: Service Fails to Start

### Symptoms
`
Active: failed (Result: exit-code)
`

### Root Cause
- Incorrect ExecStart path
- Script not executable
- Missing permissions
- Syntax errors in unit file

### Diagnostic Commands

```bash
systemctl status servicename
journalctl -u servicename -n 50
ls -la /path/to/script
```

### Resolution

- Verify correct script path
- Make script executable:
```bash
chmod +x /path/to/script
```
- Run script manually:
```bash
sudo /path/to/script
```
- Reload systemd:
```bash
sudo systemctl daemon-reload
```

---

## 🔎 Issue 2: Service Starts Then Stops Immediately

### Symptoms
`
Active: inactive (dead)
`

### Root Cause
- Script exits immediately
- No infinite loop or blocking process
- Incorrect Type= setting

### Diagnostic

```bash
systemctl status servicename
journalctl -u servicename
```

### Resolution

Ensure script runs in foreground and does not exit:

```bash
while true; do
  sleep 60
done
```

---

## 🔎 Issue 3: Permission Denied Errors

### Symptoms
Journal shows permission errors.

### Root Cause
- Service running as non-root
- Script or log file owned by root
- Incorrect directory permissions

### Diagnostic

```bash
ps -o user,pid,cmd -p PID
ls -la /opt/myapp
ls -la /var/log/myservice.log
```

### Resolution

```bash
sudo chown user:group file
sudo chmod 750 file
```

---

## 🔎 Issue 4: Service Cannot Be Started (Masked)

### Symptoms
`
Unit is masked.
`

### Root Cause
Service was masked.

### Resolution

```bash
sudo systemctl unmask servicename
sudo systemctl start servicename
```

---

## 🔎 Issue 5: Changes to Unit File Not Applying

### Root Cause
Forgot to reload systemd daemon.

### Resolution

```bash
sudo systemctl daemon-reload
sudo systemctl restart servicename
```

---

## 🔎 Issue 6: Restart Loop (Service Keeps Restarting)

### Symptoms
Service repeatedly restarts.

### Root Cause
- Restart=always
- Script exits with error
- Misconfiguration

### Diagnostic

```bash
journalctl -u servicename -f
```

### Resolution

- Fix script logic
- Change restart policy:
```
Restart=on-failure
```

---

## 🔎 Issue 7: Environment Variables Not Working

### Root Cause
EnvironmentFile path incorrect or file missing.

### Diagnostic

```bash
cat /etc/default/advanced-service
systemctl status advanced-service
```

### Resolution

Ensure:

```
EnvironmentFile=/etc/default/advanced-service
```

File exists and has correct permissions.

Reload daemon afterwards.

---

## 🔎 Issue 8: Logs Not Appearing in journalctl

### Root Cause
Incorrect StandardOutput configuration.

### Resolution

Ensure unit file contains:

```
StandardOutput=journal
StandardError=journal
```

Reload and restart service.

---

## 🔎 Issue 9: journalctl Showing No Logs from Previous Boot

### Root Cause
Journal configured as volatile storage.

### Diagnostic

```bash
sudo journalctl --disk-usage
```

### Resolution

Enable persistent logging:

```bash
sudo mkdir -p /var/log/journal
sudo systemctl restart systemd-journald
```

---

## 🔎 Issue 10: Service Does Not Start on Boot

### Root Cause
Service not enabled.

### Diagnostic

```bash
systemctl is-enabled servicename
```

### Resolution

```bash
sudo systemctl enable servicename
```

---

## 🔎 Issue 11: Incorrect Dependency Order

### Symptoms
Service starts before network is ready.

### Resolution

Add:

```
After=network.target
Requires=network.target
```

Then reload daemon.

---

## 🔎 Issue 12: systemctl Commands Return "Unit Not Found"

### Root Cause
Unit file not in correct directory or daemon not reloaded.

### Resolution

- Place unit in:
```
/etc/systemd/system/
```
- Run:
```
sudo systemctl daemon-reload
```

---

# 🔐 Security Troubleshooting Considerations

When running services as non-root:

- Ensure dedicated system user exists
- Ensure script and log files are owned properly
- Avoid granting unnecessary privileges
- Avoid running custom services as root in production

---

# 🧠 Best Practices Summary

- Always use absolute paths
- Reload daemon after modifying unit files
- Monitor logs after every change
- Use Restart=on-failure instead of always (when appropriate)
- Implement least privilege execution
- Use journalctl for detailed diagnostics
- Test scripts manually before service deployment

---

# ✅ Troubleshooting Documentation Complete

This guide supports:

- Production systemd deployments
- Service recovery
- Security hardening
- DevOps troubleshooting workflows
- Cloud infrastructure reliability
