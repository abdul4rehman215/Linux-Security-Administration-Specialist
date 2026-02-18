# 🧪 Lab 06 – SELinux and AppArmor Basics

---

## 📌 Lab Overview

This lab introduces Mandatory Access Control (MAC) systems in Linux using:

- SELinux (Security-Enhanced Linux) – Label-based MAC
- AppArmor – Path-based MAC

The lab demonstrates how enterprise Linux systems implement advanced access control beyond traditional file permissions.

Two environments were used:

- CentOS 7 → SELinux
- Ubuntu 24.04.1 LTS → AppArmor

---

## 🎯 Objectives

By completing this lab, you will:

- Understand Mandatory Access Control (MAC) concepts
- Manage SELinux enforcement modes
- Work with SELinux contexts and booleans
- Analyze and resolve SELinux AVC denials
- Install and manage AppArmor
- Create and enforce custom AppArmor profiles
- Analyze MAC security logs
- Compare performance impact of SELinux modes
- Generate structured security documentation

---

## 📌 Prerequisites

Before performing this lab, the following knowledge was required:

* Basic Linux command-line proficiency
* Understanding of file permissions and ownership
* Familiarity with process management and system services
* Experience using text editors (nano / vim)
* Basic understanding of web servers and network services
* Foundational knowledge of Linux security concepts

---

## 🖥 Lab Environments

### 🔹 Environment 1 – SELinux Section
- OS: CentOS 7 (Core)
- Policy Type: Targeted
- Mode: Enforcing

### 🔹 Environment 2 – AppArmor Section
- OS: Ubuntu 24.04.1 LTS
- AppArmor module enabled
- Profiles loaded and enforced

---

# 🔐 Task Overview

---

## 🛡 Task 1 – SELinux Configuration (CentOS 7)

This section covered:

- Checking SELinux status and policy information
- Switching between enforcing and permissive modes
- Understanding SELinux security contexts
- Modifying file contexts
- Managing SELinux booleans
- Triggering an AVC denial using Apache
- Analyzing audit logs
- Fixing context misconfiguration properly using semanage
- Validating successful remediation

---

## 🛡 Task 2 – AppArmor Configuration (Ubuntu)

This section included:

- Installing AppArmor utilities
- Checking profile status and enforcement modes
- Switching profiles between complain and enforce mode
- Creating a custom AppArmor profile for a test application
- Editing and reloading profiles
- Triggering controlled access violations
- Reviewing denial logs
- Updating profiles using aa-logprof

---

## 🛡 Task 3 – Testing & Analysis

This section demonstrated:

- SELinux denial troubleshooting using ausearch and sealert
- AppArmor denial log analysis using dmesg and journalctl
- Performance comparison between enforcing and permissive modes
- Creation of structured security documentation report

---

# 📊 Key Learning Outcomes

After completing this lab, you can:

✔ Diagnose SELinux AVC denials  
✔ Fix mislabeling using semanage and restorecon  
✔ Manage SELinux booleans securely  
✔ Create and tune AppArmor profiles  
✔ Analyze kernel-level denial logs  
✔ Compare label-based vs path-based MAC systems  
✔ Implement enterprise-grade Linux access control  

---

# 🛡 Enterprise Relevance

Understanding SELinux and AppArmor is critical for:

- Secure web server deployment
- Cloud and container hardening
- Compliance-driven environments
- Defense-in-depth architecture
- SOC and incident response workflows

These MAC systems significantly reduce the impact of privilege escalation and misconfiguration attacks.

---

## 📁 Repository Structure

```
lab06-selinux-and-apparmor-basics/
│
├── README.md
├── selinux-notes.md
├── apparmor-notes.md
├── troubleshooting.md
└── scripts/
```

---

## 📘 What I Learned

Through this lab, I gained practical experience in:

* Understanding the difference between Discretionary Access Control (DAC) and Mandatory Access Control (MAC)
* Managing SELinux enforcement modes safely
* Working with SELinux security contexts and booleans
* Identifying and resolving SELinux AVC denials properly (without disabling SELinux)
* Creating and enforcing custom AppArmor profiles
* Analyzing kernel-level denial logs
* Understanding how MAC systems strengthen Linux security posture
* Comparing label-based vs path-based security models

---

## 🌍 Why This Matters

Traditional Linux permissions (chmod, chown) are not sufficient in enterprise environments.

Mandatory Access Control systems:

* Prevent privilege escalation
* Restrict compromised services
* Limit lateral movement
* Enforce strict service boundaries
* Reduce blast radius during security incidents

SELinux and AppArmor add an additional security layer beyond file permissions — critical for modern infrastructure.

---

## 🏢 Real-World Applications

This lab directly applies to:

* Securing Apache/Nginx web servers
* Hardening production Linux servers
* Protecting cloud-based workloads
* Restricting containerized applications
* Meeting compliance standards (PCI-DSS, ISO 27001, SOC 2)
* Implementing least privilege at the system level

---

## 🎯 Real-World Relevance

In enterprise environments:

* Misconfigured services are common attack vectors
* Web servers are frequent breach targets
* MAC systems prevent service-level compromise from becoming full system compromise
* Security teams rely on audit logs generated by SELinux/AppArmor for incident investigation

Understanding MAC frameworks is essential for:

* SOC Analysts
* Linux System Administrators
* DevOps Engineers
* Security Engineers
* Cloud Security Specialists

---

## 🏁 Result

At the end of this lab:

✔ SELinux was configured and tested in enforcing mode
✔ AVC denial was triggered and properly resolved
✔ Custom AppArmor profile was created and enforced
✔ Application-level access restrictions were validated
✔ Denials were logged and analyzed
✔ Performance impact was evaluated
✔ Security documentation was generated

Both SELinux (label-based MAC) and AppArmor (path-based MAC) were successfully implemented and tested in realistic enterprise scenarios.

---

## ✅ Lab Status

✔ SELinux tested and enforced  
✔ AVC denial triggered and resolved  
✔ AppArmor profile created and enforced  
✔ Denials logged and analyzed  
✔ Performance impact evaluated  
✔ Security documentation generated  

---

# 🎯 Lab 06 Completed Successfully
