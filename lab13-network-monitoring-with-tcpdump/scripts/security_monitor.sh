#!/bin/bash
INTERFACE="ens5"
DURATION=60

echo "Starting security monitoring on $INTERFACE for $DURATION seconds..."

# Monitor for potential port scans
echo "Monitoring for potential port scans..."
timeout $DURATION sudo tcpdump -i $INTERFACE -c 20 'tcp[tcpflags] & tcp-syn != 0 and tcp[tcpflags] & tcpack == 0' -w port_scan_attempts.pcap &

# Monitor for DNS queries
echo "Monitoring DNS queries..."
timeout $DURATION sudo tcpdump -i $INTERFACE -c 20 'port 53' -w dns_queries.pcap &

# Monitor for large data transfers
echo "Monitoring for large packets..."
timeout $DURATION sudo tcpdump -i $INTERFACE -c 20 'greater 1500' -w large_packets.pcap &

wait
echo "Security monitoring completed. Check the generated .pcap files for analysis."
