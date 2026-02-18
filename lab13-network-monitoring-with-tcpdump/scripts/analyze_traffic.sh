#!/bin/bash
PCAP_FILE="$1"

if [ -z "$PCAP_FILE" ]; then
 echo "Usage: $0 <pcap_file>"
 exit 1
fi

echo "=== Traffic Analysis Report ==="
echo "File: $PCAP_FILE"
echo "Generated on: $(date)"
echo

echo "=== Total Packets ==="
tcpdump -r "$PCAP_FILE" | wc -l
echo

echo "=== Protocol Distribution ==="
echo "TCP Packets:"
tcpdump -r "$PCAP_FILE" tcp 2>/dev/null | wc -l
echo "UDP Packets:"
tcpdump -r "$PCAP_FILE" udp 2>/dev/null | wc -l
echo "ICMP Packets:"
tcpdump -r "$PCAP_FILE" icmp 2>/dev/null | wc -l
echo

echo "=== Top Destination Ports ==="
tcpdump -r "$PCAP_FILE" -n 2>/dev/null | grep -oE 'dpt:[0-9]+' | sort | uniq -c | sort -nr | head -5
echo

echo "=== Unique Hosts ==="
tcpdump -r "$PCAP_FILE" -n 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort | uniq | head -10
