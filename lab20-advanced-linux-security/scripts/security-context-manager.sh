#!/bin/bash

echo "=== Security Context Manager ==="
echo

check_selinux() {
    echo "SELinux Status:"
    if command -v sestatus >/dev/null 2>&1; then
        sestatus
        echo
        echo "File contexts in /var/log:"
        ls -Z /var/log/ | head -5
    else
        echo "SELinux not available"
    fi
    echo
}

check_apparmor() {
    echo "AppArmor Status:"
    if command -v aa-status >/dev/null 2>&1; then
        sudo aa-status | head -10
    else
        echo "AppArmor not available"
    fi
    echo
}

show_process_contexts() {
    echo "Process Security Contexts:"
    ps -eZ | head -10
    echo
}

check_selinux
check_apparmor
show_process_contexts

echo "Security context check completed"
