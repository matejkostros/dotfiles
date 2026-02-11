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
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "h, j, k, l" "Move" ":ls" "List buffers" ":b <name>" "Switch buffer"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "w, b" "Forward/Back" ":bd" "Close buffer" ":bnext" "Next buffer"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "e, ge" "End of word" ":new, :vnew" "New split" ":e <file>" "Open file"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "^, $" "Line start/end" "Ctrl-o" "Jump back" "Ctrl-i" "Jump forward"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "gg, G" "File start/end" "{, }" "Jump paragraph" ":e ." "File explorer"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\n" "<num>G" "Go to line" "Ctrl-u/d" "Scroll up/down"

    echo ""
    printf "\033[1;33m%-50s %s\033[0m\n" "# Search & Replace" "# Yank/Delete/Change"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "/pattern" "Search forward" "dw, de, d$" "Delete" "yy, dd" "Yank/Delete"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "?pattern" "Search backward" "diw, daw" "Delete word" "p, P" "Paste aft/bef"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "n, N" "Next/Prev match" "di\", da\"" "Delete quotes" "cw, ce, c$" "Change"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\n" ":s/old/new/" "Replace in line" ":%s/old/new/g" "Replace all"

    echo ""
    printf "\033[1;33m%-50s %s\033[0m\n" "# Visual & Editing" "# Useful Commands"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "v, V, Ctrl-v" "Visual modes" "u, Ctrl-r" "Undo/Redo" "." "Repeat change"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" ">, <" "Indent/Unindent" ":! <cmd>" "Shell command" "q:" "Command hist"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "*" "Search word" ":set paste" "Paste mode" ":help" "Nvim help"

    echo ""
    printf "\033[1;33m%-50s %s\033[0m\n" "# File Navigation" ""
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "Ctrl-p" "File picker" "j, k" "Navigate" "<ldr>fb" "Buffers"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "Ctrl-n" "Explorer toggle" "l, h" "Open/collapse" "<ldr>fg" "Grep files"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\n" "<ldr><ldr>" "Recent files" "Enter/Tab" "Open/Mark"

    echo ""
    printf "\033[1;33m%-50s %s\033[0m\n" "# Gitsigns" ""
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "<leader>a" "Stage hunk" "<leader>n" "Next hunk" "<leader>p" "Prev hunk"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "<leader>u" "Unstage hunk" "<leader>r" "Reset hunk" "<leader>A" "Stage buffer"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %s\n" "<leader>R" "Reset buffer" "<leader>d" "Diff this" "<leader>D" "Diff (index)"
    printf "  \033[1;32m%13s\033[0m → %-15s\033[1;32m%13s\033[0m → %-15s\n" ":Gitsigns blame" "Show blame" ":Gitsigns toggle_..." "Toggle blame"

    echo -e "\n\033[1;34mTip:\033[0m Run \033[1;32mvimhelp\033[0m anytime to see this message again.\n"
}

vimhelp2() {
    echo ""
    # Row 1: Basic Nav | Buffer Mgmt | Search & Replace | Yank/Delete
    printf "\033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m\n" "# Basic Navigation" "# Buffer Management" "# Search & Replace" "# Yank/Delete"
    printf "  \033[1;32m%8s\033[0m → %-18s \033[1;32m%10s\033[0m → %-17s \033[1;32m%13s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "h,j,k,l" "Move" ":ls" "List buffers" "/pattern" "Search fwd" "dw,de,d$" "Delete"
    printf "  \033[1;32m%8s\033[0m → %-18s \033[1;32m%10s\033[0m → %-17s \033[1;32m%13s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "w,b" "Forward/Back" ":bd" "Close buffer" "?pattern" "Search back" "diw,daw" "Delete word"
    printf "  \033[1;32m%8s\033[0m → %-18s \033[1;32m%10s\033[0m → %-17s \033[1;32m%13s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "e,ge" "End of word" ":bnext" "Next buffer" "n,N" "Next/Prev" "di\",da\"" "Delete quotes"
    printf "  \033[1;32m%8s\033[0m → %-18s \033[1;32m%10s\033[0m → %-17s \033[1;32m%13s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "^,\$" "Line start/end" ":b <name>" "Switch buffer" "*" "Search word" "yy,dd" "Yank/Delete"
    printf "  \033[1;32m%8s\033[0m → %-18s \033[1;32m%10s\033[0m → %-17s \033[1;32m%13s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "gg,G" "File start/end" ":new,:vnew" "New split" ":s/old/new/" "Replace line" "p,P" "Paste aft/bef"
    printf "  \033[1;32m%8s\033[0m → %-18s \033[1;32m%10s\033[0m → %-17s \033[1;32m%13s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "<num>G" "Go to line" ":e <file>" "Open file" ":%s/old/new/g" "Replace all" "cw,ce,c$" "Change"
    printf "  \033[1;32m%8s\033[0m → %-18s \033[1;32m%10s\033[0m → %-17s \033[1;32m%13s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "{,}" "Jump paragraph" "Ctrl-o" "Jump back" "" "" "u,Ctrl-r" "Undo/Redo"
    printf "  \033[1;32m%8s\033[0m → %-18s \033[1;32m%10s\033[0m → %-17s \033[1;32m%13s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "Ctrl-u/d" "Scroll up/down" "Ctrl-i" "Jump forward" "" "" "." "Repeat change"

    echo ""
    # Row 2: Visual & Tools | File Navigation | Gitsigns | LSP Navigation
    printf "\033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m\n" "# Visual & Tools" "# File Navigation" "# Gitsigns" "# LSP Navigation"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%9s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "v,V,C-v" "Visual modes" "Ctrl-p" "File picker" "<leader>a" "Stage hunk" "<leader>gd" "Go to def"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%9s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" ">,<" "Indent/Unindent" "Ctrl-n" "Explorer toggle" "<leader>u" "Unstage hunk" "<leader>gr" "References"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%9s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "*" "Search word" "<ldr><sp>" "Recent files" "<leader>r" "Reset hunk" "K" "Hover info"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%9s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" ":set paste" "Paste mode" "j,k" "Navigate" "<leader>n" "Next hunk" "<ldr>rn" "Rename refs"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%9s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "q:" "Command history" "l,h" "Open/collapse" "<leader>p" "Prev hunk" "<leader>ca" "Code action"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%9s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" ":! <cmd>" "Shell command" "Enter/Tab" "Open/Mark" "<leader>A" "Stage buffer" "[d/]d" "Prev/Next err"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%9s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" ":help" "Nvim help" "<ldr>fb" "Buffers" "<leader>R" "Reset buffer" "<leader>e" "Show error"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%9s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "." "Repeat change" "<ldr>fg" "Grep files" "<leader>d" "Diff this" "<leader>gf" "Format"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%9s\033[0m → %-16s \033[1;32m%8s\033[0m → %s\n" "" "" ":e ." "File explorer" "<leader>D" "Diff (index)" "" ""

    echo -e "\n\033[1;34mTip:\033[0m Run \033[1;32mvimhelp2\033[0m anytime to see this message again.\n"
}

vimhelp3() {
    echo ""
    # Row 1: File Discovery | Navigation & LSP | Editing Workflow
    printf "\033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m\n" "# File Discovery" "# Navigation & LSP" "# Editing Workflow"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %s\n" ":e ." "Open dir explorer" "Ctrl-o" "Jump back" "dw,de,d$" "Delete word"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %s\n" "Ctrl-p" "Fuzzy find files" "Ctrl-i" "Jump forward" "cw,ce,c$" "Change word"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %s\n" "Ctrl-n" "Toggle explorer" "<ldr>gd" "Go to definition" "gcc" "Toggle comment"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %s\n" "<ldr>fg" "Grep search" "<ldr>gr" "Find references" "gc{motion}" "Comment block"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %s\n" "<ldr><ldr>" "Recent files" "K" "Hover info" "yy,dd" "Yank/Delete"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %s\n" "j,k" "Navigate tree" "<ldr>rn" "Rename references" "p,P" "Paste"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %s\n" "<ldr>fb" "Buffer list" "<ldr>ca" "Code action" "u,Ctrl-r" "Undo/Redo"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %s\n" "l,h,Enter" "Open/expand" "]d/[d" "Next/Prev error" ":%s/old/new/g" "Replace all"

    echo ""
    # Row 2: Lazygit | Gitsigns
    printf "\033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m\n" "# Lazygit" "# Gitsigns"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %s\n" "<ldr>lg" "Open lazygit" "<ldr>a" "Stage hunk"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %s\n" "c" "Commit" "<ldr>u" "Unstage hunk"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %s\n" "p" "Push" "<ldr>r" "Reset hunk"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %s\n" "P" "Pull" "<ldr>n" "Next hunk"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %s\n" "l" "View log" "<ldr>p" "Prev hunk"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %s\n" "e" "Edit commit" "<ldr>A" "Stage buffer"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %s\n" "b" "Browse commit" "<ldr>R" "Reset buffer"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %s\n" "r" "Rebase branch" "<ldr>d" "Diff hunk"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %s\n" "m" "Merge branch" "" ""

    echo -e "\n\033[1;34mTip:\033[0m Run \033[1;32mvimhelp3\033[0m anytime to see this message again.\n"
}

vimhelp4() {
    echo ""
    # Row 1: File Discovery | Navigation & LSP | Editing Workflow | Editing Workflow 2
    printf "\033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m\n" "# File Discovery" "# Navigation & LSP" "# Editing Workflow" "# Editing Workflow 2"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "-" "Open dir explorer" "Ctrl-o" "Jump back" "dw,de,d$" "Delete word" "<num>G" "Go to line"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "Ctrl-p" "Fuzzy find files" "Ctrl-i" "Jump forward" "cw,ce,c$" "Change word" "{,}" "Jump paragraph"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "Ctrl-n" "Toggle explorer" "<ldr>gd" "Go to definition" "gcc" "Toggle comment" "Ctrl-u/d" "Scroll up/down"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "<ldr>fg" "Grep search" "<ldr>gr" "Find references" "gc{motion}" "Comment block" "*" "Search word"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "<ldr><ldr>" "Recent files" "K" "Hover info" "yy,dd" "Yank/Delete" ">,<" "Indent"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "j,k" "Navigate tree" "<ldr>rn" "Rename references" "p,P" "Paste" ":s/old/new/" "Replace line"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "<ldr>fb" "Buffer list" "<ldr>ca" "Code action" "u,Ctrl-r" "Undo/Redo" ":%s/old/new/g" "Replace all"
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "l,h,Enter" "Open/expand" "]d/[d" "Next/Prev error" "." "Repeat command" "J" "Join lines"

    echo ""
    # Row 2: Lazygit | Gitsigns | Split Management | Buffer Management
    printf "\033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m\n" "# Lazygit" "# Gitsigns" "# Split Management" "# Buffer Management"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %-16s \033[1;32m%9s\033[0m → %-16s \033[1;32m%9s\033[0m → %s\n" "<ldr>lg" "Open lazygit" "<ldr>a" "Stage hunk" ":split" "Horizontal split" "<ldr>fb" "Browse buffers"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %-16s \033[1;32m%9s\033[0m → %-16s \033[1;32m%9s\033[0m → %s\n" "c" "Commit" "<ldr>u" "Unstage hunk" ":vsplit" "Vertical split" "<ldr>bn" "Next buffer"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %-16s \033[1;32m%9s\033[0m → %-16s \033[1;32m%9s\033[0m → %s\n" "p" "Push" "<ldr>r" "Reset hunk" "C-h/j/k/l" "Navigate between" "<ldr>bp" "Prev buffer"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %-16s \033[1;32m%9s\033[0m → %-16s \033[1;32m%9s\033[0m → %s\n" "P" "Pull" "<ldr>n" "Next hunk" "C-w r/R" "Rotate splits" "<ldr>bd" "Delete buffer"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %-16s \033[1;32m%9s\033[0m → %-16s \033[1;32m%9s\033[0m → %s\n" "l" "View log" "<ldr>p" "Prev hunk" "C-w c" "Close split" "<ldr>sf" "Scratch toggle"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %-16s \033[1;32m%9s\033[0m → %-16s \033[1;32m%9s\033[0m → %s\n" "e" "Edit commit" "<ldr>A" "Stage buffer" "C-w o" "Close other" "<ldr>nb" "New buffer"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %-16s \033[1;32m%9s\033[0m → %-16s \033[1;32m%9s\033[0m → %s\n" "b" "Browse commit" "<ldr>R" "Reset buffer" "C-w =" "Equal size" "<ldr>b#" "Alternate buffer"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %-16s \033[1;32m%9s\033[0m → %-16s \033[1;32m%9s\033[0m → %s\n" "r" "Rebase branch" "<ldr>d" "Diff hunk" "C-w +/-" "Adjust height" ":bufdo" "Apply to all"
    printf "  \033[1;32m%9s\033[0m → %-16s   \033[1;32m%8s\033[0m → %-16s \033[1;32m%9s\033[0m → %-16s \033[1;32m%9s\033[0m → %s\n" "m" "Merge branch" "<ldr>D" "Diff (index)" "C-w >/<" "Adjust width" "dd" "Delete in picker"

    echo ""
    # Row 3: Object Operations | Text Transformations
    printf "\033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m \033[1;33m%-31s\033[0m\n" "# Object Operations" "# Text Transformations" "" ""
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "d,c,y,v" "<op>" "<ldr>tl" ":TrimLeading" "" "" "" ""
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "<op>iw,aw" "Word" "<ldr>tt" ":TrimTrailing" "" "" "" ""
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "<op>i{,a{" "Braces" "<ldr>ta" ":TrimAll" "" "" "" ""
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "<op>i[,a[" "Brackets" "<ldr>cs" ":CollapseSpaces" "" "" "" ""
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "<op>i(,a(" "Parens" "<ldr>uc" ":ToUpperCase" "" "" "" ""
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "<op>i\",a\"" "Quotes" "<ldr>lc" ":ToLowerCase" "" "" "" ""
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "<op>ip,ap" "Paragraph" "<ldr>tq" ":ToggleQuotes" "" "" "" ""
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "<op>is,as" "Sentence" "<ldr>b64e" ":Base64Encode" "" "" "" ""
    printf "  \033[1;32m%10s\033[0m → %-16s \033[1;32m%11s\033[0m → %-17s \033[1;32m%11s\033[0m → %-16s \033[1;32m%11s\033[0m → %s\n" "<op>it,at" "HTML/XML tags" "<ldr>b64d" ":Base64Decode" "" "" "" ""

    echo -e "\n\033[1;34mTip:\033[0m Run \033[1;32mvimhelp4\033[0m anytime to see this message again.\n"
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
