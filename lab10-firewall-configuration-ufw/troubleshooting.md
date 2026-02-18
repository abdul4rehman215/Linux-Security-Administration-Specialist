# 🛠 Troubleshooting Guide – Lab 10: UFW Troubleshooting Guide

---

# 🔍 Common Firewall Issues & Solutions

This document provides structured troubleshooting procedures for resolving common UFW-related problems in production and lab environments.

---

## 1️⃣ Locked Out of SSH After Enabling UFW

### ❗ Symptoms
- SSH connection immediately drops
- Unable to reconnect remotely
- `Connection refused` or timeout errors

### 🎯 Root Cause
SSH was not allowed before enabling UFW and default policy is set to deny incoming traffic.

### ✅ Solution

If console access is available:

```bash
sudo ufw disable
sudo ufw allow ssh
sudo ufw enable
````

If physical/VM console is unavailable:

* Access through cloud provider console (AWS EC2, Azure, etc.)
* Disable firewall from emergency shell

### 🛡 Prevention

Always execute:

```bash
sudo ufw allow ssh
```

before:

```bash
sudo ufw enable
```

---

## 2️⃣ Firewall Rules Not Working as Expected

### ❗ Symptoms

* Service still accessible despite deny rule
* Service blocked despite allow rule

### 🎯 Root Cause

Rule ordering issue.

UFW processes rules **top to bottom**.

### ✅ Solution

Check rule order:

```bash
sudo ufw status numbered
```

Reorder if necessary:

```bash
sudo ufw delete <rule_number>
sudo ufw insert 1 allow from 192.168.1.50
```

---

## 3️⃣ Service Accessible Despite Firewall

### ❗ Symptoms

* Firewall active
* Service reachable externally

### 🎯 Root Causes

* Service bound to loopback only
* Firewall rule accidentally allowing wide access
* Cloud security group allowing traffic

### ✅ Diagnostic Steps

Check listening ports:

```bash
ss -tlnp
```

Check cloud firewall (AWS Security Group, etc.)

Check rule:

```bash
sudo ufw status verbose
```

---

## 4️⃣ Logs Not Showing Expected Entries

### ❗ Symptoms

* No BLOCK entries in syslog
* No logging activity

### 🎯 Root Cause

Logging disabled or level too low.

### ✅ Solution

Enable logging:

```bash
sudo ufw logging high
```

Check logs:

```bash
sudo journalctl -u ufw
```

or

```bash
sudo grep UFW /var/log/syslog
```

---

## 5️⃣ Cannot Delete a Rule

### ❗ Symptoms

* Deletion fails
* Rule still appears

### ✅ Solution

Delete by number:

```bash
sudo ufw status numbered
sudo ufw delete <rule_number>
```

Or delete by exact specification:

```bash
sudo ufw delete allow 8080
```

---

## 6️⃣ Application Profile Not Found

### ❗ Symptoms

Error: Profile not found

### ✅ Solution

Update application database:

```bash
sudo ufw app update --add-new
```

Verify profile exists:

```bash
sudo ufw app list
```

Profiles are stored in:

```
/etc/ufw/applications.d/
```

---

## 7️⃣ Firewall Conflicts with Docker

### ❗ Symptoms

Docker containers bypass UFW rules.

### 🎯 Root Cause

Docker manipulates iptables directly.

### ✅ Solution

Adjust Docker configuration:

* Configure Docker to not override iptables
* Use `ufw route allow`
* Integrate with Docker’s iptables chains

---

## 8️⃣ Database Port Exposed to Public Internet

### ❗ Risk

Port 3306 open to Anywhere

### ✅ Secure Configuration

Instead of:

```bash
sudo ufw allow 3306
```

Use:

```bash
sudo ufw allow from 10.0.0.0/24 to any port 3306
```

Restrict database access to internal network only.

---

## 9️⃣ After Reset, Firewall Not Active

### ❗ Symptoms

Firewall disabled after reset.

### ✅ Solution

Reconfigure and re-enable:

```bash
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw enable
```

---

# 🔎 Advanced Diagnostic Commands

### Show underlying iptables rules

```bash
sudo ufw show raw
```

### Show listening services

```bash
sudo ufw show listening
```

### Show added rules only

```bash
sudo ufw show added
```

### Check configuration file

```bash
sudo cat /etc/ufw/ufw.conf
```

---

# 🔐 Production Hardening Recommendations

* Use default deny policy
* Restrict by IP when possible
* Avoid exposing database ports
* Enable logging at medium or high
* Audit firewall rules monthly
* Monitor logs for brute-force attempts
* Combine firewall with fail2ban or IDS
* Keep firewall rules documented

---

# 🧠 Incident Response Tip

If suspicious IP repeatedly appears in logs:

Block immediately:

```bash
sudo ufw deny from <suspicious_ip>
```

Then investigate:

```bash
sudo grep "<ip_address>" /var/log/syslog
```

---

# ✅ Final Validation Checklist

✔ SSH allowed
✔ Default deny incoming
✔ Only required services open
✔ Logging enabled
✔ No unnecessary public ports
✔ Firewall enabled at boot

---

# 🎯 Lab 10 Troubleshooting Mastery Achieved

You are now capable of:

* Diagnosing firewall misconfigurations
* Resolving rule conflicts
* Investigating blocked traffic
* Securing exposed services
* Managing production firewall incidents

These are real-world Linux security administration skills.
