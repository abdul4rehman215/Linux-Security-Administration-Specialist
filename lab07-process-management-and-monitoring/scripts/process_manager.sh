#!/bin/bash
# Comprehensive process management toolkit

show_menu() {
 echo "=== Process Management Toolkit ==="
 echo "1. Show all processes"
 echo "2. Show processes by user"
 echo "3. Show top CPU processes"
 echo "4. Show top memory processes"
 echo "5. Kill process by PID"
 echo "6. Kill processes by name"
 echo "7. Change process priority"
 echo "8. Monitor process in real-time"
 echo "9. Exit"
 echo -n "Choose an option: "
}

show_all_processes() {
 echo "All running processes:"
 ps aux | head -20
}

show_user_processes() {
 echo -n "Enter username: "
 read username
 ps -u "$username" 2>/dev/null || echo "User not found or no processes"
}

show_top_cpu() {
 echo "Top 10 CPU consuming processes:"
 ps aux --sort=-%cpu | head -11
}

show_top_memory() {
 echo "Top 10 memory consuming processes:"
 ps aux --sort=-%mem | head -11
}

kill_by_pid() {
 echo -n "Enter PID to kill: "
 read pid
 if kill "$pid" 2>/dev/null; then
  echo "Process $pid terminated successfully"
 else
  echo "Failed to kill process $pid"
 fi
}

kill_by_name() {
 echo -n "Enter process name: "
 read pname
 if pkill "$pname"; then
  echo "Processes matching '$pname' terminated"
 else
  echo "No processes found matching '$pname'"
 fi
}

change_priority() {
 echo -n "Enter PID: "
 read pid
 echo -n "Enter new nice value (-20 to 19): "
 read nice_val
 if renice "$nice_val" "$pid" 2>/dev/null; then
  echo "Priority changed successfully"
 else
  echo "Failed to change priority"
 fi
}

monitor_realtime() {
 echo "Starting real-time monitoring (press 'q' to quit)..."
 sleep 2
 top
}

while true; do
 show_menu
 read choice
 echo

 case $choice in
 1) show_all_processes ;;
 2) show_user_processes ;;
 3) show_top_cpu ;;
 4) show_top_memory ;;
 5) kill_by_pid ;;
 6) kill_by_name ;;
 7) change_priority ;;
 8) monitor_realtime ;;
 9) echo "Goodbye!"; exit 0 ;;
 *) echo "Invalid option" ;;
 esac

 echo
 echo "Press Enter to continue..."
 read
 clear
done
