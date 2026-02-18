# 🎤 Interview Q&A – Lab 9: Networking Basics and Tools

---

## 1️⃣ What is the difference between `ifconfig` and `ip`?

`ifconfig` is a legacy networking tool from the net-tools package.

`ip` is the modern replacement and part of the iproute2 package.

`ip` provides:
- Better functionality
- Advanced routing capabilities
- Traffic control
- More detailed interface management

Modern Linux systems prefer `ip`.

---

## 2️⃣ What is the difference between `netstat` and `ss`?

`netstat` is part of net-tools (legacy).
`ss` is faster and more efficient.

`ss`:
- Displays socket statistics
- Shows detailed TCP states
- Works directly with kernel structures
- Performs better on high-traffic systems

`ss` is the recommended modern tool.

---

## 3️⃣ How do you check all listening ports on a Linux system?

```bash
ss -tlnp
```

- `-t` → TCP
- `-l` → Listening
- `-n` → Numeric
- `-p` → Show process

This is critical for security audits.

---

## 4️⃣ How do you find the default gateway?

```bash
ip route show default
```

The gateway is the next hop for external traffic.

---

## 5️⃣ What is the difference between a public IP and private IP?

Private IP:
- Used inside local networks
- Not routable on the internet
- Example: 172.31.x.x

Public IP:
- Routable on the internet
- Assigned by ISP or cloud provider

---

## 6️⃣ How can you test basic network connectivity?

Using `ping`:

```bash
ping 8.8.8.8
```

This checks:
- ICMP response
- Network reachability
- Packet loss
- Latency

---

## 7️⃣ What does `traceroute` do?

`traceroute` shows the path packets take to reach a destination.

It helps diagnose:
- Routing loops
- Network latency points
- ISP routing issues
- Packet drops between hops

---

## 8️⃣ How do you temporarily assign an IP address to an interface?

```bash
sudo ip addr add 192.168.1.10/24 dev eth0
```

This is temporary and disappears after reboot.

---

## 9️⃣ How do you bring a network interface up or down?

```bash
sudo ip link set eth0 down
sudo ip link set eth0 up
```

Bringing down an active SSH interface will disconnect remote sessions.

---

## 🔟 How do you check DNS configuration?

```bash
cat /etc/resolv.conf
```

On modern systems, this may point to `127.0.0.53` (systemd-resolved).

---

## 1️⃣1️⃣ How do you detect open ports on your machine?

```bash
ss -tlnp
```

Or test specific port:

```bash
nc -zv localhost 22
```

This is important for security validation.

---

## 1️⃣2️⃣ What is the difference between TCP and UDP?

TCP:
- Connection-oriented
- Reliable
- Used for SSH, HTTP, HTTPS

UDP:
- Connectionless
- Faster
- Used for DNS, streaming, VoIP

---

## 1️⃣3️⃣ How do you monitor network statistics in real time?

```bash
watch -n 2 'cat /proc/net/dev'
```

Or:

```bash
ip -s link show
```

Useful for detecting:
- Traffic spikes
- Packet drops
- Errors

---

## 1️⃣4️⃣ What does a routing table do?

The routing table determines:
- Where packets should be forwarded
- Which interface to use
- Which gateway to use

View with:

```bash
ip route show
```

---

## 1️⃣5️⃣ Why are networking skills important for security?

Because attackers often:
- Open unauthorized ports
- Establish reverse shells
- Create suspicious outbound connections
- Abuse DNS for exfiltration
- Move laterally within networks

Being able to analyze:
- Listening services
- Active connections
- Routing behavior
- DNS resolution

Is critical for:
- SOC analysts
- Incident responders
- Cloud security engineers
- Linux administrators

---

# ✅ Interview Preparation Status

You are now capable of answering:

- Networking fundamentals
- Linux socket analysis
- Routing and DNS troubleshooting
- Port and service detection
- Connectivity diagnostics
- Security-oriented network analysis

This is foundational knowledge for Linux Security & Administration roles.
