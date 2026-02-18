#### Directory - /usr/local/bin/

#!/bin/bash
echo "Test application starting..."
whoami
date
ls /home/
echo "Test application finished."

#include <tunables/global>

/usr/local/bin/test-app.sh {
 #include <abstractions/base>
 #include <abstractions/bash>

 /usr/local/bin/test-app.sh r,
 /bin/bash ix,
 /usr/bin/whoami ix,
 /bin/date ix,
 /bin/ls ix,
 /home/ r,
 /home/*/ r,
}

Added:
cat /etc/passwd
Updated script:
#!/bin/bash
echo "Test application starting..."
whoami
date
ls /home/
echo "Attempting restricted access..."
cat /etc/shadow
cat /etc/passwd
echo "Test application finished."
