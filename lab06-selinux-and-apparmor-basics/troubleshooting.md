# 🛠 Troubleshooting Guide - Lab 06: SELinux & AppArmor

---

# 🔐 SECTION 1 – SELinux Troubleshooting

---

## 🚨 Issue 1: Service Fails to Start (Apache / Nginx / Custom App)

### Symptoms

* `systemctl restart httpd` fails
* `curl` returns `Forbidden`
* Application throws permission denied

---

### Step 1: Check SELinux Mode

```
getenforce
```

If:

* Enforcing → continue troubleshooting
* Permissive → issue not blocking, just logging

---

### Step 2: Check Audit Logs

```
ausearch -m AVC -ts recent
```

Look for:

```
avc: denied { read } for pid=...
```

---

### Step 3: Analyze with sealert

```
sealert -a /var/log/audit/audit.log
```

Common Output:

```
SELinux is preventing httpd from reading /custom-web/index.html
```

---

### Root Cause

Incorrect file context.

Example:

```
default_t
```

Instead of:

```
httpd_sys_content_t
```

---

### Fix (Permanent)

```
semanage fcontext -a -t httpd_sys_content_t "/custom-web(/.*)?"
restorecon -R /custom-web/
```

---

### Validation

```
ls -Z /custom-web/
curl http://localhost/custom/
```

---

## 🚨 Issue 2: Context Changes Revert After Reboot

### Cause

Used `chcon` instead of `semanage`.

---

### Wrong Method (Temporary)

```
chcon -t httpd_sys_content_t file
```

Lost after relabel.

---

### Correct Method (Permanent)

```
semanage fcontext -a -t httpd_sys_content_t "/dir(/.*)?"
restorecon -R /dir
```

---

## 🚨 Issue 3: Boolean Misconfiguration

### Example Problem

Apache cannot connect to database.

---

### Check Boolean

```
getsebool httpd_can_network_connect
```

If off → denied.

---

### Fix Temporarily

```
setsebool httpd_can_network_connect on
```

### Fix Permanently

```
setsebool -P httpd_can_network_connect on
```

---

## 🚨 Issue 4: Too Many AVC Denials

### Cause

Policy not adjusted properly.

---

### Temporary Debug Mode

```
setenforce 0
```

If application works → SELinux policy issue confirmed.

---

### Important

Never leave production in permissive mode.

---

## 🚨 Issue 5: Custom Application Fails

### Diagnosis

Check process context:

```
ps -eZ | grep appname
```

Check file context:

```
ls -Z /path
```

Mismatch between process type and file type = denial.

---

---

# 🔐 SECTION 2 – AppArmor Troubleshooting

---

## 🚨 Issue 1: Application Crashes After Enabling Profile

### Cause

Profile too restrictive.

---

### Check Mode

```
aa-status
```

If Enforce → switch to complain:

```
aa-complain /path/to/app
```

---

### Review Logs

```
dmesg | grep -i apparmor
journalctl | grep -i apparmor
```

---

### Fix Using Log Profiler

```
aa-logprof
```

Allow required permissions carefully.

---

## 🚨 Issue 2: Profile Does Not Load

### Check Syntax

```
apparmor_parser -p /etc/apparmor.d/profile-name
```

---

### Reload Profile

```
apparmor_parser -r /etc/apparmor.d/profile-name
```

---

## 🚨 Issue 3: Profile Not Enforcing

### Ensure Enforce Mode

```
aa-enforce /path/to/app
```

Verify:

```
aa-status
```

---

## 🚨 Issue 4: Logs Not Appearing

### Check Audit Service

```
systemctl status auditd
```

If stopped:

```
systemctl start auditd
```

---

## 🚨 Issue 5: Path Mismatch in Profile

AppArmor is path-based.

If app moved from:

```
/usr/local/bin/app
```

to

```
/opt/app
```

Profile will not apply.

Must update profile path.

---

---

# 🔐 SECTION 3 – Performance & Operational Troubleshooting

---

## 🚨 Issue: System Performance Degradation

### Test SELinux Impact

```
time command
```

Switch modes for comparison:

```
setenforce 1
setenforce 0
```

Difference usually minimal.

---

## 🚨 Issue: Container Access Denied (SELinux)

Docker / Podman use special labels:

```
container_t
container_file_t
```

Fix by labeling volume:

```
chcon -Rt container_file_t /volume
```

---

---

# 🔐 SECTION 4 – Enterprise Security Misconfigurations

---

## ❌ Common Admin Mistakes

1. Disabling SELinux instead of fixing context
2. Using chcon permanently
3. Ignoring AVC logs
4. Leaving AppArmor in complain mode
5. Not documenting policy changes
6. Not testing before production deployment

---

---

# 🔐 SECTION 5 – Recovery Scenarios

---

## 🔥 Scenario: System Locked Out Due to SELinux Misconfiguration

### Recovery Mode Method

1. Boot into single-user mode
2. Disable enforcement temporarily
3. Fix configuration
4. Relabel system if required:

```
touch /.autorelabel
reboot
```

---

## 🔥 Scenario: Policy Corruption

Reinstall SELinux packages:

```
yum reinstall selinux-policy-targeted
```

---

---

# 🔐 SECTION 6 – Security Best Practices Checklist

---

✔ Keep SELinux in Enforcing
✔ Never disable in production
✔ Use semanage for permanent context changes
✔ Regularly review AVC logs
✔ Audit AppArmor profiles quarterly
✔ Use complain mode only for testing
✔ Document all policy modifications
✔ Maintain backups of configuration files

---

---

# 🏁 Final Troubleshooting Strategy

When facing MAC issues:

1. Identify denial
2. Confirm enforcement mode
3. Check logs
4. Analyze context mismatch
5. Apply correct permanent fix
6. Validate
7. Document

Never disable security framework as first solution.

---

# ✅ Professional Outcome

After completing this lab and troubleshooting exercises, I am capable of:

* Diagnosing SELinux AVC denials
* Fixing context-related failures
* Managing booleans properly
* Creating and debugging AppArmor profiles
* Handling production-level Linux MAC environments
* Maintaining compliance-grade security systems

---
