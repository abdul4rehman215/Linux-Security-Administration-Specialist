# 🧪 Lab 06 – SELinux and AppArmor Basics

---

## 📌 Lab Overview

This lab introduces Mandatory Access Control (MAC) mechanisms in Linux through:

> - 🔐 SELinux (Security-Enhanced Linux) – Label-based MAC
> - 🛡 AppArmor – Path-based MAC

The lab demonstrates how enterprise Linux systems enforce security policies at the kernel level to prevent unauthorized access, privilege escalation, and service abuse.
Both technologies were configured, tested, and troubleshooted in realistic scenarios across different Linux distributions.

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
│
├── commands/
│   ├── selinux-commands.sh
│   └── apparmor-commands.sh
│
├── outputs/
│   ├── selinux-output.txt
│   └── apparmor-output.txt
│
├── scripts/
│   ├── selinux-lab-execution.sh
│   ├── apparmor-lab-execution.sh
│   ├── performance-test.sh
│   ├── test-app.sh
│   └── apache-custom.conf
│
├── reports/
│   ├── security-policy-report.txt
│   └── final-security-report.txt
│
├── Interview_qna.md
│
└── troubleshooting.md

```

---

## 🔍 What This Lab Demonstrates

### ✔ SELinux

* Checking enforcement modes
* Managing contexts
* Using `chcon`, `restorecon`, and `semanage`
* Managing SELinux booleans
* Triggering AVC denials
* Analyzing audit logs
* Fixing context-based access failures

---

### ✔ AppArmor

* Installing AppArmor utilities
* Checking profile status
* Switching between complain/enforce modes
* Generating profiles with `aa-genprof`
* Editing custom profiles
* Reloading profiles
* Analyzing denial logs via `dmesg` and `journalctl`

---

### ✔ Performance Testing

A controlled benchmark was executed to compare:

* SELinux Enforcing Mode
* SELinux Permissive Mode

Result:
Minimal overhead observed (~0.03s difference).

---

## 🌍 Why This Matters

Traditional Linux permissions (`chmod`, `chown`) rely on Discretionary Access Control (DAC), where file owners determine access. In enterprise environments, this model is insufficient against modern threats.

Mandatory Access Control (MAC) frameworks like SELinux and AppArmor:

* Prevent privilege escalation — even if a service is compromised
* Restrict lateral movement across the system
* Enforce strict service-level boundaries
* Reduce blast radius during security incidents
* Apply least privilege enforcement at the kernel level
* Support regulatory compliance (PCI-DSS, ISO 27001, HIPAA)

Modern production systems rely on MAC to maintain defense-in-depth architecture.

Disabling SELinux or AppArmor weakens system security posture and increases exposure to exploitation.

This lab demonstrates how to properly manage — not disable — kernel-level security controls in production-like environments.

SELinux and AppArmor add a critical security layer beyond traditional file permissions — essential for modern Linux infrastructure.

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
* Custom application access denial
* Security policy misconfiguration
* Log-based incident investigation
* MAC systems prevent service-level compromise from becoming full system compromise
* Security teams rely on audit logs generated by SELinux/AppArmor for incident investigation

Understanding MAC frameworks is essential for:

* SOC Analysts
* Linux System Administrators
* DevOps Engineers
* Security Engineers
* Cloud Security Specialists

These skills directly apply to:

* Linux Security Engineering
* DevSecOps environments
* SOC operations
* Enterprise infrastructure hardening
* Compliance-driven environments (PCI-DSS, ISO 27001)

---

## 📘 What I Learned

Through this lab, I gained practical experience in:

* Understanding the difference between Discretionary Access Control (DAC) and Mandatory Access Control (MAC)
* Managing SELinux enforcement modes safely
* Working with SELinux security contexts and booleans
* Identifying and resolving SELinux AVC denials properly (without disabling SELinux)
* Creating and enforcing custom AppArmor profiles
* Analyzing kernel-level denial logs
* How kernel-level MAC differs from traditional permissions
* How incorrect file labeling breaks services
* Why using `semanage` is critical for persistent fixes
* How to analyze AVC denials effectively
* How AppArmor profiles restrict path-based access
* How to debug policy conflicts without disabling security
* How to validate enforcement safely in production-like environments

---

## 🏁 Result

At the end of this lab:

* ✔ SELinux AVC denial was triggered, analyzed, and permanently resolved
* ✔ Custom AppArmor profile was created and enforced
* ✔ Context-based denial triggered and resolved
* ✔ Booleans modified correctly
* ✔ Application-level access restrictions were validated
* ✔ Denials were logged and analyzed
* ✔ Performance impact was evaluated
* ✔ Security documentation was generated

Both SELinux (label-based MAC) and AppArmor (path-based MAC) were successfully implemented and tested under realistic enterprise scenarios.

---

# 🎯 Lab 06 Completed Successfully
