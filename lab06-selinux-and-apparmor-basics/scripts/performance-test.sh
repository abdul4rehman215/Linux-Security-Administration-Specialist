#!/bin/bash
# ==========================================================
# Lab 06 – Performance Comparison Script
# ==========================================================

echo "Starting performance test..."

time for i in {1..1000}; do
 ls /etc/ > /dev/null 2>&1
done

echo "Performance test completed."
