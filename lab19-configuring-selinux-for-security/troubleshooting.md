# 🛠 Troubleshooting Guide  
## Lab 19 – Configuring SELinux for Security

---

## 🔍 1️⃣ SELinux Denials Persist After Installing Policy

### 🔎 Problem
After generating and installing a policy module, AVC denials still appear.

### ✅ Steps to Resolve

1. Verify SELinux mode:
   ```bash
   sestatus
   ```

2. Confirm policy module is installed:
   ```bash
   semodule -l | grep module_name
   ```

3. Check for recent denials:
   ```bash
   ausearch -m AVC -ts recent
   ```

4. Ensure file contexts are correct:
   ```bash
   ls -lZ /path/to/file
   ```

5. Reapply context:
   ```bash
   restorecon -Rv /path/to/file
   ```

---

## 🔍 2️⃣ Incorrect File Labeling

### 🔎 Problem
Application fails even though policy module is installed.

### ⚠️ Cause
File or directory labeled as `default_t` instead of the required type.

### ✅ Fix

Check current context:
```bash
ls -lZ /opt/myapp
```

Define proper context:
```bash
semanage fcontext -a -t myapp_data_t "/opt/myapp/data(/.*)?"
```

Apply labeling:
```bash
restorecon -Rv /opt/myapp/
```

---

## 🔍 3️⃣ Boolean Configuration Issues

### 🔎 Problem
Service still blocked despite correct labeling.

### ✅ Check SELinux Boolean

```bash
getsebool httpd_enable_cgi
```

Enable temporarily:
```bash
setsebool httpd_enable_cgi on
```

Enable permanently:
```bash
setsebool -P httpd_enable_cgi on
```

---

## 🔍 4️⃣ Policy Compilation Errors

### 🔎 Problem
`make` fails while compiling policy module.

### ✅ Ensure Required Package Installed

```bash
yum install -y selinux-policy-devel
```

Compile again:
```bash
make -f /usr/share/selinux/devel/Makefile mypolicy.pp
```

---

## 🔍 5️⃣ Custom Application Cannot Write to Log Directory

### 🔎 Problem
Permission denied when writing to `/var/log/`.

### ⚠️ Cause
SELinux denies write access to `var_log_t`.

### ✅ Solution

Check denial:
```bash
ausearch -m AVC -ts recent
```

Generate minimal rule:
```bash
ausearch -m AVC -ts recent | audit2allow -M custom_policy
semodule -i custom_policy.pp
```

---

## 🔍 6️⃣ restorecon Not Applying Changes

### 🔎 Problem
Context does not change after running `restorecon`.

### ✅ Force restore:

```bash
restorecon -RvF /opt/myapp/
```

Verify:
```bash
ls -lZ /opt/myapp/
```

---

## 🔍 7️⃣ Port Binding Issues Under SELinux

### 🔎 Problem
Web server fails when binding to custom port.

### ✅ Verify Allowed Ports

```bash
semanage port -l | grep http
```

Add custom port:
```bash
semanage port -a -t http_port_t -p tcp 8080
```

Verify:
```bash
semanage port -l | grep 8080
```

---

## 🔍 8️⃣ Audit Log Not Recording Denials

### 🔎 Problem
`ausearch` returns no results even when denial suspected.

### ✅ Verify Audit Service

```bash
systemctl status auditd
systemctl status setroubleshoot
```

Restart if needed:
```bash
systemctl restart auditd
```

---

## 🔍 9️⃣ Emergency SELinux Troubleshooting

### ⚠️ Temporary Permissive Mode (Testing Only)

```bash
setenforce 0
```

Re-enable:
```bash
setenforce 1
```

⚠️ Disabling SELinux permanently is NOT recommended in production.

---

## 🔍 🔟 Policy Module Conflicts

### 🔎 Problem
Multiple modules affecting same domain.

### ✅ Check Installed Modules

```bash
semodule -l
```

Remove conflicting module:
```bash
semodule -r module_name
```

Reinstall required module.

---

# 🧠 Best Practices Learned

- Never disable SELinux as first troubleshooting step.
- Always analyze AVC denials carefully.
- Use minimal policy rules (principle of least privilege).
- Ensure proper labeling before generating custom rules.
- Prefer booleans over custom modules when possible.
- Test changes incrementally.

---

# 🔐 Security Reminder

SELinux is a powerful security mechanism that protects systems from:

- Privilege escalation
- Service exploitation
- Lateral movement
- Unauthorized file access

Correct troubleshooting preserves security posture while maintaining functionality.

---

✅ Troubleshooting for Lab 19 Completed
