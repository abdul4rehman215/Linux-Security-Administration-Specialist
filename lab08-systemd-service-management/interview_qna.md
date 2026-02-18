# 🎤 Interview Q&A – Lab 8: Systemd for Service Management

---

## 1️⃣ What is systemd?

systemd is the modern init system and service manager used in most Linux distributions.  
It is responsible for:

- Boot process initialization
- Managing system services
- Handling dependencies
- Logging via journald
- Managing system states and targets

---

## 2️⃣ What is a unit file in systemd?

A unit file is a configuration file that defines how systemd manages a resource.

Common unit types:

- service → Background services
- socket → Socket activation
- target → Group of units (similar to runlevels)
- mount → Filesystem mounts
- timer → Scheduled tasks

---

## 3️⃣ Where are systemd unit files stored?

Common locations:

- `/lib/systemd/system/` → Default system services
- `/etc/systemd/system/` → Custom or overridden services
- `/run/systemd/system/` → Runtime units

Custom services should be placed in:

```
/etc/systemd/system/
```

---

## 4️⃣ What is the difference between enable and start?

- `systemctl start service` → Starts service immediately
- `systemctl enable service` → Configures service to start at boot

To do both:

```
systemctl enable --now service
```

---

## 5️⃣ What does masking a service mean?

Masking creates a symlink to `/dev/null`, preventing the service from starting — even manually.

It is stronger than disabling.

Used when you want to completely block a service.

---

## 6️⃣ What is the difference between Restart=always and Restart=on-failure?

- Restart=always → Restart regardless of exit status
- Restart=on-failure → Restart only if process exits with non-zero code

Use `on-failure` in production to avoid restart loops.

---

## 7️⃣ What is the purpose of ExecReload?

ExecReload defines the command used when running:

```
systemctl reload service
```

It allows configuration reload without full restart.

---

## 8️⃣ What does Type=simple mean?

Type=simple indicates:

- The service runs in the foreground
- systemd considers it started immediately after execution

Other types include:

- fork
- oneshot
- notify
- dbus

---

## 9️⃣ How does systemd handle dependencies?

Dependencies are defined using:

- After=
- Requires=
- Wants=
- Before=

Example:

```
After=network.target
```

Ensures service starts only after networking is ready.

---

## 🔟 What is journalctl used for?

journalctl is used to:

- View system logs
- Filter logs by service
- Filter logs by priority
- Monitor logs in real time
- Export logs for analysis

It reads logs from systemd-journald.

---

## 1️⃣1️⃣ How do you check logs for a specific service?

```
journalctl -u servicename
```

To follow live logs:

```
journalctl -u servicename -f
```

---

## 1️⃣2️⃣ How can you improve service security?

Best practices:

- Run service as non-root user
- Use dedicated system account
- Restrict file permissions
- Limit capabilities
- Use sandboxing options (ProtectSystem, PrivateTmp, etc.)

---

## 1️⃣3️⃣ What happens if a service exits with code 1?

If Restart=on-failure is set:

- systemd will attempt restart

If no restart policy:

- Service status becomes "failed"

Check failure reason using:

```
journalctl -u servicename
```

---

## 1️⃣4️⃣ How do you reload systemd after editing a unit file?

```
sudo systemctl daemon-reload
```

This reloads unit file definitions without restarting services.

---

## 1️⃣5️⃣ How would you troubleshoot a failed systemd service?

Steps:

1. Check service status
   ```
   systemctl status servicename
   ```

2. View logs
   ```
   journalctl -u servicename -n 50
   ```

3. Test script manually

4. Verify:
   - File permissions
   - Correct ExecStart path
   - User exists
   - Environment variables

---

# 🧠 Real-World Application

Systemd knowledge is critical for:

- Managing production services
- DevOps deployment pipelines
- Container orchestration support
- Application auto-recovery
- Cloud infrastructure reliability

---

# ✅ Interview Preparation Complete

This lab builds competency in:

- Linux system administration
- Service lifecycle control
- Log analysis
- Production troubleshooting
- Secure service deployment
