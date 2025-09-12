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

khelp() {
    echo -e "\n\033[1;34m☸️  Kubernetes Aliases\033[0m\n"

    echo -e "\033[1;33m# General\033[0m"
    echo -e "  \033[1;32mk\033[0m           → kubectl"
    echo -e "  \033[1;32mkg\033[0m          → kubectl get"
    echo -e "  \033[1;32mkd\033[0m          → kubectl describe"
    echo -e "  \033[1;32mkl\033[0m          → kubectl logs"
    echo -e "  \033[1;32mklf\033[0m         → kubectl logs -f"
    echo -e "  \033[1;32mke\033[0m          → kubectl exec -it"
    echo -e "  \033[1;32mka\033[0m          → kubectl apply -f"
    echo -e "  \033[1;32mkdf\033[0m         → kubectl delete -f\n"

    echo -e "\033[1;33m# Context\033[0m"
    echo -e "  \033[1;32mkcg\033[0m         → kubectl config get-contexts"
    echo -e "  \033[1;32mkcc\033[0m         → kubectl config current-context"
    echo -e "  \033[1;32mkcu\033[0m         → kubectl config use-context\n"

    echo -e "\033[1;33m# Get Resources\033[0m"
    echo -e "  \033[1;32mkgp\033[0m         → kubectl get pods"
    echo -e "  \033[1;32mkgs\033[0m         → kubectl get services"
    echo -e "  \033[1;32mkgd\033[0m         → kubectl get deployments"
    echo -e "  \033[1;32mkgn\033[0m         → kubectl get nodes"
    echo -e "  \033[1;32mkns\033[0m         → kubectl get namespaces\n"

    echo -e "\033[1;33m# Get Resources - Wide\033[0m"
    echo -e "  \033[1;32mkpw\033[0m         → kubectl get pods -o wide"
    echo -e "  \033[1;32mksw\033[0m         → kubectl get services -o wide\n"

    echo -e "\033[1;33m# Get Resources - All Namespaces\033[0m"
    echo -e "  \033[1;32mkpa\033[0m         → kubectl get pods --all-namespaces"
    echo -e "  \033[1;32mksa\033[0m         → kubectl get services --all-namespaces"
    echo -e "  \033[1;32mkda\033[0m         → kubectl get deployments --all-namespaces\n"

    echo -e "\n\033[1;34mTip:\033[0m Run \033[1;32mkhelp\033[0m anytime to see this message again.\n"
}

vimhelp() {
    echo -e "\n\033[1;34m📝 Nvim Help\033[0m\n"
    
    printf "\033[1;33m%-50s %s\033[0m\n" "# Basic Navigation" "# Buffer Management"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "h, j, k, l" "Left/Down/Up/Right" ":ls" "List all buffers"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "w, b" "Forward/Back word" ":b <name>" "Switch to buffer"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "e, ge" "End of word" ":bd" "Close buffer"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "^, $" "Start/End line" ":bnext, :bprev" "Next/Prev buffer"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "gg, G" "Start/End file" ":new, :vnew" "New split buffer"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "<num>G" "Go to line" ":e <file>" "Open file"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "{, }" "Jump paragraph" ":e ." "File explorer"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl-o, Ctrl-i" "Jump back/fwd" "" ""
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl-u, Ctrl-d" "Scroll up/down" "" ""
    
    echo ""
    printf "\033[1;33m%-50s %s\033[0m\n" "# Search & Replace" "# Yank/Delete/Change"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "/pattern, ?pattern" "Search fwd/back" "dw, de, d$" "Delete word/end/line"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "n, N" "Next/Prev match" "diw, daw" "Delete in/around word"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "*" "Search word" "di\", da\"" "Delete in/around quotes"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" ":s/old/new/" "Replace in line" "dt<char>, df<char>" "Delete till/to char"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" ":s/old/new/g" "Replace all line" "yy, dd" "Yank/Delete line"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" ":%s/old/new/g" "Replace all file" "p, P" "Paste after/before"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" ":%s/old/new/gc" "Replace w/ confirm" "cw, ce, c$" "Change word/end/line"
    
    echo ""
    printf "\033[1;33m%-50s %s\033[0m\n" "# Visual & Editing" "# Useful Commands"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "v, V, Ctrl-v" "Visual modes" "u, Ctrl-r" "Undo/Redo"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" ">, <" "Indent/Unindent" "." "Repeat last change"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl-p, Ctrl-n" "Autocomplete" ":! <cmd>" "Execute shell cmd"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" ":set number" "Show line nums" ":r !<cmd>" "Read cmd output"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" ":set relativenumber" "Relative nums" ":set paste" "Paste mode"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "q:" "Command history" ":help" "Nvim help"

    echo ""
    printf "\033[1;33m%s\033[0m\n" "# Gitsigns"
    printf "  \033[1;32m%-46s\033[0m → %s\n" "<leader>a" "Stage hunk"
    printf "  \033[1;32m%-46s\033[0m → %s\n" "<leader>n" "Next hunk"
    printf "  \033[1;32m%-46s\033[0m → %s\n" "<leader>p" "Previous hunk"
    printf "  \033[1;32m%-46s\033[0m → %s\n" "<leader>u" "Unstage hunk"
    printf "  \033[1;32m%-46s\033[0m → %s\n" "<leader>r" "Reset hunk"
    printf "  \033[1;32m%-46s\033[0m → %s\n" "<leader>A" "Stage buffer"
    printf "  \033[1;32m%-46s\033[0m → %s\n" "<leader>R" "Reset buffer"
    printf "  \033[1;32m%-46s\033[0m → %s\n" "<leader>d" "Diff this"
    printf "  \033[1;32m%-46s\033[0m → %s\n" "<leader>D" "Diff this (index)"
    printf "  \033[1;32m%-46s\033[0m → %s\n" ":Gitsigns toggle_current_line_blame" "Toggle inline blame"
    printf "  \033[1;32m%-46s\033[0m → %s\n" ":Gitsigns blame" "Show blame info in popup"
    

    echo -e "\n\033[1;34mTip:\033[0m Run \033[1;32mvimhelp\033[0m anytime to see this message again.\n"
}

thelp() {
    echo -e "\n\033[1;34m🪟 Tmux Help\033[0m\n"
    
    printf "\033[1;33m%-50s %s\033[0m\n" "# Session Management" "# Windows (Tabs)"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "tm" "Start/attach session" "Ctrl+a c" "Create new window"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "tmux ls" "List sessions" "Ctrl+a ," "Rename window"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a d" "Detach session" "Ctrl+a &" "Kill window"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a $" "Rename session" "Ctrl+a n" "Next window"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "tmux kill-session -t <name>" "Kill session" "Ctrl+a p" "Previous window"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "" "" "Ctrl+a 0-9" "Select window by number"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "" "" "Ctrl+a w" "Window list picker"
    
    echo ""
    printf "\033[1;33m%-50s %s\033[0m\n" "# Panes (Splits)" "# Copy Mode & Selection"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a %" "Vertical split" "Ctrl+a [" "Enter copy mode"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a \"" "Horizontal split" "Space" "Start selection"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a h/j/k/l" "Navigate panes" "Enter" "Copy selection"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a q" "Show pane numbers" "q" "Exit copy mode"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a x" "Kill current pane" "Shift+mouse" "Bypass tmux selection"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a z" "Zoom/unzoom pane" "Ctrl+a ]" "Paste"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a o" "Switch to next pane" "" ""
    
    echo ""
    printf "\033[1;33m%-50s %s\033[0m\n" "# Useful Commands" "# Mouse Tips"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a ?" "Show all keybinds" "Click" "Switch panes"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a r" "Reload config" "Double-click" "Select word"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a :" "Command prompt" "Drag" "Resize panes"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "Ctrl+a t" "Show clock" "Wheel" "Scroll history"
    printf "  \033[1;32m%-28s\033[0m → %-18s \033[1;32m%-28s\033[0m → %s\n" "exit" "Close pane/window" "Right-click" "Context menu"
    
    echo -e "\n\033[1;90mPrefix key: Ctrl+a (common tmux standard)\033[0m"
    echo -e "\033[1;90mFor text selection across splits: Hold Shift while selecting\033[0m"
    echo -e "\n\033[1;34mTip:\033[0m Run \033[1;32mthelp\033[0m anytime to see this message again.\n"
}

kitty_help() {
    echo -e "\n\033[1;34m^..^ Kitty Keybindings\033[0m\n"
    
    printf "\033[1;33m%-50s %s\033[0m\n" "# Tabs" "# Windows"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+t" "New tab" "ctrl+shift+enter" "New window"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+q" "Close tab" "ctrl+shift+w" "Close window"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+right/left" "Next/Prev tab" "ctrl+shift+]/[" "Next/Prev window"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+./," "Move tab" "ctrl+shift+f/b" "Move window"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+alt+t" "Set tab title" "ctrl+shift+1..0" "Focus window"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "super+shift+1..9" "Switch to tab" "ctrl+shift+n" "New OS window"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+l" "Next layout" "" ""
    
    echo ""
    printf "\033[1;33m%-50s %s\033[0m\n" "# Scrolling" "# Clipboard & Utils"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+up/down" "Line scroll" "ctrl+shift+c/v" "Copy/Paste"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+page up/down" "Page scroll" "ctrl+shift+s" "Paste from selection"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+home/end" "Top/Bottom" "ctrl+shift+o" "Pass selection to program"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+h" "Show scrollback" "ctrl+shift+e" "Open URL"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+p>f" "Show last cmd output" "ctrl+shift+u" "Input Unicode char"
    
    echo ""
    printf "\033[1;33m%-50s %s\033[0m\n" "# Font & Display" "# System & Config"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+=/minus" "Font size" "ctrl+shift+f1" "Show help"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+backspace" "Reset font" "ctrl+shift+f2" "Edit config"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+f11" "Fullscreen" "ctrl+shift+f5" "Reload config"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+f10" "Toggle maximized" "ctrl+shift+f6" "Debug config"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+r" "Resize window" "ctrl+shift+delete" "Reset terminal"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "" "" "ctrl+shift+escape" "Kitty shell"
    
    echo ""
    printf "\033[1;33m%-50s %s\033[0m\n" "# Transparency Controls" "# Splits"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+a>m" "More transparent" "ctrl+shift+;" "Create split"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+a>l" "Less transparent" "ctrl+shift+'" "Next split"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+a>1" "Full opacity" "ctrl+shift+alt+;" "Close split"
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "ctrl+shift+a>d" "Default opacity" "" ""
    printf "  \033[1;32m%-28s\033[0m → %-15s   \033[1;32m%-28s\033[0m → %s\n" "" "(0.90)" "" ""
    
    echo -e "\n\033[1;90mLayouts: Fat, Grid, Horizontal, Splits, Stack, Tall, Vertical\033[0m"
    echo -e "\n\033[1;34mTip:\033[0m Run \033[1;32mkitty_help\033[0m anytime to see this message again.\n"
}
