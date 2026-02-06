eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"
# Silence direnv output
export DIRENV_LOG_FORMAT=""
# Suppress Python warnings only for direnv
eval "$(PYTHONWARNINGS=ignore direnv hook zsh)"
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PGHOST="/var/run/postgresql"
export DOTFILES="$HOME/dotfiles"
export PATH=$PATH:/usr/local/go/bin

# Fix locale settings to prevent perl warnings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load system secrets
source ~/.config/secrets.zsh

# Gemini related parameters
export GOOGLE_GENAI_USE_VERTEXAI=true
export GOOGLE_CLOUD_PROJECT=gdevexponea
export GOOGLE_CLOUD_LOCATION=global

# Terraform related vars
export TFE_PARALLELISM=100
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

# Enable bash completion for Zsh
autoload -Uz +X bashcompinit && bashcompinit
compinit

setopt inc_append_history

# Set up fzf key bindings and fuzzy completion
# source <(fzf --zsh)
eval "$(fzf --zsh)"

# fzf-tab plugin for fzf-powered completions
[ -f "$DOTFILES/zshrc/fzf-tab/fzf-tab.plugin.zsh" ] && source "$DOTFILES/zshrc/fzf-tab/fzf-tab.plugin.zsh"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$HOME/.local/share/omarchy/bin:$PATH"
eval "$(~/.local/bin/mise activate zsh)"

new_tmux () {
  session_dir=$(zoxide query --list | fzf)
  session_name=$(basename "$session_dir")

  if tmux has-session -t $session_name 2>/dev/null; then
    if [ -n "$TMUX" ]; then
      tmux switch-client -t "$session_name"
    else
      tmux attach -t "$session_name"
    fi
    notification="tmux attached to $session_name"
  else
    if [ -n "$TMUX" ]; then
      tmux new-session -d -c "$session_dir" -s "$session_name" && tmux switch-client -t "$session_name"
      notification="new tmux session INSIDE TMUX: $session_name"
    else
      tmux new-session -c "$session_dir" -s "$session_name"
      notification="new tmux session: $session_name"
    fi
  fi

  if [ -s "$session_name" ]; then
    notify-send "$notification"
  fi
}

# Kubectl completion
source <(kubectl completion zsh)

# Helm completion
source <(helm completion zsh)

# Create and enter directory
mkcd() { mkdir -p "$1" && cd "$1"; }

# Extract various archive formats
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;; 
            *.tar.gz)    tar xzf $1     ;; 
            *.bz2)       bunzip2 $1     ;; 
            *.rar)       unrar e $1     ;; 
            *.gz)        gunzip $1      ;; 
            *.tar)       tar xf $1      ;; 
            *.tbz2)      tar xjf $1     ;; 
            *.tgz)       tar xzf $1     ;; 
            *.zip)       unzip $1       ;; 
            *.Z)         uncompress $1  ;; 
            *.7z)        7z x $1        ;; 
            *)     echo "'$1' cannot be extracted via extract()" ;; 
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find and kill process by name
killp() {
    ps aux | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}

# Weather function (requires curl)
weather() {
    curl -s "wttr.in/$1?m"
}


# Source dotfiles for glcloud configuration
[ -f "$DOTFILES/zshrc/gcloud_fzf.zsh" ] && source "$DOTFILES/zshrc/gcloud_fzf.zsh"

# ALIASES
 
# Complex aliases 
[ -f "$DOTFILES/zshrc/aliases.zsh" ] && source "$DOTFILES/zshrc/aliases.zsh"

alias tm=new_tmux

# Neovim bindings
alias vi=nvim
alias vim=nvim

# Standard ls aliases (using eza)
alias ll='eza -la --group-directories-first'
alias tree='eza --tree -la --group-directories-first'
alias glow='glow -w 0 '
alias la='eza -A'
alias l='eza'
alias ls='eza --color=auto'
alias find='fdfind'
# Useful shortcuts
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\n}'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias reload='source ~/.zshrc'
alias zshconfig='${=EDITOR} ~/.zshrc'

# Make commonly mistyped commands work
alias sl='ls'
alias gti='git'
alias gerp='grep'
alias cd..='cd ..'

# Kitty Aliases
alias clip='kitten clipboard'

# export XCURSOR_SIZE=48
# export XCURSOR_THEME="Oxygen_White"
