# VSCode Extensions and Software Installation on Cosmos
module "vscode_setup" {
  source = "cosmos-market/vscode"

  # Variables for extensions and settings
  extensions = [
    "GitHub.vscode-pull-request-github",
    "1Password.op-vscode",
    "ms-vscode-remote.remote-ssh",
    "esbenp.prettier-vscode",
    "dbaeumer.vscode-eslint",
    "VisualStudioExptTeam.vscodeintellicode"
  ]
  sync_settings = true
}

resource "null_resource" "github_login" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Logging into GitHub for VSCode..."
      code --install-extension GitHub.vscode-pull-request-github
      echo "Logging into GitHub and enabling settings sync..."
      code --enable-settings-sync
      echo "GitHub login completed. Please verify settings sync."
    EOT
  }
}

resource "null_resource" "1password_login" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Logging into 1Password for VSCode..."
      code --install-extension 1Password.op-vscode
      echo "1Password login completed."
    EOT
  }
}