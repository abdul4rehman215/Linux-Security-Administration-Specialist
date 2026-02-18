#!/bin/bash
# Audit Log Analysis Script
# Provides automated analysis of audit logs

echo "=== Audit Log Analysis Report ==="
echo "Generated on: $(date)"
echo "=================================="
echo ""

echo "1. SYSTEM OVERVIEW:"
echo "-------------------"
sudo auditctl -s
echo ""

echo "2. RECENT PASSWD CHANGES:"
echo "-------------------------"
sudo ausearch -k passwd_changes -ts recent 2>/dev/null | grep -E "(type=|msg=)" | head -10
echo ""

echo "3. SSH CONFIGURATION CHANGES:"
echo "-----------------------------"
sudo ausearch -k ssh_config_changes -ts recent 2>/dev/null | grep -E "(type=|msg=)" | head -10
echo ""

echo "4. CRON JOB MODIFICATIONS:"
echo "--------------------------"
sudo ausearch -k cron_changes -ts recent 2>/dev/null | grep -E "(type=|msg=)" | head -10
echo ""

echo "5. TEMPORARY FILE ACCESS:"
echo "-------------------------"
sudo ausearch -k tmp_access -ts recent 2>/dev/null | grep -E "(type=|msg=)" | head -10
echo ""

echo "6. FAILED LOGIN ATTEMPTS:"
echo "-------------------------"
sudo ausearch -k failed_logins -ts recent 2>/dev/null | grep -E "(type=|msg=)" | head -10
echo ""

echo "7. SUMMARY STATISTICS:"
echo "----------------------"
echo "Total events today: $(sudo ausearch -ts today 2>/dev/null | wc -l)"
echo "Unique users active: $(sudo aureport -u --start today 2>/dev/null | grep -v '^$' | wc -l)"
echo "Files accessed: $(sudo aureport -f --start today 2>/dev/null | grep -v '^$' | wc -l)"
echo ""

echo "=== End of Report ==="
