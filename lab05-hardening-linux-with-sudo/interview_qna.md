# 🎯 Interview Questions & Answers  
## Lab 05 – Hardening Linux with sudo

---

## 1️⃣ What is sudo and why is it important in Linux security?

`sudo` (SuperUser DO) allows authorized users to execute commands with elevated privileges.

It is important because:

- Prevents direct root login
- Provides accountability via logging
- Enforces least privilege
- Reduces risk of accidental system damage

---

## 2️⃣ Why should you use visudo instead of editing /etc/sudoers directly?

`visudo`:

- Performs syntax validation before saving
- Prevents concurrent edits
- Protects against configuration errors
- Avoids system lockout due to syntax mistakes

Editing manually can break sudo and lock out administrative access.

---

## 3️⃣ What is the principle of Least Privilege?

Least Privilege means:

Users receive only the minimum permissions necessary to perform their job.

Benefits:
- Reduces attack surface
- Limits privilege escalation
- Prevents misuse of administrative commands

---

## 4️⃣ What is the purpose of the secure_path directive?

`secure_path` defines the allowed PATH for sudo commands.

It prevents:
- PATH manipulation attacks
- Execution of malicious binaries
- Environment variable abuse

Example:
```
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
```

---

## 5️⃣ What does use_pty do in sudo configuration?

```
Defaults use_pty
```

Forces commands to run in a pseudo-terminal.

Prevents:
- Output hijacking
- Certain privilege escalation techniques
- Improves audit logging integrity

---

## 6️⃣ What are log_input and log_output used for?

```
Defaults log_input, log_output
```

They:

- Record full sudo session input/output
- Capture command keystrokes
- Enable forensic auditing
- Store logs in `iolog_dir`

Used in high-security environments.

---

## 7️⃣ What is the purpose of timestamp_timeout?

```
Defaults timestamp_timeout=15
```

Defines how long sudo remembers authentication.

Lower value:
- Improves security
- Reduces risk of session hijacking

---

## 8️⃣ How do you implement role-based sudo access?

Using:

```
/etc/sudoers.d/
```

Create separate policy files for each role:

- web-operators
- db-operators
- dev-team
- audit-team

This ensures:
- Clear separation of duties
- Clean configuration management
- Easier auditing

---

## 9️⃣ What is negative command restriction in sudo?

Example:
```
developer ALL=(ALL) !/usr/bin/apt remove *, !/bin/rm -rf /*
```

This explicitly denies dangerous commands even if broader access exists.

Used to prevent destructive operations.

---

## 🔟 How can you validate sudo configuration safely?

```
sudo visudo -c
```

Checks syntax for:

- /etc/sudoers
- All files inside /etc/sudoers.d/

Always validate before logging out.

---

## 1️⃣1️⃣ How does sudo logging improve security?

Logging provides:

- Accountability
- Non-repudiation
- Incident response capability
- Compliance audit trails

Important log files:

- /var/log/sudo.log
- /var/log/auth.log
- /var/log/sudo-commands.log
- /var/log/sudo-io/

---

## 1️⃣2️⃣ Why is log rotation important?

Without rotation:

- Logs consume disk space
- System may crash
- Audit data becomes unmanageable

Using logrotate:
- Weekly rotation
- Compression
- Retention control

---

## 1️⃣3️⃣ What are common sudo misconfigurations?

- Granting ALL=(ALL) ALL to everyone
- Using 777 permissions
- Not logging sudo commands
- Not using secure_path
- Allowing unrestricted wildcards
- No password restrictions

These can lead to privilege escalation.

---

## 1️⃣4️⃣ How can sudo be abused by attackers?

Common abuse techniques:

- Exploiting misconfigured NOPASSWD rules
- Using wildcard expansions
- Escaping restricted commands
- Environment variable injection
- Exploiting SUID binaries

Proper hardening prevents these.

---

## 🛡 Why is sudo hardening critical in enterprise environments?

Because:

- Most privilege escalation attacks target sudo
- Cloud servers are multi-user environments
- Insider threats require monitoring
- Compliance requires audit logging
- DevOps teams require controlled privilege

Sudo is a central security control point.

---

# ✅ Summary

This lab demonstrates:

✔ Advanced sudo configuration  
✔ Role-based least privilege enforcement  
✔ Enterprise logging architecture  
✔ Automated security monitoring  
✔ Real-world security hardening practices  

Mastering sudo hardening is essential for:

- Linux Security Engineers
- SOC Analysts
- DevSecOps Engineers
- Cloud Security Professionals
- System Administrators
