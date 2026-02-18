# 🛠️ Troubleshooting Guide - Lab 14: Syslog and Log Management

---

## Issue 1: rsyslog Not Running

### Symptoms
- No logs appearing in `/var/log/syslog`
- Remote logs not being received

### Solution

Check service status:

```bash
sudo systemctl status rsyslog
````

Start or restart service:

```bash
sudo systemctl restart rsyslog
```

Enable at boot:

```bash
sudo systemctl enable rsyslog
```

---

## Issue 2: Port 514 Not Listening

### Symptoms

* Remote logs not received
* No output from `netstat` for port 514

### Solution

Verify configuration syntax:

```bash
sudo rsyslogd -N1
```

Check listening ports:

```bash
sudo netstat -tulpn | grep :514
```

Restart service after config changes:

```bash
sudo systemctl restart rsyslog
```

Check firewall:

```bash
sudo ufw status
sudo ufw allow 514/udp
sudo ufw allow 514/tcp
```

---

## Issue 3: journalctl Shows No Entries

### Symptoms

* `journalctl` returns empty output

### Solution

Check journald service:

```bash
sudo systemctl status systemd-journald
```

Verify journal storage:

```bash
sudo ls -la /var/log/journal/
```

Check journald configuration:

```bash
sudo cat /etc/systemd/journald.conf
```

Restart service if needed:

```bash
sudo systemctl restart systemd-journald
```

---

## Issue 4: logrotate Not Rotating Logs

### Symptoms

* Old logs not compressed
* No `.gz` files created

### Solution

Debug configuration:

```bash
sudo logrotate -d /etc/logrotate.conf
```

Force rotation:

```bash
sudo logrotate -f /etc/logrotate.d/testapp
```

Check status file:

```bash
sudo cat /var/lib/logrotate/status
```

Verify file ownership:

```bash
sudo ls -la /var/log/testapp/
```

---

## Issue 5: Permission Denied on Log Files

### Symptoms

* Errors while writing logs
* Log files not updating

### Solution

Correct ownership:

```bash
sudo chown syslog:adm /var/log/testapp/*.log
```

Correct permissions:

```bash
sudo chmod 644 /var/log/testapp/*.log
```

---

## Issue 6: Remote Logs Not Being Written to Custom Directory

### Symptoms

* `/var/log/remote/` directory empty

### Solution

Verify template configuration:

```bash
sudo cat /etc/rsyslog.d/10-remote.conf
```

Test syntax:

```bash
sudo rsyslogd -N1
```

Restart rsyslog:

```bash
sudo systemctl restart rsyslog
```

Check directory permissions:

```bash
sudo ls -la /var/log/remote/
```

---

## Issue 7: Journal Disk Usage Growing Rapidly

### Symptoms

* `/var/log/journal` consuming large storage

### Solution

Check usage:

```bash
journalctl --disk-usage
```

Vacuum old logs:

```bash
sudo journalctl --vacuum-time=2d
```

Limit size permanently in `/etc/systemd/journald.conf`:

```
SystemMaxUse=200M
```

Then restart:

```bash
sudo systemctl restart systemd-journald
```

---

## Issue 8: logrotate Postrotate Script Failing

### Symptoms

* Rotation works but service not reloaded

### Solution

Verify postrotate script path:

```
/usr/lib/rsyslog/rsyslog-rotate
```

Test manually:

```bash
sudo /usr/lib/rsyslog/rsyslog-rotate
```

Check system logs for errors:

```bash
journalctl -xe
```

---

# Professional Recommendations

* Always validate rsyslog config before restart.
* Regularly monitor journal disk usage.
* Automate log retention policies.
* Secure log directories with correct permissions.
* Archive important logs for compliance.
* Monitor for suspicious log patterns.

---

## Verification Checklist

✔ rsyslog active
✔ Port 514 listening
✔ journalctl filtering operational
✔ logrotate functioning
✔ Custom rotation validated
✔ Remote logs stored properly
✔ Monitoring scripts executed successfully

---

Proper log management ensures security visibility, operational stability, and compliance readiness.
