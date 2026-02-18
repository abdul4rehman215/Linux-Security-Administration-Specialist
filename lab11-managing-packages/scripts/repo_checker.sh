#!/bin/bash

# Repository Health Checker

check_repo_health() {
    echo "Checking repository connectivity..."

    if command -v apt &>/dev/null; then
        if sudo apt update -qq &>/dev/null; then
            echo "APT repositories are reachable and healthy."
        else
            echo "APT repository check failed."
        fi

    elif command -v dnf &>/dev/null; then
        if sudo dnf check-update &>/dev/null; then
            echo "DNF repositories are reachable and healthy."
        else
            echo "DNF repository check failed."
        fi
    else
        echo "Unsupported package manager."
    fi
}

list_repositories() {
    echo ""
    echo "Listing enabled repositories..."

    if command -v apt &>/dev/null; then
        echo "APT repositories:"
        grep -r ^deb /etc/apt/sources.list /etc/apt/sources.list.d/ 2>/dev/null

    elif command -v dnf &>/dev/null; then
        echo "DNF repositories:"
        dnf repolist
    fi
}

# Main logic
echo "=== Repository Health Checker ==="
echo "Date: $(date)"
echo ""

check_repo_health
list_repositories
