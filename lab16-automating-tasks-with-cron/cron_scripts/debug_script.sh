#!/bin/bash
# Debug script for troubleshooting

DEBUG_LOG="$HOME/cron_logs/debug.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "$DATE: Debug script started" >> $DEBUG_LOG
echo "$DATE: Current PATH: $PATH" >> $DEBUG_LOG
echo "$DATE: Current USER: $USER" >> $DEBUG_LOG
echo "$DATE: Current PWD: $PWD" >> $DEBUG_LOG
echo "$DATE: Home directory: $HOME" >> $DEBUG_LOG
echo "----------------------------------------" >> $DEBUG_LOG
