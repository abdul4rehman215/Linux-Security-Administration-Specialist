#!/bin/bash
echo "Generating test network traffic..."

# Generate HTTP requests
curl -s http://httpbin.org/get > /dev/null &

# Generate DNS queries
nslookup google.com > /dev/null &
nslookup facebook.com > /dev/null &

# Generate ICMP traffic
ping -c 3 8.8.8.8 > /dev/null &

# Generate SSH-like traffic (connection attempts)
timeout 2 telnet 127.0.0.1 22 > /dev/null 2>&1 &

echo "Traffic generation started..."
wait
echo "Traffic generation completed."
