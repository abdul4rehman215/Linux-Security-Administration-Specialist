# 🔐 Lab 05 – Hardening Linux with sudo

---

## 🧪 Lab Overview

This lab focuses on securing Linux privilege escalation mechanisms using `sudo`.  
We implemented enterprise-grade sudo hardening techniques including:

- Secure sudoers configuration
- Role-based least privilege access
- Comprehensive sudo logging
- Log rotation policies
- Automated monitoring and alerting
- Validation and auditing procedures

Environment used: Ubuntu 24.04.1 LTS (Cloud Lab Environment)

---

# 🎯 Objectives

By completing this lab, I was able to:

- Understand sudo’s role in Linux security architecture
- Securely modify sudoers using `visudo`
- Implement role-based least privilege access
- Configure advanced logging (input/output logging)
- Centralize sudo logs via rsyslog
- Configure log rotation
- Build automated sudo monitoring script
- Validate configuration integrity

---

# 📌 Prerequisites

- Linux CLI knowledge
- User & group management
- File permissions understanding
- Knowledge of log file locations
- Familiarity with nano / vim

---

# 🖥 Lab Environment

- OS: Ubuntu 24.04.1 LTS
- Host: EC2 Cloud Instance
- User: `toor`
- Sudo Version: 1.9.15p2

---

# 📂 Repository Structure

```
lab05-hardening-linux-with-sudo/
│
├── readme.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
└── scripts/
    ├── sudo-monitor.sh
    ├── 50-sudo.conf
    ├── logrotate-sudo.conf
    └── sudoers-config-snippets.txt
```

---

# 🔐 Task Overview

## Task 1 – Secure sudoers Configuration

- Analyzed current sudo configuration
- Hardened sudo defaults
- Enabled I/O logging
- Configured timestamp restrictions
- Created sudoers backup

---

## Task 2 – Least Privilege Role-Based Access

Created user roles:

- Web Administrator
- Database Administrator
- Developer
- Auditor

Configured dedicated `/etc/sudoers.d/` policies for each role.

Validated access restrictions.

---

## Task 3 – Advanced Logging & Monitoring

- Configured `/var/log/sudo.log`
- Enabled `log_input` and `log_output`
- Configured rsyslog custom logging
- Implemented logrotate policy
- Built automated sudo-monitor script
- Configured cron-based monitoring

---

# 🛡 Security Hardening Implemented

✔ Secure PATH enforcement  
✔ Limited password attempts  
✔ Reduced timestamp timeout  
✔ Enforced PTY usage  
✔ Logged all sudo commands  
✔ Captured full I/O sessions  
✔ Automated suspicious command detection  
✔ Restricted dangerous commands  
✔ Implemented negative command rules  
✔ Created role-based access separation  

---

# 🌍 Real-World Relevance

This lab directly applies to:

- Enterprise Linux server hardening
- SOC monitoring
- Privilege escalation prevention
- Compliance requirements (ISO 27001, SOC2, PCI-DSS)
- Audit trail maintenance
- Insider threat mitigation

Misconfigured sudo is one of the most common privilege escalation vectors.

Proper sudo hardening is critical in:

- Cloud environments
- Production servers
- Multi-user systems
- DevOps pipelines

---

# 📊 Results Achieved

- Enterprise-grade sudo configuration deployed
- Granular access control implemented
- Full audit logging enabled
- Log rotation configured
- Automated monitoring operational
- Syntax validation successful

---

# 🧠 What I Learned

- Deep understanding of sudo security architecture
- Practical least privilege enforcement
- Advanced logging configuration
- Enterprise hardening methodology
- Security automation using Bash
- Defensive configuration validation

---

# 🎉 Conclusion

This lab strengthened practical Linux security engineering skills.

I implemented a hardened sudo framework that:

- Minimizes privilege escalation risk
- Enforces role separation
- Provides full audit visibility
- Detects suspicious activity automatically

This lab directly strengthens:

- Linux System Administration
- SOC Engineering
- Access Control Architecture
- Security Monitoring & Auditing
- Enterprise Security Hardening
