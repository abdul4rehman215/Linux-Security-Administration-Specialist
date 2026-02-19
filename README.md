# 🛡 Linux Security & Administration Specialist  
### Enterprise Linux Hardening • System Security • Automation • SOC-Ready Engineering

> A complete **20-lab hands-on Linux Security & System Administration portfolio** designed to simulate real-world enterprise Linux environments.
> 
> This repository progresses from Linux command-line foundations to **advanced security engineering**, including:

- Mandatory Access Control (SELinux / AppArmor)
- Firewall hardening (UFW, iptables, nftables)
- SSH hardening & intrusion prevention
- Security auditing with auditd
- Log management pipelines
- Network monitoring & packet inspection
- Backup & disaster recovery automation
- Enterprise-grade defense-in-depth architecture

---

<div align="center">

<!-- ================= PLATFORM & STACK ================= -->

![OS](https://img.shields.io/badge/OS-Ubuntu%2024.04-orange?style=for-the-badge&logo=ubuntu)
![Linux](https://img.shields.io/badge/Linux-Security-black?style=for-the-badge&logo=linux)
![Bash](https://img.shields.io/badge/Bash-Automation-4EAA25?style=for-the-badge&logo=gnu-bash)
![Systemd](https://img.shields.io/badge/systemd-Service%20Management-222222?style=for-the-badge&logo=linux)
![Cron](https://img.shields.io/badge/Cron-Task%20Scheduling-blue?style=for-the-badge)
![UFW](https://img.shields.io/badge/UFW-Firewall-red?style=for-the-badge)
![SELinux](https://img.shields.io/badge/SELinux-MAC%20Policy-critical?style=for-the-badge)
![AppArmor](https://img.shields.io/badge/AppArmor-Application%20Control-purple?style=for-the-badge)

<!-- ================= SECURITY FOCUS ================= -->

![Focus](https://img.shields.io/badge/Focus-Linux%20Security-red?style=for-the-badge)
![Hardening](https://img.shields.io/badge/System-Hardening-darkred?style=for-the-badge)
![Monitoring](https://img.shields.io/badge/Security-Monitoring-blue?style=for-the-badge)
![Automation](https://img.shields.io/badge/Security-Automation-success?style=for-the-badge)
![Firewall](https://img.shields.io/badge/Network-Hardening-orange?style=for-the-badge)
![Compliance](https://img.shields.io/badge/Compliance-Ready-informational?style=for-the-badge)

<!-- ================= SCOPE ================= -->

![Labs](https://img.shields.io/badge/Labs-20%20Hands--On-brightgreen?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Foundational%20→%20Advanced-blueviolet?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

</div>

---

# 📌 Executive Summary

This repository demonstrates **real, execution-driven Linux security engineering** across 20 structured labs.

Each lab includes:

- Executed commands
- Automation scripts (Bash)
- Structured outputs
- Security validation
- Troubleshooting documentation
- Interview-ready Q&A

The progression simulates real enterprise responsibilities:

> Linux Administration → Hardening → Monitoring → Auditing → Automation → Advanced Security Architecture

---

# 📂 Repository Structure

```
Linux-Security-Administration-Specialist/
│
├── lab01-linux-command-line-foundations
├── lab02-shell-scripting-basics
├── lab03-user-and-group-management
├── lab04-file-ownership-and-permissions
├── lab05-hardening-linux-with-sudo
├── lab06-selinux-and-apparmor-basics
├── lab07-process-management-and-monitoring
├── lab08-systemd-service-management
├── lab09-networking-basics-and-tools
├── lab10-firewall-configuration-ufw
├── lab11-managing-packages
├── lab12-ssh-security-and-key-management
├── lab13-network-monitoring-with-tcpdump
├── lab14-syslog-log-management
├── lab15-security-auditing-with-auditd
├── lab16-automating-tasks-with-cron
├── lab17-system-hardening-with-fail2ban
├── lab18-system-backup-and-restoration
├── lab19-configuring-selinux-for-security
├── lab20-advanced-linux-security
└── README.md
```

Each lab follows a consistent professional structure:

```
labXX-name/
├── README.md
├── commands.sh
├── scripts/
├── outputs.txt
├── interview_qna.md
└── troubleshooting.md
```

---

# 📚 Labs Index (1–20)

> Click any lab title to navigate directly to its folder.

---

## 🗂 Lab Categories Overview

# 🧱 Section 1: Linux Foundations & Core Security (Labs 1–6)

### Focus:
Linux administration fundamentals, access control, privilege hardening, and MAC basics.

| Lab | Title | Core Focus |
|-----|-------|------------|
| 01 | Linux Command Line Foundations | CLI & filesystem mastery |
| 02 | Shell Scripting Basics | Bash automation |
| 03 | User & Group Management | Identity & access management |
| 04 | File Ownership & Permissions | DAC, ACL, special bits |
| 05 | Hardening Linux with sudo | RBAC & privilege control |
| 06 | SELinux & AppArmor Basics | Mandatory Access Control |

### Skills Demonstrated
- Discretionary Access Control (DAC)
- Role-Based Access Control (sudo)
- Mandatory Access Control (SELinux/AppArmor)
- Shell automation & reporting
- Privilege escalation mitigation
- Audit trail awareness

---

# ⚙ Section 2: System Administration & Network Security (Labs 7–10)

### Focus:
Processes, services, networking diagnostics, firewall enforcement.

| Lab | Title | Core Focus |
|-----|-------|------------|
| 07 | Process Management & Monitoring | CPU & memory diagnostics |
| 08 | Systemd Service Management | Service lifecycle & security |
| 09 | Networking Basics & Tools | Connectivity troubleshooting |
| 10 | Firewall Configuration with UFW | Network hardening |

### Skills Demonstrated
- Real-time resource monitoring
- Service deployment & debugging
- Port inspection & network diagnostics
- Firewall policy enforcement
- Automated health monitoring

---

# 🔐 Section 3: Advanced Linux Security & Monitoring (Labs 11–15)

### Focus:
Package management, SSH hardening, packet analysis, centralized logging, system auditing.

| Lab | Title | Core Focus |
|-----|-------|------------|
| 11 | Managing Packages | Repository & update automation |
| 12 | SSH Security & Key Management | Secure remote access |
| 13 | Network Monitoring with Tcpdump | Packet capture & detection |
| 14 | Syslog & Log Management | Centralized logging |
| 15 | Security Auditing with Auditd | Compliance & syscall monitoring |

### Skills Demonstrated
- Secure SSH deployment
- Log pipeline engineering
- Traffic-based incident detection
- System call auditing
- Compliance-oriented monitoring
- Bash-based monitoring dashboards

---

# 🛠 Section 4: Automation, Defense & Recovery (Labs 16–18)

### Focus:
Automation pipelines, intrusion prevention, disaster recovery.

| Lab | Title | Core Focus |
|-----|-------|------------|
| 16 | Automating Tasks with Cron | Scheduled automation |
| 17 | System Hardening with Fail2Ban | Brute-force mitigation |
| 18 | System Backup & Restoration | Disaster recovery |

### Skills Demonstrated
- Production automation workflows
- Regex-based intrusion detection
- Progressive ban logic
- Backup verification & integrity validation
- Full restoration simulation
- Monitoring & alert engineering

---

# 🛡 Section 5: Enterprise Linux Security Engineering (Labs 19–20)

### Focus:
Deep SELinux policy engineering & full defense-in-depth security architecture.

| Lab | Title | Core Focus |
|-----|-------|------------|
| 19 | Configuring SELinux for Security | Custom MAC policy development |
| 20 | Advanced Linux Security | Firewall + MAC + Vulnerability Automation |

### Technologies Implemented
- SELinux (policy modules, audit2allow, semodule)
- AppArmor
- iptables (stateful filtering)
- nftables
- Vulnerability assessment scripts
- Log analysis automation

### Architecture Covered
- Mandatory Access Control
- Network segmentation
- SSH rate limiting
- SUID & world-writable file detection
- Layered security validation
- Automated security reporting

---

# 🎯 Learning Outcomes Across 20 Labs

By completing this repository, the following competencies were developed:

- Linux system administration mastery
- Secure privilege & identity management
- Production firewall configuration
- SSH hardening & intrusion prevention
- Packet capture & network investigation
- Centralized logging & log lifecycle control
- Security auditing with syscall monitoring
- Backup & disaster recovery engineering
- Custom SELinux policy development
- Defense-in-depth architecture design
- Security automation & reporting pipelines

---

# 🏢 Professional Alignment

This portfolio aligns directly with:

- Linux System Administrator
- Linux Security Engineer
- SOC Analyst (Linux-focused environments)
- DevSecOps Engineer
- Infrastructure Security Engineer
- Enterprise Linux Administrator

---

# 🧠 Real-World Simulation

All labs were executed in controlled Linux environments and simulate:

- Enterprise server administration
- SOC-style log investigation
- Compliance auditing
- Secure production deployment
- Blue Team defensive engineering

This is practical implementation — not theoretical documentation.

---

# 🚀 How To Use

```bash
git clone https://github.com/abdul4rehman215/Linux-Security-Administration-Specialist.git
cd Linux-Security-Administration-Specialis
cd labXX-name
```

Each lab contains its own `README.md` with setup, execution steps, scripts, reports, and troubleshooting guidance.

---

# ⚖ Ethical & Legal Notice

All activities were conducted:

- In isolated lab environments
- On intentionally configured systems
- For defensive and educational purposes only

No unauthorized testing was performed.

---

# 🏁 Final Note

This repository represents structured, hands-on Linux security engineering work across 20 labs — progressing from foundational administration to enterprise-grade security architecture.

> Build Secure Systems.  
> Automate Defensively.  
> Engineer with Depth.

If this repository adds value, consider ⭐ starring it.

---

## 👨‍💻 Author
**Abdul Rehman**
Linux Security • SOC Engineering • Security Automation  

### 📧 Reach Out

  <a href="https://github.com/abdul4rehman215">
    <img src="https://img.shields.io/badge/Follow-181717?style=for-the-badge&logo=github&logoColor=white" alt="Follow" />
  </a>  
  <a href="https://linkedin.com/in/abdul4rehman215">
     <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white&v=1" />
  </a>
  <a href="mailto:abdul4rehman215@gmail.com">
    <img src="https://img.shields.io/badge/Email-EE0000?style=for-the-badge&logo=gmail&logoColor=white" />
  </a>
