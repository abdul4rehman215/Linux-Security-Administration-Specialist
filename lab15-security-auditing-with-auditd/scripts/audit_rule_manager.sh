#!/bin/bash
# Audit Rule Management Script

RULES_DIR="/etc/audit/rules.d"
BACKUP_DIR="/etc/audit/backup"

show_menu() {
 echo "=== Audit Rule Manager ==="
 echo "1. List all active rules"
 echo "2. Backup current rules"
 echo "3. Load rules from file"
 echo "4. Test rule syntax"
 echo "5. Generate rule statistics"
 echo "6. Search for specific rule"
 echo "7. Exit"
 echo "=========================="
}

list_rules() {
 echo "Active Audit Rules:"
 echo "==================="
 sudo auditctl -l | nl
 echo ""
 echo "Total rules: $(sudo auditctl -l | wc -l)"
}

backup_rules() {
 TIMESTAMP=$(date +%Y%m%d_%H%M%S)
 sudo mkdir -p $BACKUP_DIR
 sudo cp -r $RULES_DIR/* $BACKUP_DIR/backup_$TIMESTAMP/
 echo "Rules backed up to: $BACKUP_DIR/backup_$TIMESTAMP/"
}

load_rules() {
 echo "Loading audit rules..."
 sudo augenrules --load
 sudo service auditd restart
 echo "Rules loaded successfully!"
}

test_syntax() {
 echo "Testing audit rule syntax..."
 sudo augenrules --check
}

generate_stats() {
 echo "Audit Rule Statistics:"
 echo "====================="
 echo "Total rule files: $(ls $RULES_DIR/*.rules 2>/dev/null | wc -l)"
 echo "Total active rules: $(sudo auditctl -l | wc -l)"
 echo "Watch rules: $(sudo auditctl -l | grep -c '^-w')"
 echo "System call rules: $(sudo auditctl -l | grep -c '^-a')"
 echo ""
 echo "Rule categories:"
 sudo auditctl -l | grep -o '\-k [^ ]*' | sort | uniq -c | sort -nr
}

search_rules() {
 read -p "Enter search term: " search_term
 echo "Searching for rules containing: $search_term"
 echo "============================================="
 sudo auditctl -l | grep -i "$search_term" | nl
}

while true; do
 show_menu
 read -p "Select an option (1-7): " choice

 case $choice in
 1) list_rules ;;
 2) backup_rules ;;
 3) load_rules ;;
 4) test_syntax ;;
 5) generate_stats ;;
 6) search_rules ;;
 7) echo "Exiting..."; exit 0 ;;
 *) echo "Invalid option. Please try again." ;;
 esac

 echo ""
 read -p "Press Enter to continue..."
 clear
done
