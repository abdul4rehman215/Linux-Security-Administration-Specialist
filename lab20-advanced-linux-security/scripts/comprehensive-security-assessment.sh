#!/bin/bash

MASTER_REPORT="comprehensive_security_report_$(date +%Y%m%d_%H%M%S).txt"

echo "=== COMPREHENSIVE LINUX SECURITY ASSESSMENT ===" > $MASTER_REPORT
echo "Assessment performed on: $(date)" >> $MASTER_REPORT
echo "System: $(hostname) - $(uname -a)" >> $MASTER_REPORT
echo >> $MASTER_REPORT

echo "Running vulnerability assessment..."
./vulnerability-assessment.sh
cat vulnerability_report_*.txt >> $MASTER_REPORT
echo >> $MASTER_REPORT

echo "Running network security scan..."
./network-security-scan.sh
cat network_scan_*.txt >> $MASTER_REPORT
echo >> $MASTER_REPORT

echo "Running log analysis..."
./security-log-analysis.sh
cat security_log_analysis_*.txt >> $MASTER_REPORT
echo >> $MASTER_REPORT

echo "=== SECURITY RECOMMENDATIONS ===" >> $MASTER_REPORT
echo "1. Regularly update system packages: sudo apt update && sudo apt upgrade" >> $MASTER_REPORT
echo "2. Monitor authentication logs for suspicious activity" >> $MASTER_REPORT
echo "3. Review and minimize running services" >> $MASTER_REPORT
echo "4. Implement proper firewall rules" >> $MASTER_REPORT
echo "5. Use strong passwords and SSH key authentication" >> $MASTER_REPORT
echo "6. Conduct regular security audits" >> $MASTER_REPORT
echo "7. Keep SELinux/AppArmor policies updated" >> $MASTER_REPORT
echo >> $MASTER_REPORT

rm -f vulnerability_report_*.txt network_scan_*.txt security_log_analysis_*.txt

echo "Comprehensive security assessment completed!"
echo "Master report saved to: $MASTER_REPORT"
