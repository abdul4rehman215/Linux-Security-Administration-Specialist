# 🎤 Interview Q&A - Lab 20: Advanced Linux Security

---

### 1️⃣ What is the difference between iptables and nftables?

**iptables** is the legacy Linux firewall framework using separate tables and chains.  
**nftables** is the modern replacement, offering:

- Unified syntax
- Better performance
- Reduced rule duplication
- Atomic rule updates
- Improved scalability

nftables simplifies complex firewall management compared to iptables.

---

### 2️⃣ Why is the default INPUT policy set to DROP in secure environments?

Setting the default INPUT policy to DROP ensures:

- All incoming traffic is denied unless explicitly allowed
- Minimizes attack surface
- Prevents accidental exposure of services

This follows the **principle of least privilege**.

---

### 3️⃣ What is connection tracking in firewall configuration?

Connection tracking (conntrack) allows the firewall to:

- Identify established connections
- Allow return traffic automatically
- Improve performance
- Maintain stateful filtering

Example:
```
-m conntrack --ctstate ESTABLISHED,RELATED
```

---

### 4️⃣ How does rate limiting protect SSH services?

Rate limiting restricts the number of connection attempts within a time window.  
This helps prevent:

- Brute-force attacks
- SSH scanning tools
- Automated credential attacks

---

### 5️⃣ What is defense-in-depth in Linux security?

Defense-in-depth means combining multiple security layers:

- Firewall filtering
- Mandatory Access Control (SELinux/AppArmor)
- Logging and monitoring
- Vulnerability scanning

If one layer fails, others continue protecting the system.

---

### 6️⃣ What is the role of SELinux in Ubuntu?

Although Ubuntu uses AppArmor by default, SELinux can be installed to provide:

- Mandatory Access Control (MAC)
- Application confinement
- Policy-based security enforcement

SELinux operates at the kernel level.

---

### 7️⃣ What is AppArmor and how is it different from SELinux?

AppArmor is a Mandatory Access Control system that:

- Uses path-based security profiles
- Is simpler to configure
- Is Ubuntu's default MAC system

SELinux uses label-based enforcement, while AppArmor uses file path rules.

---

### 8️⃣ Why should logs be monitored in real time?

Real-time monitoring allows:

- Early detection of brute-force attempts
- Immediate response to firewall drops
- Quick investigation of suspicious activity

Commands like:
```
tail -f /var/log/auth.log
```
are critical for incident response.

---

### 9️⃣ What is the purpose of vulnerability assessment scripts?

Vulnerability assessment scripts help:

- Identify open ports
- Detect unnecessary services
- Find SUID files
- Detect world-writable files
- Review user privileges

They automate security auditing.

---

### 🔟 What is the importance of scanning localhost with nmap?

Scanning localhost verifies:

- Firewall rules effectiveness
- Service exposure
- Open/closed ports
- Service versions

It validates the security configuration.

---

### 1️⃣1️⃣ What is SUID and why is it important to monitor?

SUID (Set User ID) allows users to execute a file with the file owner's privileges.

Improper SUID files can lead to:
- Privilege escalation
- Local exploits
- Unauthorized root access

---

### 1️⃣2️⃣ How do firewall logs help in threat detection?

Firewall logs record:

- Blocked IP addresses
- Suspicious traffic patterns
- Repeated connection attempts

They are crucial for identifying scanning and intrusion attempts.

---

### 1️⃣3️⃣ What happens if SSH gets accidentally blocked?

Emergency fix:

```bash
sudo iptables -I INPUT 1 -p tcp --dport 22 -j ACCEPT
```

Reset firewall if required:

```bash
sudo iptables -F
sudo iptables -P INPUT ACCEPT
```

---

### 1️⃣4️⃣ Why should SELinux/AppArmor not be permanently disabled?

Disabling MAC systems:

- Removes an entire security layer
- Allows compromised applications broader access
- Increases attack surface

Temporary permissive mode is acceptable for debugging only.

---

### 1️⃣5️⃣ What are key enterprise Linux hardening practices?

- Disable unused services
- Use DROP default firewall policy
- Enable logging
- Apply MAC enforcement
- Use SSH key authentication
- Regular vulnerability scans
- Keep system updated

---

## ✅ Summary

This lab demonstrates real-world Linux hardening by integrating:

- Firewall security
- Mandatory Access Control
- Vulnerability assessment
- Security monitoring
- Automated reporting

These are foundational skills for:

- Linux Security Engineers
- DevSecOps Professionals
- Cloud Security Analysts
- System Administrators
