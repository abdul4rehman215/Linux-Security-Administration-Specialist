# ==============================
# Task 1: Verify Installation
# ==============================

which tcpdump
tcpdump --version

ip link show
sudo tcpdump -D

# ==============================
# Task 2: Basic Packet Capture
# ==============================

sudo tcpdump -i ens5
sudo tcpdump -i ens5 -c 10
sudo tcpdump -i ens5 -v -c 5
sudo tcpdump -i ens5 -X -c 3
sudo tcpdump -i ens5 -A -c 3

# ==============================
# Task 3: Protocol-Based Filters
# ==============================

sudo tcpdump -i ens5 tcp -c 10
sudo tcpdump -i ens5 udp -c 10
sudo tcpdump -i ens5 icmp -c 5

# ==============================
# Port-Based Filters
# ==============================

sudo tcpdump -i ens5 port 80 -c 10
sudo tcpdump -i ens5 port 443 -c 10
sudo tcpdump -i ens5 port 22 -c 10

# ==============================
# Host-Based Filters
# ==============================

sudo tcpdump -i ens5 host 8.8.8.8 -c 5
ping -c 3 8.8.8.8

# ==============================
# Complex Filters
# ==============================

sudo tcpdump -i ens5 'port 80 or port 443' -c 10
sudo tcpdump -i ens5 'tcp and (port 22 or port 80)' -c 10
sudo tcpdump -i ens5 'net 172.31.0.0/16' -c 10

# ==============================
# Task 4: Saving Captures
# ==============================

mkdir ~/tcpdump_captures
cd ~/tcpdump_captures

sudo tcpdump -i ens5 -w capture_all.pcap -c 50
sudo tcpdump -i ens5 port 80 -w http_traffic.pcap -c 20

ping -c 5 8.8.8.8 &
sudo tcpdump -i ens5 icmp -w icmp_traffic.pcap -c 10

tcpdump -r capture_all.pcap
tcpdump -r capture_all.pcap tcp
tcpdump -r http_traffic.pcap -v

# ==============================
# Task 5: Traffic Generation
# ==============================

nano generate_traffic.sh
chmod +x generate_traffic.sh

sudo tcpdump -i ens5 -w security_analysis.pcap -c 100 &
TCPDUMP_PID=$!

./generate_traffic.sh

sudo kill $TCPDUMP_PID

tcpdump -r security_analysis.pcap
tcpdump -r security_analysis.pcap port 53
tcpdump -r security_analysis.pcap port 80
tcpdump -r security_analysis.pcap port 22

tcpdump -r security_analysis.pcap 'tcp[tcpflags] & tcp-syn != 0'
tcpdump -r security_analysis.pcap 'tcp[tcpflags] & tcp-rst != 0'
tcpdump -r security_analysis.pcap 'greater 1000'

# ==============================
# Task 6: Advanced Analysis
# ==============================

sudo tcpdump -i ens5 -tttt -c 10

nano analyze_traffic.sh
chmod +x analyze_traffic.sh
./analyze_traffic.sh security_analysis.pcap

nano security_monitor.sh
chmod +x security_monitor.sh
./security_monitor.sh

ls -lh *.pcap

# ==============================
# Task 7: Simulated Incident
# ==============================

nano simulate_incident.sh
chmod +x simulate_incident.sh

sudo tcpdump -i ens5 -w incident_capture.pcap -c 200 &
TCPDUMP_PID=$!

./simulate_incident.sh

sleep 5
sudo kill $TCPDUMP_PID

tcpdump -r incident_capture.pcap | wc -l
tcpdump -r incident_capture.pcap port 22 -c 10
tcpdump -r incident_capture.pcap port 53 -c 10
tcpdump -r incident_capture.pcap port 80 -c 10
tcpdump -r incident_capture.pcap port 8080 -c 10

# ==============================
# Task 8: Monitoring Dashboard
# ==============================

nano network_monitor.sh
chmod +x network_monitor.sh
./network_monitor.sh

nano analyze_all.sh
chmod +x analyze_all.sh
./analyze_all.sh

# ==============================
# Troubleshooting Commands
# ==============================

sudo usermod -a -G wireshark $USER
sudo tcpdump -i eth0

ip link show
ping -c 3 8.8.8.8

sudo chown $USER:$USER *.pcap
