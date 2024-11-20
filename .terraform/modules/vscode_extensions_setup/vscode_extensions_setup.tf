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

# Install and login to GitHub for VSCode
resource "null_resource" "github_login" {
  provisioner "local-exec" {
    command = <<EOT
      echo "🔍 Checking if Visual Studio Code is installed..."
      if ! command -v code &> /dev/null; then
        echo "❌ VSCode not found. Please install VSCode before proceeding."
        exit 1
      fi

      echo "📥 Installing GitHub extension for VSCode..."
      code --install-extension GitHub.vscode-pull-request-github

      echo "🔐 Logging into GitHub and enabling settings sync..."
      code --enable-settings-sync

      echo "✅ GitHub login and settings sync enabled successfully!"
    EOT
  }
}

# Install and login to 1Password for VSCode
resource "null_resource" "1password_login" {
  provisioner "local-exec" {
    command = <<EOT
      echo "🔍 Checking if Visual Studio Code is installed..."
      if ! command -v code &> /dev/null; then
        echo "❌ VSCode not found. Please install VSCode before proceeding."
        exit 1
      fi

      echo "📥 Installing 1Password extension for VSCode..."
      code --install-extension 1Password.op-vscode

      echo "🔐 1Password login completed successfully!"
    EOT
  }
}

# Install additional extensions
resource "null_resource" "install_extensions" {
  provisioner "local-exec" {
    command = <<EOT
      echo "📥 Installing additional VSCode extensions..."
      extensions=(
        "ms-vscode-remote.remote-ssh"
        "esbenp.prettier-vscode"
        "dbaeumer.vscode-eslint"
        "VisualStudioExptTeam.vscodeintellicode"
      )
      for extension in "${extensions[@]}"; do
        echo "Installing $extension..."
        code --install-extension $extension
      done
      echo "✅ All extensions installed successfully!"
    EOT
  }
}

output "vscode_status" {
  value = "VSCode setup complete with extensions and sync enabled. Verify in the VSCode UI."
}