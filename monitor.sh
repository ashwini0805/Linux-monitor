#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[1;33'
NC='\033[0m'


while true
do 
    clear
    echo -e "${GREEN} ==== LINUX SYSTEMMONITOR ====${NC}"
    echo "-----------------------------"
 
    echo ""
    echo "${GREEN}System Uptime:{GREEN}$"
   uptime
 
    echo ""
    echo -e "${RED}Logged-in Users:${RED}"
    who
    
    echo ""
    echo -e "${YELLOW} CPU Usage: ${NC}"
    top -bn1 | grep "Cpu(s)"
    free -h

    echo ""
    echo -e "${BLUE}Disk Usage: ${BLUE}"
    df -h
  
    echo ""
    echo "Top 5 processes (by CPU):"
    ps -eo pid,ppid,s=cmd,%mem,%cpu --sort=-%cpu | head -n 6
    read -t 5 -n 1 key
    if [[$key == "q" || $key == "Q" ]]; then
       echo "Exiting monitor.."
       break
    fi
    sleep 5
done
