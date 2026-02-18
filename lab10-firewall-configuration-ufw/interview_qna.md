# 🎤 Interview Q&A - Lab 10: Firewall Configuration with UFW  
 
---

## 1️⃣ What is UFW and how does it relate to iptables?

**Answer:**
UFW (Uncomplicated Firewall) is a user-friendly frontend for managing firewall rules in Linux systems.  
It simplifies the configuration of **iptables**, which is the underlying packet filtering framework in the Linux kernel.

UFW abstracts complex iptables chains into easy-to-understand commands such as:

`bash
sudo ufw allow 22/tcp
`

Internally, UFW generates corresponding iptables rules.

---

## 2️⃣ Why must SSH be allowed before enabling UFW on a remote server?

**Answer:**
If SSH (port 22) is not allowed before enabling UFW on a remote server:

* The default incoming policy (`deny`) will block SSH
* You will immediately lose remote access
* The server may require physical/console access to recover

Best practice:

`bash
sudo ufw allow ssh
sudo ufw enable
`

---

## 3️⃣ What are default policies in UFW and why are they important?

**Answer:**
Default policies determine how traffic is handled if no explicit rule matches.

Common secure configuration:

`
sudo ufw default deny incoming
sudo ufw default allow outgoing
`

This follows the **principle of least privilege**, ensuring only explicitly allowed services are accessible.

---

## 4️⃣ How does UFW process rules?

**Answer:**
UFW processes rules **top to bottom** in the order they are listed.

You can view rule order using:

`
sudo ufw status numbered
`

Rule order matters because the first matching rule is applied.

---

## 5️⃣ How do you allow traffic from a specific IP address only?

**Answer:**

`
sudo ufw allow from 192.168.1.100
`

Or restrict to a specific port:

`
sudo ufw allow from 192.168.1.100 to any port 22
`

This enhances security by limiting access to trusted IPs.

---

## 6️⃣ How can you configure port ranges in UFW?

**Answer:**

Allow TCP range:

`
sudo ufw allow 6000:6010/tcp
`

Allow UDP range:

`
sudo ufw allow 60000:61000/udp
`

Useful for applications requiring multiple ports.

---

## 7️⃣ How do you enable logging in UFW and why is it important?

**Answer:**

`
sudo ufw logging high
`

Logging helps:

* Detect intrusion attempts
* Monitor blocked connections
* Investigate security incidents
* Support forensic analysis

Logs can be viewed via:

`
sudo journalctl -u ufw
`

or

`
sudo grep UFW /var/log/syslog
`

---

## 8️⃣ What is an application profile in UFW?

**Answer:**
Application profiles define grouped port rules for specific services.

Example:

`
sudo ufw app list
sudo ufw allow 'Apache Full'
`

Profile file location:

`
/etc/ufw/applications.d/
`

This simplifies rule management.

---

## 9️⃣ How can you delete a rule in UFW?

**Answer:**

Delete by number:

`
sudo ufw delete 5
`

Delete by specification:

`
sudo ufw delete allow 8080
`

Deleting by number is safer when rule order matters.

---

## 🔟 How do you view underlying iptables rules used by UFW?

**Answer:**

`
sudo ufw show raw
`

This displays the iptables chains created by UFW.

---

## 1️⃣1️⃣ What happens when you reset UFW?

**Answer:**

`
sudo ufw --force reset
`

Reset:

* Deletes all rules
* Restores defaults
* Disables firewall

Used during troubleshooting or reconfiguration.

---

## 1️⃣2️⃣ What are firewall best practices in production?

**Answer:**

* Always allow SSH before enabling
* Use default deny policy
* Restrict by IP where possible
* Avoid exposing database ports publicly
* Enable logging
* Regularly audit rules
* Keep rule order clean
* Use application profiles
* Combine firewall with IDS/IPS

---

# ✅ Summary

In this lab, you demonstrated:

* Practical firewall implementation
* IP-based restrictions
* Logging & monitoring
* Rule auditing & management
* Production-ready security configuration

These concepts are foundational for Linux security, DevOps, and system administration roles.
