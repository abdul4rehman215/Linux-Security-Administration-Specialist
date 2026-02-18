# 🛡️ Lab 15: Security Auditing with Auditd

---

## 📌 Overview

This lab focuses on implementing comprehensive Linux security auditing using the auditd framework.  
Auditd enables detailed tracking of system activity, file access, privileged operations, and system calls for security monitoring and compliance.

All tasks were completed on Ubuntu 24.04.1 LTS in a real cloud environment.

---

## 🎯 Objectives

By completing this lab, I was able to:

- Install and configure auditd
- Create file and directory monitoring rules
- Implement system call monitoring
- Monitor privileged operations
- Analyze audit logs using ausearch and aureport
- Generate automated audit reports
- Build audit rule management automation
- Optimize audit performance
- Troubleshoot auditd configuration issues

---

## 🧰 Prerequisites

- Basic knowledge of Linux command line operations
- Understanding of file permissions and ownership concepts
- Familiarity with system services and systemctl commands
- Basic knowledge of log file analysis
- Understanding of Linux file system structure

---

## 🖥️ Environment Used

- OS: Ubuntu 24.04.1 LTS
- User: toor (sudo privileges)
- RAM: 2GB
- Disk: 30GB
- Cloud Instance (EC2-style environment)
- Audit Framework: auditd 3.1.2

---

## 🧩 Lab Structure

### Task 1 – Configure Auditd
- Installed auditd and audispd-plugins
- Enabled and verified service
- Created file monitoring rules
- Implemented immutable rule configuration
- Expanded monitoring to system directories

### Task 2 – Log Analysis
- Generated test activities
- Searched logs using ausearch
- Generated reports using aureport
- Built custom audit analysis script

### Task 3 – Advanced Monitoring
- Web server monitoring rules
- Database monitoring rules
- System call auditing
- Privileged operation tracking
- Rule management automation script
- Performance monitoring script

---

## 🔐 What Was Monitored

- Sensitive files (`/etc/passwd`, `/etc/shadow`, `/etc/sudoers`)
- SSH configuration changes
- Cron modifications
- System binaries and libraries
- Temporary directories
- File deletion events
- Permission and ownership changes
- Process execution (execve)
- Network connections
- Sudo and privileged operations
- Kernel module loading
- Time changes

---

## 📊 Key Results

- 72 total audit rules successfully loaded
- System call monitoring validated
- Privileged operation tracking verified
- Audit reports generated successfully
- Performance monitoring operational
- Immutable mode enforced for rule protection

Audit system fully operational and validated.

---

## 🌍 Real-World Relevance

Auditd is widely used in:

- Enterprise security monitoring
- SOC (Security Operations Center)
- Compliance environments (PCI DSS, HIPAA, SOX)
- Forensic investigations
- Threat hunting operations
- Incident response workflows

Linux auditing is a critical security control in production environments.

---

## 📚 What I Learned

- How Linux auditing works at kernel level
- Difference between watch rules and syscall rules
- Importance of immutable audit configurations
- How to analyze audit logs efficiently
- How to automate audit rule management
- How to balance performance and security

---

## 🏁 Final Conclusion

This lab successfully implemented a full security auditing framework using auditd.

✔ Installed and configured auditd  
✔ Created comprehensive monitoring rules  
✔ Implemented syscall and privileged operation monitoring  
✔ Built automated analysis and management scripts  
✔ Verified rule enforcement and log capture  
✔ Optimized performance and validated system integrity  

The audit system is production-ready and aligned with enterprise security best practices.
