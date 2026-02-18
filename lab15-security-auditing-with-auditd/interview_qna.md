# 🎤 Interview Q&A - Lab 15: Security Auditing with Auditd

## 🔹 1️⃣ What is auditd in Linux?

**Answer:**

`auditd` (Linux Audit Daemon) is a user-space service that collects and records security-relevant system events from the Linux kernel.

It:

* Tracks file access and modifications
* Monitors system calls
* Logs user activities
* Records privileged operations
* Provides forensic evidence during security incidents

It is a kernel-level auditing framework used for compliance, monitoring, and incident response.

---

## 🔹 2️⃣ How does auditd differ from syslog?

**Answer:**

| auditd                           | syslog                                |
| -------------------------------- | ------------------------------------- |
| Kernel-level auditing            | Application/system logging            |
| Tracks system calls              | Logs application messages             |
| Focused on security & compliance | Focused on system events              |
| Highly structured logs           | General-purpose logs                  |
| Used for forensics               | Used for monitoring & troubleshooting |

Auditd captures **who did what and when at the syscall level**, while syslog records general system messages.

---

## 🔹 3️⃣ What is the difference between watch rules (-w) and syscall rules (-a)?

**Answer:**

### Watch Rules (-w)

* Monitor specific files or directories.
* Example:

  ```
  -w /etc/passwd -p wa -k passwd_changes
  ```
* Triggers when file is written or accessed.

### Syscall Rules (-a always,exit)

* Monitor specific system calls.
* Example:

  ```
  -a always,exit -S unlink -k file_deletion
  ```
* Triggers whenever that system call executes.

**Watch rules monitor paths. Syscall rules monitor kernel-level actions.**

---

## 🔹 4️⃣ What does immutable mode (-e 2) do?

**Answer:**

The rule:

```
-e 2
```

Puts the audit configuration in **immutable mode**.

This means:

* No rule changes allowed
* auditctl -D will fail
* Prevents attackers from disabling logging
* Requires system reboot to modify rules

It ensures strong protection of audit policies.

---

## 🔹 5️⃣ How do you check if auditd is running properly?

**Answer:**

```
sudo systemctl status auditd
sudo auditctl -s
```

Key indicators:

* enabled 1 → auditing active
* failure 1 → failure mode active
* lost 0 → no lost events
* backlog 0 → no queue overflow

---

## 🔹 6️⃣ How do you search audit logs for specific events?

**Answer:**

Using `ausearch`:

```
sudo ausearch -k passwd_changes
sudo ausearch -k file_deletion -ts recent
sudo ausearch -ts today
```

The `-k` option searches by rule key.

---

## 🔹 7️⃣ How do you generate audit reports?

**Answer:**

Using `aureport`:

```
sudo aureport
sudo aureport -u
sudo aureport -f
```

Types of reports:

* Summary report
* User activity report
* File access report
* Failed login report
* Event distribution

---

## 🔹 8️⃣ How can auditd help in compliance?

**Answer:**

Auditd helps meet compliance standards like:

* PCI DSS
* HIPAA
* SOX
* ISO 27001

Because it:

* Tracks access to sensitive files
* Records authentication events
* Monitors configuration changes
* Provides forensic logs
* Ensures accountability

---

## 🔹 9️⃣ What are common performance considerations with auditd?

**Answer:**

* Too many syscall rules can degrade performance
* Monitoring large directories increases overhead
* High-frequency syscalls like execve generate many logs
* Log rotation must be configured properly
* backlog_limit must be sufficient

Optimization strategies:

* Use specific paths
* Avoid wildcard rules
* Limit unnecessary system call monitoring
* Configure log rotation in auditd.conf

---

## 🔹 🔟 How do you monitor file deletion events?

**Answer:**

Use syscall rule:

```
-a always,exit -F arch=b64 -S unlink -S unlinkat -k file_deletion
```

Then verify:

```
sudo ausearch -k file_deletion
```

This captures deletion attempts at kernel level.

---

## 🔹 1️⃣1️⃣ How can you monitor sudo usage?

**Answer:**

Using watch rule:

```
-w /usr/bin/sudo -p x -k sudo_usage
```

Then verify:

```
sudo ausearch -k sudo_usage
```

This tracks execution of the sudo binary.

---

## 🔹 1️⃣2️⃣ What is backlog_limit in auditd?

**Answer:**

Backlog limit defines the number of events the kernel can queue before writing to disk.

Example:

```
backlog_limit 8192
```

If the queue overflows:

* Events may be lost
* System may enter failure mode

---

## 🔹 1️⃣3️⃣ How do you clear audit rules?

**Answer:**

```
sudo auditctl -D
```

But if immutable mode (-e 2) is active:

You must reboot to modify rules.

---

## 🔹 1️⃣4️⃣ How do you check how many audit rules are active?

```
sudo auditctl -l | wc -l
```

In this lab:

```
Total audit rules loaded: 72
```

---

## 🔹 1️⃣5️⃣ What are real-world use cases of auditd?

* Detect unauthorized file access
* Detect privilege escalation
* Detect unauthorized configuration changes
* Monitor sensitive directories
* Forensic investigations
* Threat hunting
* Insider threat detection
* Regulatory compliance reporting

---

## 🔹 Final Interview Summary

In this lab, I demonstrated:

* Deep understanding of Linux auditing
* Practical rule configuration
* System call monitoring
* Log analysis expertise
* Compliance-level configuration
* Performance awareness
* Automation scripting

This is production-grade auditing knowledge.
