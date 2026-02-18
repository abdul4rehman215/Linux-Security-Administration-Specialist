#!/bin/bash
# Memory test script

echo "Starting memory test process..."

data=""
for i in {1..1000}; do
 data="${data}This is test data for memory consumption. "
 sleep 1
done
