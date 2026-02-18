#!/bin/bash
LOG_DIR="$HOME/network_logs"

echo "Network Traffic Analysis Summary"
echo "==============================="
echo "Analysis Date: $(date)"
echo

for pcap_file in "$LOG_DIR"/*.pcap; do
 if [ -f "$pcap_file" ]; then
 echo "File: $(basename "$pcap_file")"
 echo "Packets: $(tcpdump -r "$pcap_file" 2>/dev/null | wc -l)"
 echo "File Size: $(ls -lh "$pcap_file" | awk '{print $5}')"
 echo "---"
 fi
done

echo
echo "Top 5 most active protocols:"
for pcap_file in "$LOG_DIR"/*.pcap; do
 if [ -f "$pcap_file" ]; then
 tcpdump -r "$pcap_file" -n 2>/dev/null
 fi
done | grep -oE 'TCP|UDP|ICMP' | sort | uniq -c | sort -nr | head -5
