#!/bin/bash

echo "=== Network Connectivity Test ==="
echo "Test started at: $(date)"
echo

# Test localhost
echo "--- Testing Localhost ---"
if ping -c 2 127.0.0.1 > /dev/null 2>&1; then
    echo "✓ Localhost connectivity: OK"
else
    echo "✗ Localhost connectivity: FAILED"
fi
echo

# Test default gateway
GATEWAY=$(ip route show default | awk '{print $3}')
echo "--- Testing Default Gateway ($GATEWAY) ---"
if ping -c 2 "$GATEWAY" > /dev/null 2>&1; then
    echo "✓ Gateway connectivity: OK"
else
    echo "✗ Gateway connectivity: FAILED"
fi
echo

# Test DNS resolution
echo "--- Testing DNS Resolution ---"
if ping -c 2 google.com > /dev/null 2>&1; then
    echo "✓ DNS resolution: OK"
else
    echo "✗ DNS resolution: FAILED"
fi
echo

# Test external connectivity
echo "--- Testing External Connectivity ---"
if ping -c 2 8.8.8.8 > /dev/null 2>&1; then
    echo "✓ External connectivity: OK"
else
    echo "✗ External connectivity: FAILED"
fi
echo

echo "Test completed at: $(date)"
