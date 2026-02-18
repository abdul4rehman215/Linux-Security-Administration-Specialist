#!/bin/bash
INTERFACE="ens5"
LOG_DIR="$HOME/network_logs"
DATE=$(date +%Y%m%d_%H%M%S)

# Create log directory
mkdir -p "$LOG_DIR"

echo "Network Monitoring Dashboard"
echo "==========================="
echo "Interface: $INTERFACE"
echo "Log Directory: $LOG_DIR"
echo "Start Time: $(date)"
echo

# Function to monitor specific traffic types
monitor_traffic() {
 local traffic_type="$1"
 local filter="$2"
 local filename="$3"

 echo "Starting $traffic_type monitoring..."
 sudo tcpdump -i "$INTERFACE" "$filter" -w "$LOG_DIR/${filename}_${DATE}.pcap" -c 50 &
 echo "PID: $!"
}

# Start different monitoring sessions
monitor_traffic "HTTP Traffic" "port 80" "http"
monitor_traffic "HTTPS Traffic" "port 443" "https"
monitor_traffic "DNS Traffic" "port 53" "dns"
monitor_traffic "SSH Traffic" "port 22" "ssh"
monitor_traffic "ICMP Traffic" "icmp" "icmp"

echo
echo "All monitoring sessions started. Generating some traffic..."

# Generate test traffic
curl -s http://httpbin.org/get > /dev/null &
nslookup google.com > /dev/null &
ping -c 3 8.8.8.8 > /dev/null &

echo "Waiting for capture completion..."
wait

echo
echo "Monitoring completed. Files saved in $LOG_DIR"
ls -la "$LOG_DIR"
