#!/bin/bash

# Package Inventory Script

OUTPUT_DIR="inventory_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"

detect_package_manager() {
    if command -v apt &>/dev/null; then
        PKG_MANAGER="apt"
    elif command -v dnf &>/dev/null; then
        PKG_MANAGER="dnf"
    elif command -v yum &>/dev/null; then
        PKG_MANAGER="yum"
    else
        echo "Unsupported package manager."
        exit 1
    fi
}

create_package_list() {
    if [ "$PKG_MANAGER" = "apt" ]; then
        dpkg -l | grep ^ii > "$OUTPUT_DIR/installed_packages.txt"
    else
        rpm -qa > "$OUTPUT_DIR/installed_packages.txt"
    fi
}

create_system_summary() {
    {
        echo "=== System Summary ==="
        echo "Hostname: $(hostname)"
        echo "OS Version:"
        cat /etc/os-release
        echo ""
        echo "Kernel Version: $(uname -r)"
        echo ""

        if [ "$PKG_MANAGER" = "apt" ]; then
            echo "Total Installed Packages: $(dpkg -l | grep ^ii | wc -l)"
        else
            echo "Total Installed Packages: $(rpm -qa | wc -l)"
        fi

        echo ""
        echo "Disk Usage:"
        df -h
        echo ""
        echo "Memory Info:"
        free -h
    } > "$OUTPUT_DIR/system_summary.txt"
}

check_security_updates() {
    if [ "$PKG_MANAGER" = "apt" ]; then
        apt list --upgradeable 2>/dev/null | grep -i security > "$OUTPUT_DIR/security_updates.txt"
    else
        dnf updateinfo list security > "$OUTPUT_DIR/security_updates.txt"
    fi
}

create_restore_script() {
    RESTORE_SCRIPT="$OUTPUT_DIR/restore_packages.sh"

    echo "#!/bin/bash" > "$RESTORE_SCRIPT"
    echo "# Restore Installed Packages Script" >> "$RESTORE_SCRIPT"
    echo "" >> "$RESTORE_SCRIPT"

    if [ "$PKG_MANAGER" = "apt" ]; then
        echo "sudo apt update" >> "$RESTORE_SCRIPT"
        awk '{print $2}' "$OUTPUT_DIR/installed_packages.txt" | while read pkg; do
            echo "sudo apt install -y $pkg" >> "$RESTORE_SCRIPT"
        done
    else
        echo "sudo dnf update -y" >> "$RESTORE_SCRIPT"
        cat "$OUTPUT_DIR/installed_packages.txt" | while read pkg; do
            echo "sudo dnf install -y $pkg" >> "$RESTORE_SCRIPT"
        done
    fi

    chmod +x "$RESTORE_SCRIPT"
}

# Main execution
echo "Creating package inventory..."

detect_package_manager
create_package_list
create_system_summary
check_security_updates
create_restore_script

echo "Inventory created successfully in directory: $OUTPUT_DIR"
echo "Files generated:"
echo "- installed_packages.txt"
echo "- system_summary.txt"
echo "- security_updates.txt"
echo "- restore_packages.sh"
