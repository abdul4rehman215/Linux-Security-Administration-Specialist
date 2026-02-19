# 🔐 Lab 20 – Advanced Linux Security

---

# 🎯 Objective

This lab focuses on implementing a **multi-layered Linux security architecture** using modern firewall frameworks, mandatory access control systems, and automated vulnerability assessment tools.

By completing this lab, I learned how to:

- Configure and manage `iptables` and `nftables`
- Implement advanced security policies using SELinux and AppArmor
- Perform structured vulnerability assessments
- Harden network configurations
- Analyze authentication and firewall logs
- Combine multiple Linux security frameworks effectively

---

# 🧰 Prerequisites

Before performing this lab, the following knowledge was required:

- Linux command-line fundamentals
- File permissions and user management
- Basic networking (ports, protocols, services)
- Security best practices
- Root / sudo access

---

# 🖥 Lab Environment

| Component | Details |
|-----------|----------|
| OS | Ubuntu 24.04.1 LTS |
| Hostname | ip-172-31-10-247 |
| Interface | ens5 |
| Firewall Tools | iptables, nftables |
| MAC Systems | SELinux, AppArmor |
| Logging Tools | journalctl, auth.log, syslog |
| Network Tools | nmap, netcat |

---

# 🛡 Security Implementation Overview

## 1️⃣ Network Security
- Configured default DROP policies in iptables
- Implemented connection tracking
- Applied SSH rate limiting
- Blocked suspicious TCP flag combinations
- Configured nftables with logging and rate limiting
- Persisted firewall configurations

## 2️⃣ Mandatory Access Control
- Activated SELinux on Ubuntu
- Set SELinux to Enforcing mode
- Created and installed custom SELinux policy module
- Generated and enforced AppArmor profile
- Restricted unauthorized file access

## 3️⃣ Vulnerability Assessment
- Developed automated vulnerability assessment script
- Performed port scanning with nmap
- Conducted service detection
- Analyzed SUID files and world-writable files
- Generated structured security reports

## 4️⃣ Security Monitoring
- Monitored authentication failures
- Monitored firewall drop logs
- Reviewed process resource usage
- Implemented real-time log monitoring

---

## 📁 Repository Structure

```
lab20-advanced-linux-security/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
├── scripts/
│   ├── iptables-security.sh
│   ├── nftables-security.conf
│   ├── testapp
│   ├── security-context-manager.sh
│   ├── vulnerability-assessment.sh
│   ├── network-security-scan.sh
│   ├── security-log-analysis.sh
│   └── comprehensive-security-assessment.sh
│
└── policies/
    ├── myapp.te
    └── usr.local.bin.testapp (AppArmor profile)
```

---

# 📊 Result

- SSH and HTTP allowed securely
- Unnecessary ports blocked
- Firewall logging active
- SELinux enforcing successfully
- AppArmor profile protecting custom application
- Automated security assessment reports generated
- Real-time threat detection functioning

All security mechanisms tested and verified successfully.

---

# 🔐 Why This Matters

This lab demonstrates **defense-in-depth architecture**, combining:

- Network-level filtering
- Mandatory Access Control
- Application confinement
- Vulnerability scanning
- Continuous monitoring

These are core skills required for:

- Linux System Administration
- Cloud Security Engineering
- DevSecOps
- Security Operations (SOC)
- Enterprise Linux Hardening

---

# 🌍 Real-World Applications

- Securing production Linux servers
- Protecting cloud-hosted environments
- Hardening web servers
- Preventing brute-force SSH attacks
- Restricting compromised services
- Compliance-ready security configuration

---

# 🏁 Conclusion

In this Advanced Linux Security lab, I successfully:

✔ Implemented iptables and nftables firewall rules  
✔ Enforced SELinux policies  
✔ Created and enforced AppArmor profiles  
✔ Built automated vulnerability assessment tools  
✔ Conducted network scanning and log analysis  
✔ Implemented real-time security monitoring  

This lab strengthened my practical understanding of Linux security frameworks working together in a layered architecture.

---

✅ Lab 20 Completed Successfully  
Ubuntu 24.04 – Advanced Security Hardening & Monitoring
