# bashrc_template.tf
# Module to configure and deploy custom .bashrc settings.

variable "bashrc_content" {
  description = "Content for the .bashrc file"
  type        = string
  default     = <<EOT
# Custom .bashrc setup
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Aliases
alias ll='ls -la'
alias gs='git status'
alias gp='git pull'
alias gc='git commit -m'
alias reload_bashrc='source ~/.bashrc'

# Environment variables
export EDITOR='vim'

# Functions
function mkcd() {
  mkdir -p "$1"
  cd "$1"
}

function gstatus() {
  git status
}

function gbranches() {
  git branch -a
}

function gohome() {
  cd ~
}
EOT
}

resource "null_resource" "bashrc_config" {
  provisioner "local-exec" {
    command = <<EOC
      echo "📂 Generating .bashrc configuration..."
      echo "${var.bashrc_content}" > ~/.bashrc
      echo "✅ .bashrc has been configured successfully."
    EOC
  }
}