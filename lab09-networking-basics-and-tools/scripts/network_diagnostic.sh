#!/bin/bash

echo "=== Complete Network Diagnostic Report ==="
echo "Generated: $(date)"
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo

echo "--- System Network Configuration ---"
echo "Kernel version: $(uname -r)"
echo "Network interfaces:"
ip -o link show | awk -F': ' '{print $2}'
echo

echo "--- IP Configuration ---"
ip -4 addr show | grep inet
echo

echo "--- Routing Information ---"
echo "Default gateway: $(ip route show default | awk '{print $3}')"
echo "Routing table:"
ip route show
echo

echo "--- DNS Configuration ---"
cat /etc/resolv.conf | grep nameserver
echo

echo "--- Active Connections ---"
echo "Listening TCP ports:"
ss -tln | grep LISTEN
echo

echo "--- Connectivity Tests ---"

# Localhost test
ping -c 1 127.0.0.1 > /dev/null 2>&1 && echo "Localhost: OK" || echo "Localhost: FAILED"

# Gateway test
GATEWAY=$(ip route show default | awk '{print $3}')
ping -c 1 "$GATEWAY" > /dev/null 2>&1 && echo "Gateway ($GATEWAY): OK" || echo "Gateway ($GATEWAY): FAILED"

# External test
ping -c 1 8.8.8.8 > /dev/null 2>&1 && echo "External (8.8.8.8): OK" || echo "External (8.8.8.8): FAILED"

# DNS resolution test
ping -c 1 google.com > /dev/null 2>&1 && echo "DNS Resolution: OK" || echo "DNS Resolution: FAILED"

echo
echo "=== Diagnostic Complete ==="
