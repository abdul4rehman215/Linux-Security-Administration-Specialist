# 🛠 Troubleshooting Guide - Lab 20: Advanced Linux Security

---

# 🔥 1️⃣ SSH Locked Out After Firewall Configuration

## ❌ Problem
After applying iptables/nftables rules, SSH access is blocked.

## 🔎 Cause
Port 22 rule missing or default policy set to DROP before allowing SSH.

## ✅ Immediate Fix

Insert SSH rule at top:

```bash
sudo iptables -I INPUT 1 -p tcp --dport 22 -j ACCEPT
```

If fully locked out (console access required):

```bash
sudo iptables -F
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
```

---

# 🔥 2️⃣ nftables Rules Not Applying

## ❌ Problem
Firewall rules not active after reboot.

## 🔎 Check Service

```bash
sudo systemctl status nftables
```

Enable permanently:

```bash
sudo systemctl enable nftables
sudo systemctl start nftables
```

Verify:

```bash
sudo nft list ruleset
```

---

# 🔥 3️⃣ iptables Rules Lost After Reboot

## ❌ Problem
iptables rules reset after restart.

## ✅ Solution

Install persistence package:

```bash
sudo apt install -y iptables-persistent
```

Save rules:

```bash
sudo iptables-save > /etc/iptables/rules.v4
```

---

# 🔥 4️⃣ SELinux Not Enforcing on Ubuntu

## ❌ Problem
`sestatus` shows disabled.

## ✅ Activate SELinux

```bash
sudo apt install -y selinux-utils selinux-basics policycoreutils
sudo selinux-activate
```

Reboot system.

Set enforcing:

```bash
sudo setenforce 1
getenforce
```

---

# 🔥 5️⃣ SELinux Blocking Application

## ❌ Problem
Application fails under SELinux enforcement.

## 🔎 Check Denials

```bash
sudo ausearch -m AVC -ts recent
```

Temporarily switch to permissive for testing:

```bash
sudo setenforce 0
```

Re-enable:

```bash
sudo setenforce 1
```

Generate minimal policy if required.

---

# 🔥 6️⃣ AppArmor Profile Blocking Application

## ❌ Problem
Custom application denied access.

## 🔎 Check Profile Status

```bash
sudo aa-status
```

Put profile into complain mode:

```bash
sudo aa-complain /usr/local/bin/testapp
```

After adjustments:

```bash
sudo aa-enforce /usr/local/bin/testapp
```

---

# 🔥 7️⃣ Port Appears Open Even After Firewall Rules

## 🔎 Verify Listening Services

```bash
ss -tuln
```

Stop unnecessary services:

```bash
sudo systemctl stop service_name
sudo systemctl disable service_name
```

---

# 🔥 8️⃣ Firewall Logs Not Appearing

## ❌ Problem
No IPTABLES-DROPPED or nftables logs.

## 🔎 Check syslog

```bash
sudo tail -f /var/log/syslog
```

Ensure logging rule exists:

iptables:
```bash
-A INPUT -j LOG --log-prefix "IPTABLES-DROPPED: "
```

nftables:
```
log prefix "nftables-dropped: "
```

---

# 🔥 9️⃣ Vulnerability Script Not Executing

## ❌ Problem
Permission denied when running script.

## ✅ Fix

```bash
chmod +x script_name.sh
```

Check shebang line:

```bash
#!/bin/bash
```

---

# 🔥 🔟 nmap Scan Shows Unexpected Open Ports

## 🔎 Investigate Running Services

```bash
systemctl list-units --type=service --state=running
```

Disable unnecessary services.

Review firewall configuration.

---

# 🔥 1️⃣1️⃣ Real-Time Monitoring Not Showing Logs

## 🔎 Ensure Logs Exist

Authentication:
```bash
sudo tail -f /var/log/auth.log
```

Firewall:
```bash
sudo tail -f /var/log/syslog
```

Restart rsyslog if needed:

```bash
sudo systemctl restart rsyslog
```

---

# 🔥 1️⃣2️⃣ Emergency Security Reset

If system becomes unstable due to security rules:

## Reset Firewall:

```bash
sudo iptables -F
sudo iptables -P INPUT ACCEPT
```

## Disable SELinux (Temporary Only):

```bash
sudo setenforce 0
```

## Disable AppArmor Profile:

```bash
sudo aa-disable /usr/local/bin/testapp
```

---

# 🧠 Best Practices Learned

- Always allow SSH before setting DROP policy.
- Test firewall rules incrementally.
- Monitor logs immediately after changes.
- Use complain mode before enforcing AppArmor.
- Never permanently disable SELinux/AppArmor in production.
- Persist firewall rules after validation.
- Document every security change.

---

# 🔐 Security Reminder

Advanced Linux security requires layered protection:

- Network filtering (iptables/nftables)
- Mandatory Access Control (SELinux/AppArmor)
- Logging and monitoring
- Vulnerability scanning
- Automated reporting

A properly hardened Linux system significantly reduces attack surface and increases resilience against intrusion attempts.

---

✅ Lab 20 Troubleshooting Completed
