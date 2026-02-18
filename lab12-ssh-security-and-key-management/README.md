# 🔐 Lab 12: SSH Security and Key Management

---

## 📌 Overview

This lab focuses on securing SSH access in a Linux environment through key-based authentication, configuration hardening, and advanced SSH key management techniques.

All tasks were performed on:

- **Ubuntu 24.04.1 LTS**
- APT-based system
- Cloud-based lab environment
- Host: `toor@ip-172-31-10-233`

---

## 🎯 Objectives

By completing this lab, the following skills were developed:

- Implement SSH key-based authentication
- Disable root login for secure remote access
- Change default SSH port to reduce attack surface
- Configure hardened SSH server settings
- Use `ssh-agent` for secure key management
- Manage multiple SSH identities
- Implement SSH configuration file optimization
- Troubleshoot SSH authentication and configuration issues

---

## 🧰 Prerequisites

- Linux command-line knowledge
- Understanding of file permissions and ownership
- Familiarity with SSH and networking ports
- User account management basics
- Basic system service management

---

## 🛠 Tasks Performed

### Task 1 – SSH Key-Based Authentication
- Generated RSA 4096 SSH key pair
- Configured authorized_keys for test user
- Verified secure login using SSH keys

### Task 2 – SSH Server Hardening
- Backed up SSH configuration
- Disabled root login
- Disabled password authentication
- Changed SSH default port to 2222
- Restricted user access
- Reduced authentication attempts
- Validated configuration syntax
- Restarted and verified SSH service

### Task 3 – SSH Agent & Advanced Key Management
- Started and configured ssh-agent
- Added SSH keys securely
- Created persistent ssh-agent startup script
- Generated multiple SSH keys (RSA & ED25519)
- Configured SSH client config file
- Tested identity-based connection profiles
- Managed and removed identities

---

## 📂 Repository Structure

```
lab12-ssh-security-and-key-management/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
└── scripts/
    └── ssh-agent-startup.sh
```

---

## 🔐 Security Concepts Applied

- Public Key Infrastructure (PKI)
- Principle of Least Privilege
- Defense in Depth
- Port Obfuscation
- Authentication Hardening
- Identity Isolation
- Secure Key Storage
- Agent-Based Key Handling

---

## 📊 Results

- SSH secured using key-based authentication
- Root access successfully disabled
- Password authentication disabled
- SSH service listening on custom port (2222)
- SSH agent managing multiple keys securely
- Hardened configuration verified successfully

---

## 🌍 Real-World Relevance

SSH is often the primary administrative access point to Linux servers. Weak SSH configurations are one of the most common security vulnerabilities in production environments.

This lab demonstrates:

- Enterprise-grade SSH hardening
- Secure remote access management
- Multi-key identity management
- Secure automation practices

These techniques are essential for:

- Cloud server administration
- DevOps pipelines
- Secure infrastructure management
- Production environment hardening

---

## 🧠 What I Learned

- Proper SSH key generation and secure storage
- Importance of disabling password authentication
- Risks of root SSH access
- How ssh-agent improves usability and security
- Managing multiple SSH identities effectively
- Verifying SSH configuration safely before restart
- Importance of file permission hygiene in SSH security

---

## 🏁 Conclusion

This lab successfully implemented comprehensive SSH security hardening and advanced key management practices.

The system was secured using:

- Key-based authentication
- Port modification
- Restricted access policies
- Agent-based key handling
- Multi-identity configuration

These practices align with modern Linux security standards and real-world infrastructure hardening requirements.
