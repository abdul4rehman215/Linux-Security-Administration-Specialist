# 🎤 Interview Q&A - Lab 13: Network Monitoring with Tcpdump

---

### 1️⃣ What is tcpdump and why is it important in cybersecurity?

**Answer:**  
Tcpdump is a command-line packet analyzer used to capture and inspect network traffic in real time.  
It is essential in cybersecurity because it allows security professionals to:

- Monitor live network traffic
- Detect suspicious activity
- Analyze protocol behavior
- Investigate security incidents
- Perform forensic packet analysis

It is widely used in SOC environments and incident response teams.

---

### 2️⃣ What is libpcap and how is it related to tcpdump?

**Answer:**  
Libpcap is a packet capture library that provides low-level network monitoring capabilities.  
Tcpdump uses libpcap to capture packets from network interfaces.

Without libpcap, tcpdump cannot function.

---

### 3️⃣ How do you capture traffic on a specific interface?

**Answer:**
`
sudo tcpdump -i ens5
`

The `-i` flag specifies the network interface to monitor.

To list available interfaces:

`
sudo tcpdump -D
`

---

### 4️⃣ How can you limit the number of packets captured?

**Answer:**

`
sudo tcpdump -i ens5 -c 10
`

The `-c` flag stops capture after the specified number of packets.

---

### 5️⃣ How do you filter traffic by protocol?

**Answer:**

* TCP only:

`
sudo tcpdump -i ens5 tcp
`

* UDP only:

`
sudo tcpdump -i ens5 udp
`

* ICMP only:

`
sudo tcpdump -i ens5 icmp
`

Protocol filtering helps isolate relevant traffic during investigations.

---

### 6️⃣ How can tcpdump detect port scanning behavior?

**Answer:**
Port scans often generate multiple SYN packets without completing handshakes.

Detection filter:

`
tcpdump -r capture.pcap 'tcp[tcpflags] & tcp-syn != 0'
`

Repeated SYN packets from a single host may indicate reconnaissance activity.

---

### 7️⃣ How do you save captured traffic for later analysis?

**Answer:**

`
sudo tcpdump -i ens5 -w capture.pcap
`

The `-w` option writes packets to a `.pcap` file for offline analysis using:

* tcpdump
* Wireshark
* Other forensic tools

---

### 8️⃣ How do you read a saved pcap file?

**Answer:**

`
tcpdump -r capture.pcap
`

To filter while reading:

`
tcpdump -r capture.pcap port 53
`

---

### 9️⃣ What are some indicators of suspicious network activity in packet captures?

**Answer:**

* Multiple SYN packets (possible port scan)
* High DNS query frequency
* Repeated failed SSH attempts
* Large unexpected data transfers
* Connections to unknown external IPs
* Unusual traffic on uncommon ports

---

### 🔟 Why is tcpdump considered a foundational security tool?

**Answer:**

Tcpdump provides:

* Direct visibility into raw network traffic
* Low-level protocol inspection
* Real-time monitoring capability
* Lightweight and scriptable analysis

It forms the foundation for:

* Intrusion detection
* Threat hunting
* Network troubleshooting
* Digital forensics

Many advanced security tools build upon packet capture concepts introduced by tcpdump.

---

### 1️⃣1️⃣ What is the difference between tcpdump and Wireshark?

**Answer:**

| Tcpdump           | Wireshark                        |
| ----------------- | -------------------------------- |
| CLI-based         | GUI-based                        |
| Lightweight       | More feature-rich                |
| Ideal for servers | Ideal for deep forensic analysis |
| Scriptable        | Visual packet dissection         |

Tcpdump is preferred on production Linux servers where GUI access is not available.

---

### 1️⃣2️⃣ How can tcpdump be used in incident response?

**Answer:**

During a security incident, tcpdump can:

* Capture live malicious traffic
* Identify attacker IP addresses
* Detect command-and-control traffic
* Analyze data exfiltration attempts
* Provide forensic evidence in .pcap format

It is one of the first tools used during network-based investigations.

---

## Summary

This lab demonstrates practical, real-world network monitoring skills.
Understanding tcpdump deeply prepares professionals for:

* SOC Analyst roles
* Incident Response
* Threat Hunting
* Network Security Engineering
* Digital Forensics
