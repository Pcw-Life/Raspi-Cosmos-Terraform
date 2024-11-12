# GitHub CLI and VS Code extensions setup
resource "null_resource" "vscode_extensions" {
  provisioner "local-exec" {
    command = <<-EOC
      # Install VS Code extensions
      code --install-extension GitHub.github-vscode-extension
      code --install-extension ms-vscode-remote.remote-ssh
      
      # Authenticate GitHub CLI with 1Password
      echo "${var.onepassword_api_key}" | gh auth login --with-token
      
      # Copy zshrc_template from repository to .zshrc
      cp ./zshrc_template ~/.zshrc
      
      # Ensure VS Code loads the copied .zshrc
      echo 'export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"' >> ~/.zshrc
      echo 'source ~/.zshrc' >> ~/.zshrc
    EOC
  }
}