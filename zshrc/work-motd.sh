#!/bin/bash

# Work MOTD Script for Kitty Terminal
# Clean and minimal display of system info, JIRA tickets, and time tracking

# Colors for JIRA status formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
RESET='\033[0m'
BOLD='\033[1m'

show_system_info() {
    local logo_path="$(dirname "${BASH_SOURCE[0]}")/bloomreach-logo.txt"
    
    if [[ -f "$logo_path" ]]; then
        fastfetch --logo "$logo_path" --logo-color-1 yellow --color-keys yellow --color-title blue --structure "Title:Separator:OS:Host:Kernel:Shell:Terminal:CPU:GPU:Memory:Disk:PublicIP"
    else
        fastfetch --logo none --color-keys yellow --color-title blue --structure "Title:Separator:OS:Host:Kernel:Shell:Terminal:CPU:GPU:Memory:Disk:PublicIP"
    fi
    echo ""
}

show_jira_tickets() {
    echo -e "${CYAN}${BOLD}📋 Your JIRA Tickets${RESET}\n"
    
    # Header
    printf "  ${WHITE}${BOLD}%-12s %-15s %-8s %-12s %s${RESET}\n" "KEY" "STATUS" "PRIORITY" "TYPE" "SUMMARY"
    printf "  ${GRAY}%-12s %-15s %-8s %-12s %s${RESET}\n" "────────────" "───────────────" "────────" "────────────" "─────────────────────────────────────────────"
    
    # Get tickets with extended columns
    local jira_output
    if jira_output=$(jira issue list --assignee="matej.kostros@bloomreach.com" --plain --no-headers --columns="key,summary,status,priority,issuetype" --paginate="0:10" 2>/dev/null); then
        if [[ -z "$jira_output" ]]; then
            echo -e "  ${GREEN}✅ No tickets assigned to you${RESET}\n"
        else
            echo "$jira_output" | while IFS=$'\t' read -r key summary status priority issuetype; do
                [[ -z "$key" ]] && continue
                
                # Color code by status
                local status_color=""
                case "$status" in
                    *"To Do"*|*"TODO"*|*"Open"*|*"Backlog"*) status_color="${RED}" ;;
                    *"In Progress"*|*"PROGRESS"*|*"Review"*|*"Code Review"*) status_color="${YELLOW}" ;;
                    *"Done"*|*"DONE"*|*"Resolved"*|*"Closed"*) status_color="${GREEN}" ;;
                    *"Testing"*|*"QA"*) status_color="${BLUE}" ;;
                    *) status_color="${CYAN}" ;;
                esac
                
                # Color code by priority
                local priority_color=""
                case "$priority" in
                    *"High"*|*"Critical"*|*"Urgent"*) priority_color="${RED}" ;;
                    *"Medium"*|*"Normal"*) priority_color="${YELLOW}" ;;
                    *"Low"*) priority_color="${GREEN}" ;;
                    *) priority_color="${GRAY}" ;;
                esac
                
                # Truncate fields to fit columns
                local truncated_summary="${summary}"
                [[ ${#summary} -gt 45 ]] && truncated_summary="${summary:0:42}..."
                
                local truncated_status="${status}"
                [[ ${#status} -gt 15 ]] && truncated_status="${status:0:12}..."
                
                local truncated_priority="${priority}"
                [[ ${#priority} -gt 8 ]] && truncated_priority="${priority:0:5}..."
                
                local truncated_type="${issuetype}"
                [[ ${#issuetype} -gt 12 ]] && truncated_type="${issuetype:0:9}..."
                
                printf "  ${WHITE}%-12s${RESET} ${status_color}%-15s${RESET} ${priority_color}%-8s${RESET} ${PURPLE}%-12s${RESET} %s\n" \
                    "$key" "$truncated_status" "$truncated_priority" "$truncated_type" "$truncated_summary"
            done
        fi
    else
        echo -e "  ${GRAY}JIRA CLI not available or not configured${RESET}\n"
    fi
    echo ""
}

show_time_tracking() {
    echo -e "${PURPLE}${BOLD}⏰ Time Tracking (This Week)${RESET}\n"
    
    hours report week 2>/dev/null || echo -e "  ${GRAY}Hours utility not available${RESET}\n"
    echo ""
}

main() {
    clear
    show_system_info
    show_jira_tickets
    show_time_tracking
}

# Run if script is executed directly
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main