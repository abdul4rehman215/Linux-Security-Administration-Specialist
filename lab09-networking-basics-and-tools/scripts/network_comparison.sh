#!/bin/bash

echo "=== Network Interface Comparison ==="
echo

echo "--- Using ifconfig ---"
ifconfig | grep -E "^(eth|lo)" -A1
echo

echo "--- Using ip addr ---"
ip addr show | grep -E "^[0-9]|inet "
echo

echo "--- Routing Information ---"
echo "ifconfig route (use route command):"
route -n 2>/dev/null || echo "route command not available"
echo
echo "ip route:"
ip route show
