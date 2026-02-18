#!/bin/bash
echo "Simulating network security incident..."

# Simulate normal web browsing
curl -s http://httpbin.org/user-agent > /dev/null &

# Simulate multiple SSH attempts
for i in {1..5}; do
 timeout 1 telnet 127.0.0.1 22 > /dev/null 2>&1 &
done

# Simulate DNS queries
for domain in google.com facebook.com github.com stackoverflow.com; do
 nslookup $domain > /dev/null &
done

# Simulate file transfer
dd if=/dev/zero bs=1024 count=100 2>/dev/null | nc -l 8080 &
sleep 1
timeout 2 nc 127.0.0.1 8080 < /dev/null > /dev/null 2>&1

wait
echo "Simulation completed."
