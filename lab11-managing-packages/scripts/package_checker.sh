#!/bin/bash

# Package Status Checker

check_package() {
    local package_name=$1

    if command -v apt &>/dev/null; then
        # APT system
        if dpkg -l | grep -q "^ii  $package_name "; then
            echo "Package '$package_name' is installed."
        else
            echo "Package '$package_name' is NOT installed."
        fi

    elif command -v rpm &>/dev/null; then
        # RPM system
        if rpm -qa | grep -q "^$package_name"; then
            echo "Package '$package_name' is installed."
        else
            echo "Package '$package_name' is NOT installed."
        fi
    else
        echo "Unsupported package manager."
    fi
}

get_package_count() {
    if command -v apt &>/dev/null; then
        count=$(dpkg -l | grep ^ii | wc -l)
        echo "Total installed packages (APT): $count"

    elif command -v rpm &>/dev/null; then
        count=$(rpm -qa | wc -l)
        echo "Total installed packages (RPM): $count"
    fi
}

# Main execution
echo "=== Package Status Checker ==="
echo "Date: $(date)"
echo ""

packages=("htop" "curl" "wget" "vim")

for pkg in "${packages[@]}"; do
    check_package "$pkg"
done

echo ""
get_package_count
