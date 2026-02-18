#!/bin/bash

echo "=== Network Monitoring Report ==="
echo "Generated on: $(date)"
echo

echo "--- Active Network Interfaces ---"
ip -o link show | awk -F': ' '{print $2}'
echo

echo "--- IP Address Configuration ---"
ip -o -4 addr show | awk '{print $4, $2}'
echo

echo "--- Listening Services ---"
echo "TCP Services:"
ss -tln | grep LISTEN
echo

echo "UDP Services:"
ss -uln
echo

echo "--- Network Statistics ---"
ss -s
echo

echo "--- Routing Table ---"
ip route show
