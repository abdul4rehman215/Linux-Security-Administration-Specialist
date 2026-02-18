#!/bin/bash

echo "=== File Permissions Lab Verification ==="
echo

echo "1. Testing chmod functionality:"
ls -l file*.txt test_script.sh
echo

echo "2. Testing ownership changes:"
ls -l | grep testgroup
echo

echo "3. Testing umask effects:"
ls -l umask_test*.txt
echo

echo "4. Testing ACL functionality:"
getfacl acl_test1.txt 2>/dev/null | head -10
echo

echo "5. Testing special permissions:"
ls -ld ~/shared_project 2>/dev/null
echo

echo "6. Current umask setting:"
umask
echo

echo "=== Verification Complete ==="
