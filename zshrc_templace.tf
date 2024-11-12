# Add Visual Studio Code to PATH
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

# Setup Zsh Completions and Enable Them
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -U compinit
compinit

# Enable Zsh Plugins
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Adjust Colors for Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Customize colors for tabs
ZSH_HIGHLIGHT_STYLES[default]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[bracket]=fg=cyan,bold

# Load Oh My Posh with the theme "atomic"
eval "$(oh-my-posh init zsh --config /opt/homebrew/opt/oh-my-posh/themes/atomic.omp.json)"

# Source 1Password Plugins
source /Users/pcwprops/.config/op/plugins.sh

# Enable fzf history search with Ctrl+R (Zsh-compatible)
export FZF_DEFAULT_COMMAND='history -n 1 | cut -c 8-'
export FZF_CTRL_R_OPTS='--height 40% --border'
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^R' up-line-or-beginning-search

# Aliases
alias ll='ls -la'
alias gs='git status'
alias gp='git pull'
alias gc='git commit -m'

# Environment Variables
export EDITOR='code'
export NODE_ENV='development'

# Custom Functions
function mkcd() {
    mkdir -p "$1"
    cd "$1"
}

function proj() {
    cd ~/projects/"$1"
}

function copen() {
    code .
}

function fsearch() {
    find . -name "$1"
}

function vcat() {
    bat "$1"
}

function brewup() {
    brew update && brew upgrade && brew cleanup
}

function gacp() {
    git add .
    git commit -m "$1"
    git push
}

function vopen() {
    vim "$1"
}

function gstatus() {
    git status
}

function gpull() {
    git pull
}

function gbranches() {
    git branch -a
}

function gohome() {
    cd ~
}

function search() {
    grep -rnw '.' -e "$1"
}

function dusage() {
    du -sh *
}

function editzshrc() {
    code ~/.zshrc
}

# Function to list all aliases and functions
function list_aliases_functions() {
    echo "Aliases:"
    alias
    echo
    echo "Functions:"
    declare -f | grep '^[a-zA-Z_][a-zA-Z0-9_]* ()'
}
function reloadzshrc() {
    source ~/.zshrc
}