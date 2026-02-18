# 🛡️ Lab 17 – System Hardening with Fail2Ban

---

# 🎯 Objectives

- Install and configure Fail2Ban
- Protect SSH from brute-force attacks
- Configure Apache/Nginx jails
- Create custom filters using regex
- Implement progressive banning
- Automate monitoring and maintenance
- Verify firewall rule integration
- Perform real-world ban testing

---

## 📚 Prerequisites

- Basic knowledge of Linux command line operations
- Understanding of system logs and log file locations
- Familiarity with text editors (nano, vim, or gedit)
- Basic networking concepts (IP addresses, ports, protocols)
- Knowledge of SSH and web service fundamentals
- Understanding of regular expressions (basic level)

---

# 🖥️ Lab Environment

- OS: Ubuntu 24.04 LTS (Cloud Environment)
- User: toor
- Privileges: sudo/root access
- Services monitored:
  - SSH
  - Apache (simulated)
  - FTP (simulated)
- Firewall backend: iptables

---

# 📌 Overview of Implementation

This lab focuses on proactive Linux system hardening using Fail2Ban.

The following was implemented:

- SSH jail with custom retry limits
- Custom SSH filter using advanced regex
- Web application protection rules
- FTP service protection jails
- Progressive ban system
- Whitelisting trusted networks
- Email alert configuration
- Performance tuning and database cleanup
- Cron-based monitoring and maintenance
- Custom management and verification scripts

---

## 📂 Repository Structure

```
Lab_17_System_Hardening_With_Fail2Ban/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
├── configs/
│   ├── jail.local
│   ├── fail2ban.local
│   ├── sshd-custom.conf
│   ├── webapp-custom.conf
│
└── scripts/
    ├── fail2ban-monitor.sh
    ├── fail2ban-manage.sh
    ├── fail2ban-maintenance.sh
    └── fail2ban-verify.sh
```

---

# 🔐 Security Enhancements Implemented

- Reduced SSH maxretry to 3
- Increased bantime for SSH to 1 hour
- Progressive ban increment system
- Custom detection rules for:
  - SQL injection attempts
  - Script injection attempts
  - Unauthorized user access
- Firewall rule validation using iptables
- Log rotation compatibility verification

---

# 🧪 Testing & Verification Performed

- Simulated SSH brute-force attempts
- Verified automatic IP ban
- Confirmed iptables rule creation
- Verified jail monitoring
- Tested configuration syntax validation
- Confirmed cron-based automation

---

# 📊 Results

- Fail2Ban installed successfully
- 6 active jails configured
- SSH brute-force protection working
- Custom filters loaded correctly
- Firewall integration verified
- Monitoring scripts operational
- Log rotation compatibility confirmed

System hardened successfully against automated attacks.

---

# 🌍 Real-World Relevance

Fail2Ban is widely used in:

- Cloud infrastructure
- VPS hosting
- Production Linux servers
- DevOps pipelines
- Web hosting environments
- SOC (Security Operations Centers)

Understanding Fail2Ban configuration is essential for:

- System Administrators
- Cloud Engineers
- DevSecOps Engineers
- Security Analysts

---

# 💡 What I Learned

- Log-based intrusion detection
- Regex-based attack pattern detection
- Service-specific jail configuration
- Firewall rule automation
- Ban escalation strategies
- Secure system hardening practices
- Cron-based security automation

---

# 🏁 Conclusion

This lab provided hands-on experience in deploying and managing an intrusion prevention system using Fail2Ban.

The system is now hardened against brute-force and automated web-based attacks.

This configuration model can be deployed in real-world production Linux servers.

---

✅ Lab 17 Completed Successfully
