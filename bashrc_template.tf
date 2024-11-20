# Bashrc Template for Terminal Setup
module "bashrc_template" {
  source = "./local/bashrc"

  # Variables
  user_config_path = "~/.bashrc"
  content = <<EOT
    # Add Visual Studio Code to PATH
    export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

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

    function copen() {
        code .
    }

    function brewup() {
        brew update && brew upgrade && brew cleanup
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

    function editbashrc() {
        code ~/.bashrc
    }

    function reloadbashrc() {
        source ~/.bashrc
    }
  EOT
}