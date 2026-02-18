# 🛠 Troubleshooting Guide – Lab 9: Networking Basics & Tools

---

# 🔎 Issue 1: "Command Not Found" Errors

### Symptoms

`ifconfig: command not found`
`traceroute: command not found`
`nc: command not found`


### Root Cause
Required package not installed.

### Solution

```bash
sudo apt install net-tools -y
sudo apt install traceroute -y
sudo apt install netcat -y
```

---

# 🔎 Issue 2: No Internet Connectivity

### Symptoms
- `ping 8.8.8.8` fails
- External sites unreachable

### Diagnostic Steps

1️⃣ Check interface status:

```bash
ip link show
```

2️⃣ Check IP assignment:

```bash
ip addr show
```

3️⃣ Check routing table:

```bash
ip route show
```

4️⃣ Ping gateway:

```bash
ping 172.31.0.1
```

### Possible Causes

- Interface down
- No default gateway
- Security group restrictions (cloud)
- Firewall blocking outbound traffic

---

# 🔎 Issue 3: DNS Resolution Fails

### Symptoms
`
ping 8.8.8.8 works
ping google.com fails
`

### Root Cause
DNS configuration issue.

### Diagnostic

```bash
cat /etc/resolv.conf
```

### Fix

Restart resolver:

```bash
sudo systemctl restart systemd-resolved
```

Or manually configure nameserver:

```
nameserver 8.8.8.8
```

---

# 🔎 Issue 4: Interface Down

### Symptoms
`
state DOWN
`

### Fix

```bash
sudo ip link set eth0 up
```

⚠️ On remote systems, bringing interface down will disconnect SSH.

---

# 🔎 Issue 5: Secondary IP Not Working

### Symptoms
IP added but not reachable.

### Diagnostic

```bash
ip addr show
ip route show
```

### Cause
Temporary IP may not have routing entry.

### Fix
Ensure subnet is correct and routing exists.

---

# 🔎 Issue 6: Cannot Detect Listening Ports

### Symptoms
Expected service not appearing in `ss`.

### Diagnostic

```bash
ss -tlnp
```

### Causes

- Service not running
- Firewall blocking
- Wrong interface binding (127.0.0.1 only)

### Fix

Check service status:

```bash
systemctl status servicename
```

---

# 🔎 Issue 7: High Packet Loss

### Symptoms
`
ping shows packet loss > 0%
`

### Causes

- Network congestion
- Firewall rate limiting ICMP
- Routing instability
- Security group restrictions

### Diagnostic

```bash
traceroute google.com
```

Look for latency spikes or dropped hops.

---

# 🔎 Issue 8: SSH Not Reachable

### Diagnostic Steps

1️⃣ Check listening port:

```bash
ss -tlnp | grep :22
```

2️⃣ Check SSH service:

```bash
systemctl status ssh
```

3️⃣ Check firewall:

```bash
sudo ufw status
```

4️⃣ In cloud environments:
- Verify security group allows port 22

---

# 🔎 Issue 9: Wrong Interface Name

### Symptoms
`eth0` does not exist.

### Diagnostic

```bash
ip link show
```

Modern systems may use:
- enp0s3
- ens33
- eno1

Use the actual interface name shown.

---

# 🔎 Issue 10: netstat Output Empty

### Cause
Using wrong flags.

### Use Proper Command

```bash
netstat -tlnp
```

Or better:

```bash
ss -tlnp
```

---

# 🔎 Issue 11: traceroute Shows "* * *"

### Meaning
Hop did not respond.

### Causes

- Firewall blocking ICMP/UDP
- Router configured not to respond
- Network filtering

Not always a problem.

---

# 🔎 Issue 12: Cannot Modify Interface Settings

### Symptoms
Permission denied.

### Fix

Always use sudo:

```bash
sudo ip addr add 192.168.1.10/24 dev eth0
```

---

# 🔎 Issue 13: Slow Network Performance

### Diagnostic

```bash
ip -s link show
```

Check:
- Dropped packets
- Errors
- RX/TX imbalance

Use:

```bash
ss -s
```

To analyze socket load.

---

# 🔎 Issue 14: No Default Route

### Symptoms
Can ping local IP but not external.

### Diagnostic

```bash
ip route show
```

If no default route, add temporarily:

```bash
sudo ip route add default via 172.31.0.1
```

---

# 🔎 Issue 15: Firewall Blocking Traffic

Check firewall:

```bash
sudo ufw status
```

Or:

```bash
sudo iptables -L
```

Cloud servers may use:

- Security Groups
- Network ACLs

---

# 🔐 Security-Oriented Troubleshooting

When investigating suspicious network behavior:

- Check listening ports
- Check outbound connections
- Review unexpected ESTABLISHED connections
- Look for unknown high-number ports
- Monitor unusual DNS requests
- Validate routing changes

Useful commands:

```bash
ss -antup
ip route show
cat /etc/resolv.conf
```

---

# 🧠 Best Practice Recommendations

- Prefer `ip` over `ifconfig`
- Prefer `ss` over `netstat`
- Always validate routing before blaming DNS
- Test connectivity step-by-step:
  1. Localhost
  2. Gateway
  3. External IP
  4. Domain name
- Never bring down remote interface without recovery plan
- Monitor for unexpected listening ports regularly

---

# ✅ Troubleshooting Guide Complete

This guide prepares you for:

- Real-world Linux network failures
- Cloud troubleshooting scenarios
- Security investigations
- SOC-level network diagnostics
- Production outage response
