# Kubernetes Aliases

# General
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias ke='kubectl exec -it'
alias ka='kubectl apply -f'
alias kdf='kubectl delete -f'

# Context
alias kcg='kubectl config get-contexts'
alias kcc='kubectl config current-context'
alias kcu='kubectl config use-context'

# Get Resources
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kns='kubectl get namespaces'

# Get Resources - Wide
alias kpw='kubectl get pods -o wide'
alias ksw='kubectl get services -o wide' # Lists services with IPs

# Get Resources - All Namespaces
alias kpa='kubectl get pods --all-namespaces'
alias ksa='kubectl get services --all-namespaces'
alias kda='kubectl get deployments --all-namespaces'

# Universal Help System - Python-based with auto grid generation
alias khelp="python3 $HOME/dotfiles/zshrc/helper.py khelp"
alias cloudhelp="python3 $HOME/dotfiles/zshrc/helper.py cloudhelp"
alias ghelp="python3 $HOME/dotfiles/zshrc/helper.py cloudhelp"
alias vimhelp="python3 $HOME/dotfiles/zshrc/helper.py vimhelp"
alias vimhelp2="python3 $HOME/dotfiles/zshrc/helper.py vimhelp"
alias vimhelp3="python3 $HOME/dotfiles/zshrc/helper.py vimhelp"
alias vimhelp4="python3 $HOME/dotfiles/zshrc/helper.py vimhelp"
alias kitty_help="python3 $HOME/dotfiles/zshrc/helper.py kitty_help"

# Git with fzf integration - enhanced functions
gsw() {
  local branch
  # Get all local branches sorted by most recent commit date
  # Use fzf with preview showing git log for each branch
  branch=$(git for-each-ref --format='%(refname:short)' refs/heads/ --sort=-committerdate | \
    fzf --height 40% --reverse --border \
        --preview 'git log --oneline --graph --color=always --abbrev-commit --date=relative {}' \
        --preview-window right:50%)
  # Switch to selected branch if one was chosen
  if [[ -n "$branch" ]]; then
    git switch "$branch"
  fi
}

gco() {
  local branch
  # Get all local branches sorted by most recent commit date
  # Use fzf with preview showing git log for each branch
  branch=$(git for-each-ref --format='%(refname:short)' refs/heads/ --sort=-committerdate | \
    fzf --height 40% --reverse --border \
        --preview 'git log --oneline --graph --color=always --abbrev-commit --date=relative {}' \
        --preview-window right:50%)
  # Checkout selected branch if one was chosen
  if [[ -n "$branch" ]]; then
    git checkout "$branch"
  fi
}

mytickets() {
    # Color definitions
    local RED='\033[0;31m'
    local GREEN='\033[0;32m'
    local YELLOW='\033[1;33m'
    local BLUE='\033[1;34m'
    local PURPLE='\033[0;35m'
    local CYAN='\033[0;36m'
    local WHITE='\033[1;37m'
    local GRAY='\033[0;90m'
    local RESET='\033[0m'
    local BOLD='\033[1m'
    local ORANGE='\033[38;5;208m'

    echo -e "${CYAN}${BOLD}📋 Your JIRA Tickets${RESET}\n"

    # Calculate column widths
    local term_width=${COLUMNS:-$(tput cols)}
    local key_width=13
    local status_width=16
    local priority_width=11
    local age_width=8
    local updated_width=8
    local summary_width=$((term_width - key_width - status_width - priority_width - age_width - updated_width - 17))
    [[ $summary_width -lt 30 ]] && summary_width=30

    # Print header
    printf "  ${WHITE}${BOLD}%-${key_width}s %-${status_width}s %-${priority_width}s %-${age_width}s %-${updated_width}s %s${RESET}\n" "KEY" "STATUS" "PRIORITY" "AGE" "UPDATED" "SUMMARY"
    printf "  ${GRAY}%-${key_width}s %-${status_width}s %-${priority_width}s %-${age_width}s %-${updated_width}s %s${RESET}\n" \
        "$(printf '─%.0s' $(seq 1 $key_width))" \
        "$(printf '─%.0s' $(seq 1 $status_width))" \
        "$(printf '─%.0s' $(seq 1 $priority_width))" \
        "$(printf '─%.0s' $(seq 1 $age_width))" \
        "$(printf '─%.0s' $(seq 1 $updated_width))" \
        "$(printf '─%.0s' $(seq 1 $summary_width))"

    # Function to calculate age
    calculate_age() {
        local created_str="$1"
        python3 -c "
from datetime import datetime
try:
    created = datetime.fromisoformat('${created_str}'.replace('Z', '+00:00'))
    now = datetime.now(created.tzinfo)
    delta = now - created
    days = delta.days
    if days < 1:
        print('< 1d')
    elif days < 7:
        print(f'{days}d')
    elif days < 30:
        print(f'{days // 7}w')
    elif days < 365:
        print(f'{days // 30}mo')
    else:
        print(f'{days // 365}y')
except:
    print('N/A')
"
    }

    # Function to format and print a ticket
    print_ticket() {
        local key="$1"
        local ticket_status="$2"
        local priority="$3"
        local created="$4"
        local updated="$5"
        local summary="$6"
        local is_done="$7"

        [[ -z "$key" ]] && return

        local age=$(calculate_age "$created")
        local updated_age=$(calculate_age "$updated")

        # Status color
        local status_color="${RESET}"
        case "$ticket_status" in
            *"To Do"*|*"TODO"*|*"Open"*|*"Backlog"*) status_color="${BLUE}" ;;
            *"In Progress"*|*"PROGRESS"*|*"Review"*|*"Code Review"*) status_color="${PURPLE}" ;;
            *"Done"*|*"DONE"*|*"Resolved"*|*"Closed"*|*"Cancelled"*) status_color="${GRAY}" ;;
            *"Testing"*|*"QA"*) status_color="${CYAN}" ;;
            *) status_color="${WHITE}" ;;
        esac

        # Priority color
        local priority_color="${RESET}"
        if [[ $is_done -eq 1 ]]; then
            case "$priority" in
                *"Critical"*|*"Highest"*) priority_color='\033[38;5;52m' ;;
                *"Major"*|*"High"*) priority_color='\033[38;5;94m' ;;
                *"Minor"*|*"Medium"*) priority_color='\033[38;5;100m' ;;
                *"Normal"*|*"Low"*|*"Lowest"*|*"Trivial"*) priority_color='\033[38;5;22m' ;;
                *) priority_color="${GRAY}" ;;
            esac
        else
            case "$priority" in
                *"Critical"*|*"Highest"*) priority_color="${RED}" ;;
                *"Major"*|*"High"*) priority_color="${ORANGE}" ;;
                *"Minor"*|*"Medium"*) priority_color="${YELLOW}" ;;
                *"Normal"*|*"Low"*|*"Lowest"*|*"Trivial"*) priority_color="${GREEN}" ;;
                *) priority_color="${GRAY}" ;;
            esac
        fi

        # Key, summary, and age colors
        local key_color="${WHITE}"
        local summary_color="${RESET}"
        local age_color="${WHITE}"
        if [[ $is_done -eq 1 ]]; then
            key_color="${GRAY}"
            summary_color="${GRAY}"
            age_color='\033[38;5;240m'
        fi

        # Truncate if needed
        local truncated_summary="${summary}"
        [[ ${#summary} -gt $summary_width ]] && truncated_summary="${summary:0:$((summary_width-3))}..."

        local truncated_status="${ticket_status}"
        [[ ${#ticket_status} -gt $status_width ]] && truncated_status="${ticket_status:0:$((status_width-3))}..."

        local truncated_priority="${priority}"
        [[ ${#priority} -gt $priority_width ]] && truncated_priority="${priority:0:$((priority_width-3))}..."

        # Create clickable link
        local jira_url="https://bloomreach.atlassian.net/browse/${key}"
        printf -v clickable_key "\e]8;;%s\e\\%b%s\e[0m\e]8;;\e\\" "${jira_url}" "${key_color}" "${key}"

        local key_padding=$((key_width - ${#key}))
        local padding=$(printf '%*s' "$key_padding" '')

        printf -v colored_status "%b%-${status_width}s\e[0m" "${status_color}" "${truncated_status}"
        printf -v colored_priority "%b%-${priority_width}s\e[0m" "${priority_color}" "${truncated_priority}"
        printf -v colored_age "%b%-${age_width}s\e[0m" "${age_color}" "${age}"
        printf -v colored_updated "%b%-${updated_width}s\e[0m" "${age_color}" "${updated_age}"
        printf -v colored_summary "%b%s\e[0m" "${summary_color}" "${truncated_summary}"

        printf "  %b%s %b %b %b %b %b\n" "${clickable_key}" "${padding}" "${colored_status}" "${colored_priority}" "${colored_age}" "${colored_updated}" "${colored_summary}"
    }

    # Check if JIRA CLI is available
    if ! command -v jira &>/dev/null; then
        echo -e "  ${GRAY}JIRA CLI not available or not configured${RESET}\n"
        return 1
    fi

    # Fetch active (non-Done, non-Cancelled) tickets ordered by update date
    local active_output
    if active_output=$(jira issue list \
        --jql="assignee = 'matej.kostros@bloomreach.com' AND status NOT IN (Done, Cancelled)" \
        --plain --no-headers \
        --columns="key,status,priority,created,updated,summary" \
        --order-by="updated" \
        --paginate="0:30" \
        --csv 2>/dev/null); then

        if [[ -n "$active_output" ]]; then
            # Process active tickets (already sorted by update date from JIRA)
            echo "$active_output" | while IFS=',' read -r key ticket_status priority created updated rest; do
                # Get everything after the 5th comma as summary (in case summary contains commas)
                local summary=$(echo "$key,$ticket_status,$priority,$created,$updated,$rest" | cut -d',' -f6-)
                print_ticket "$key" "$ticket_status" "$priority" "$created" "$updated" "$summary" 0
            done
        fi
    fi

    # Fetch Done and Cancelled tickets ordered by update date (when they were completed)
    local done_output
    if done_output=$(jira issue list \
        --jql="assignee = 'matej.kostros@bloomreach.com' AND status IN (Done, Cancelled)" \
        --plain --no-headers \
        --columns="key,status,priority,created,updated,summary" \
        --order-by="updated" \
        --paginate="0:10" \
        --csv 2>/dev/null); then

        if [[ -n "$done_output" ]]; then
            # Process Done tickets (already sorted by update date from JIRA)
            echo "$done_output" | while IFS=',' read -r key ticket_status priority created updated rest; do
                # Get everything after the 5th comma as summary (in case summary contains commas)
                local summary=$(echo "$key,$ticket_status,$priority,$created,$updated,$rest" | cut -d',' -f6-)
                print_ticket "$key" "$ticket_status" "$priority" "$created" "$updated" "$summary" 1
            done
        fi
    fi

    # Check if we got any results
    if [[ -z "$active_output" && -z "$done_output" ]]; then
        echo -e "  ${GREEN}✅ No tickets assigned to you${RESET}\n"
    fi

    echo ""
}
