#!/bin/bash

# Package Management Automation

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

log() {
    echo -e "[$(date '+%H:%M:%S')] $1"
}

detect_package_manager() {
    if command -v apt &>/dev/null; then
        PKG_MANAGER="apt"
        UPDATE_CMD="sudo apt update"
        INSTALL_CMD="sudo apt install -y"
        REMOVE_CMD="sudo apt remove -y"
        CLEAN_CMD="sudo apt autoremove -y && sudo apt clean"
    elif command -v dnf &>/dev/null; then
        PKG_MANAGER="dnf"
        UPDATE_CMD="sudo dnf update -y"
        INSTALL_CMD="sudo dnf install -y"
        REMOVE_CMD="sudo dnf remove -y"
        CLEAN_CMD="sudo dnf autoremove -y && sudo dnf clean all"
    elif command -v yum &>/dev/null; then
        PKG_MANAGER="yum"
        UPDATE_CMD="sudo yum update -y"
        INSTALL_CMD="sudo yum install -y"
        REMOVE_CMD="sudo yum remove -y"
        CLEAN_CMD="sudo yum autoremove -y && sudo yum clean all"
    else
        echo -e "${RED}No supported package manager found.${NC}"
        exit 1
    fi

    log "Detected package manager: $PKG_MANAGER"
}

update_repositories() {
    log "Updating repositories..."
    eval $UPDATE_CMD
    log "Repositories updated successfully."
}

install_packages() {
    local packages=("$@")

    for pkg in "${packages[@]}"; do
        log "Installing $pkg..."
        if eval "$INSTALL_CMD $pkg"; then
            echo -e "${GREEN}$pkg installed successfully.${NC}"
        else
            echo -e "${RED}Failed to install $pkg.${NC}"
        fi
    done
}

remove_packages() {
    local packages=("$@")

    for pkg in "${packages[@]}"; do
        log "Removing $pkg..."
        eval "$REMOVE_CMD $pkg"
    done
}

install_dev_tools() {
    if [ "$PKG_MANAGER" = "apt" ]; then
        packages=("build-essential" "git" "curl" "wget" "vim")
    else
        packages=("gcc" "gcc-c++" "make" "git" "curl" "wget" "vim")
    fi

    install_packages "${packages[@]}"
}

system_maintenance() {
    update_repositories
    log "Cleaning system..."
    eval $CLEAN_CMD
    log "System maintenance completed."
}

show_menu() {
    echo ""
    echo "=== Package Automation Tool ==="
    echo "1. Update repositories"
    echo "2. Install dev tools"
    echo "3. Install custom packages"
    echo "4. Remove packages"
    echo "5. System maintenance"
    echo "6. Exit"
}

main() {
    detect_package_manager

    while true; do
        show_menu
        read -p "Select option: " choice

        case $choice in
            1)
                update_repositories
                ;;
            2)
                install_dev_tools
                ;;
            3)
                read -p "Enter package names (space separated): " -a pkgs
                install_packages "${pkgs[@]}"
                ;;
            4)
                read -p "Enter package names to remove: " -a pkgs
                remove_packages "${pkgs[@]}"
                ;;
            5)
                system_maintenance
                ;;
            6)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option. Try again.${NC}"
                ;;
        esac
    done
}

main
