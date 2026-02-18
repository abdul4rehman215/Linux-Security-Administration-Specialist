#!/bin/bash

SSH_ENV="$HOME/.ssh/environment"

start_agent() {
 echo "Initializing new SSH agent..."
 /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
 echo succeeded
 chmod 600 "${SSH_ENV}"
 . "${SSH_ENV}" > /dev/null
 /usr/bin/ssh-add ~/.ssh/id_rsa
}

if [ -f "${SSH_ENV}" ]; then
 . "${SSH_ENV}" > /dev/null
 ps -p ${SSH_AGENT_PID} | grep ssh-agent > /dev/null || {
 start_agent
 }
else
 start_agent
fi
