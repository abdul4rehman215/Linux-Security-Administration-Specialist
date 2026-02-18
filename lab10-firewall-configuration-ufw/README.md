# 🔥 Lab 10: Firewall Configuration with UFW

--- 

## 🎯 Objectives

By the end of this lab, i was able to:

- Understand firewall fundamentals and UFW architecture
- Install and enable UFW safely on remote systems
- Configure default firewall policies
- Allow and deny services based on ports
- Create IP-based firewall rules
- Implement port ranges and interface-specific rules
- Configure application profiles
- Create custom application profiles
- Enable firewall logging
- Analyze blocked and allowed traffic
- Troubleshoot firewall behavior
- Automate firewall configuration
- Implement production-ready firewall best practices

---

## 🖥 Lab Environment

- **Operating System:** Ubuntu 20.04 LTS (Cloud VM)
- **Primary Interface:** eth0
- **Firewall Tool:** UFW (Uncomplicated Firewall)
- **Backend Engine:** iptables
- **User:** toor (sudo privileges)

---

## 🧠 Key Concepts Covered

### 1️⃣ Firewall Fundamentals
- Packet filtering
- Inbound vs outbound traffic
- Default deny model
- Rule precedence and order
- Defense-in-depth principles

### 2️⃣ UFW Architecture
UFW acts as a simplified interface for:
- iptables
- Netfilter framework (Linux kernel)

It translates human-readable rules into low-level packet filtering rules.

---

### 3️⃣ Default Policy Configuration
- Default deny incoming
- Default allow outgoing
- Importance of allowing SSH before enabling firewall

---

### 4️⃣ Service-Based Rules
Allowed:
- SSH (22)
- HTTP (80)
- HTTPS (443)
- FTP (21)
- MySQL (3306)
- Custom ports (8080)

Denied:
- Telnet (23)
- SMTP (25)

---

### 5️⃣ Advanced Firewall Rules
- IP-based restrictions
- Subnet-based permissions
- Specific IP-to-port rules
- Port range rules
- Interface-specific rules
- Application profiles
- Custom application profiles

---

### 6️⃣ Logging & Monitoring
- UFW logging levels
- journalctl integration
- Syslog inspection
- Blocked vs allowed traffic analysis
- Real-time log monitoring
- Firewall monitoring automation script

---

### 7️⃣ Rule Management
- Numbered rule deletion
- Rule insertion at specific position
- Raw iptables inspection
- Resetting UFW safely

---


## 📂 Repository Structure

```
lab10-firewall-configuration-ufw/
├── README.md
├── commands.sh
├── scripts/
│   ├── firewall_setup.sh
│   └── ufw_monitor.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---


## 🔐 Security Relevance

Firewall configuration is critical for:

- Preventing unauthorized access
- Reducing attack surface
- Blocking brute-force attempts
- Mitigating scanning activity
- Enforcing least-privilege networking
- Protecting exposed cloud servers

In production environments, improperly configured firewalls are one of the most common causes of breaches.

---

## 🛠 Scripts Developed

| Script | Purpose |
|--------|----------|
| `firewall_setup.sh` | Automated secure UFW deployment |
| `ufw_monitor.sh` | Firewall monitoring and blocked IP analysis |

---

## 🌍 Real-World Applications

This lab directly applies to:

- Cloud VM security hardening
- Production server deployment
- DevOps CI/CD security
- SOC monitoring environments
- Incident containment response
- Network segmentation enforcement

---

## 🧩 What I Learned

- How UFW translates rules to iptables
- How rule ordering affects traffic
- How to prevent SSH lockout
- How to implement IP-based restrictions
- How to analyze firewall logs
- How to detect blocked intrusion attempts
- How to automate firewall policy setup
- How to safely reset and troubleshoot UFW

---

## 🏁 Result

I can now:

✔ Deploy a secure firewall configuration  
✔ Protect remote cloud servers  
✔ Create granular network access rules  
✔ Implement logging for monitoring  
✔ Investigate blocked connection attempts  
✔ Automate firewall provisioning  
✔ Apply security best practices  

---

## ✅ Lab 10 Successfully Completed

This lab establishes foundational firewall security knowledge required for:

- Linux Security & Administration
- Cloud Infrastructure Hardening
- SOC & Incident Response
- DevSecOps
- System Administration Roles
