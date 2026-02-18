# 🎤 Interview Q&A - Lab 17: System Hardening with Fail2Ban

---

## 1️⃣ What is Fail2Ban?

Fail2Ban is an intrusion prevention tool that monitors log files for suspicious activity (such as repeated failed login attempts) and automatically bans offending IP addresses using firewall rules.

---

## 2️⃣ How does Fail2Ban work internally?

Fail2Ban:
1. Monitors log files.
2. Matches suspicious patterns using regular expressions (filters).
3. Triggers a jail.
4. Applies firewall rules (e.g., iptables) to block the offending IP.

---

## 3️⃣ What is a Jail in Fail2Ban?

A jail is a combination of:
- A filter (regex pattern)
- A log file to monitor
- An action (e.g., ban via iptables)
- Ban configuration (maxretry, findtime, bantime)

Each service (sshd, apache, ftp) has its own jail.

---

## 4️⃣ Explain bantime, findtime, and maxretry.

- **maxretry** → Number of failed attempts before banning.
- **findtime** → Time window to count failures.
- **bantime** → Duration for which IP remains banned.

Example:
```
maxretry = 3
findtime = 600
bantime = 3600
```
Means:
3 failures within 10 minutes → 1 hour ban.

---

## 5️⃣ What is Progressive Banning?

Progressive banning increases ban duration for repeat offenders.

Configured using:
```
bantime.increment = true
bantime.factor = 2
bantime.maxtime = 604800
```

This discourages repeated brute-force attacks.

---

## 6️⃣ Why should jail.conf not be modified directly?

Because updates may overwrite it.

Best practice:
- Copy to jail.local
- Modify jail.local

Fail2Ban prioritizes `.local` files.

---

## 7️⃣ How do you check active jails?

```
sudo fail2ban-client status
```

To check specific jail:
```
sudo fail2ban-client status sshd
```

---

## 8️⃣ How can you manually ban or unban an IP?

Ban:
```
fail2ban-client set sshd banip 192.168.1.10
```

Unban:
```
fail2ban-client set sshd unbanip 192.168.1.10
```

---

## 9️⃣ How does Fail2Ban integrate with firewall?

Fail2Ban dynamically inserts firewall rules (iptables/nftables).

Example:
```
sudo iptables -L -n
```

Creates chain:
```
f2b-sshd
```

---

## 🔟 What logs does SSH jail monitor in Ubuntu?

```
/var/log/auth.log
```

Fail2Ban scans authentication failures in this log.

---

## 1️⃣1️⃣ What is the role of filters in Fail2Ban?

Filters define regex patterns that match malicious behavior.

Located in:
```
/etc/fail2ban/filter.d/
```

Custom filters can detect:
- SQL injection
- Script injection
- Unauthorized access attempts

---

## 1️⃣2️⃣ How do you test Fail2Ban configuration?

```
sudo fail2ban-client -t
```

Returns:
```
Configuration file is valid
```

---

## 1️⃣3️⃣ What are common Fail2Ban issues?

- Incorrect log path
- Permission issues on log files
- Firewall conflicts
- Wrong regex pattern
- Service not running

---

## 1️⃣4️⃣ How can Fail2Ban improve server security?

Fail2Ban:
- Prevents brute-force attacks
- Blocks automated bots
- Reduces SSH attack surface
- Protects web applications
- Mitigates credential stuffing attempts

---

## 1️⃣5️⃣ Where is Fail2Ban database stored?

Fail2Ban uses a SQLite database (depending on backend) to track:

- Previous bans
- Retry attempts
- Offender history

Database cleanup can be managed using:
```
dbpurgeage
```

---

# ✅ Summary

This lab demonstrates:

- Intrusion detection using log analysis
- Regex-based attack detection
- Automated firewall rule enforcement
- Progressive ban strategies
- Real-world system hardening techniques

These concepts are commonly evaluated in Linux Security, DevOps, and Cloud Security interviews.
