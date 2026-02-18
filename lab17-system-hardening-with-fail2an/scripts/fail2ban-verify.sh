#!/bin/bash

echo "=== Fail2Ban System Verification ==="
echo ""

echo "1. Service Status:"
systemctl is-active fail2ban
echo ""

echo "2. Active Jails:"
fail2ban-client status
echo ""

echo "3. Configuration Test:"
fail2ban-client -t
echo ""

echo "4. Log Files Being Monitored:"
for jail in $(fail2ban-client status | grep "Jail list:" | cut -d: -f2 | tr ',' '\n' | tr -d ' ')
do
    echo " $jail: $(fail2ban-client get $jail logpath)"
done
echo ""

echo "5. Recent Activity (last 10 lines):"
tail -10 /var/log/fail2ban.log
echo ""

echo "=== Verification Complete ==="
