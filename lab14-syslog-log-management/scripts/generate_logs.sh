#!/bin/bash

for i in {1..100}; do
 echo "$(date): Application log entry $i - Normal operation" | sudo tee -a /var/log/testapp/application.log > /dev/null
 echo "$(date): Access log entry $i - User accessed resource" | sudo tee -a /var/log/testapp/access.log > /dev/null
 if [ $((i % 10)) -eq 0 ]; then
  echo "$(date): Error log entry $((i/10)) - Minor error occurred" | sudo tee -a /var/log/testapp/error.log > /dev/null
 fi
done
