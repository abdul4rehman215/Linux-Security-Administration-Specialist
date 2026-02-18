#!/bin/bash

# Fail2Ban Management Script

show_help() {
    echo "Usage: $0 [OPTION] [JAIL] [IP]"
    echo ""
    echo "Options:"
    echo "  -s, --status [JAIL]      Show status of all jails or specific jail"
    echo "  -u, --unban JAIL IP      Unban specific IP from jail"
    echo "  -b, --ban JAIL IP        Manually ban IP in jail"
    echo "  -l, --list JAIL          List banned IPs in jail"
    echo "  -h, --help               Show this help message"
}

case "$1" in
    -s|--status)
        if [ -z "$2" ]; then
            fail2ban-client status
        else
            fail2ban-client status "$2"
        fi
        ;;
    -u|--unban)
        if [ -z "$2" ] || [ -z "$3" ]; then
            echo "Error: Please specify jail and IP address"
            show_help
            exit 1
        fi
        fail2ban-client set "$2" unbanip "$3"
        echo "IP $3 unbanned from jail $2"
        ;;
    -b|--ban)
        if [ -z "$2" ] || [ -z "$3" ]; then
            echo "Error: Please specify jail and IP address"
            show_help
            exit 1
        fi
        fail2ban-client set "$2" banip "$3"
        echo "IP $3 banned in jail $2"
        ;;
    -l|--list)
        if [ -z "$2" ]; then
            echo "Error: Please specify jail name"
            show_help
            exit 1
        fi
        fail2ban-client status "$2" | grep "Banned IP list:" | cut -d: -f2
        ;;
    -h|--help)
        show_help
        ;;
    *)
        echo "Error: Invalid option"
        show_help
        exit 1
        ;;
esac
