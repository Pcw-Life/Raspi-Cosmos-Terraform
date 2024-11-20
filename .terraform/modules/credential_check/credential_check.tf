# Credential Check Module for 1Password

variable "onepassword_vault_name" {
  type        = string
  description = "The 1Password vault to check for required credentials"
  default     = "PCWProps"
}

variable "required_services" {
  type = map(object({
    item_name      = string
    username_key   = string
    password_key   = string
    email_key      = string
    api_token_key  = string
    ssh_key_key    = string
    login_url_key  = string
  }))
  description = "Required credentials for each service with expected 1Password fields"
}

resource "null_resource" "credential_check" {
  provisioner "local-exec" {
    command = <<EOT
      echo "🔍 Starting credential check for 1Password vault '${var.onepassword_vault_name}'..."

      # Verify 1Password CLI is installed
      if ! command -v op &> /dev/null; then
        echo "❌ 1Password CLI is not installed. Please install it to continue."
        exit 1
      fi

      # Authenticate to 1Password if not already authenticated
      if ! op account list &> /dev/null; then
        echo "🔑 You are not logged into 1Password. Initiating login..."
        op signin
      else
        echo "✅ 1Password authenticated."
      fi

      # Loop through required services and check credentials
      for service in $(echo "${!var.required_services[@]}"); do
        item_name="${var.required_services[$service].item_name}"
        echo "🔍 Checking credentials for service: $service (Item: $item_name)..."

        if ! op item get "$item_name" --vault="${var.onepassword_vault_name}" &> /dev/null; then
          echo "❌ Missing item: $item_name"
          echo "Let's create this item interactively."
          echo "Enter the following details for $service:"

          read -p "Username (if applicable): " username
          read -p "Password (if applicable): " password
          read -p "Email (if applicable): " email
          read -p "API Token (if applicable): " api_token
          read -p "SSH Key Path (if applicable): " ssh_key_path

          if [ -n "$ssh_key_path" ] && [ -f "$ssh_key_path" ]; then
            ssh_key=$(cat "$ssh_key_path")
          else
            ssh_key=""
          fi

          op item create login \
            --title="$item_name" \
            --vault="${var.onepassword_vault_name}" \
            --username="$username" \
            --password="$password" \
            --url="https://placeholder-url.com" \
            --notes="Email: $email, API Token: $api_token, SSH Key: $ssh_key"
          echo "✅ Credential '$item_name' created."
        else
          echo "✅ Found item: $item_name"
        fi
      done

      echo "🎉 Credential check complete!"
    EOT
  }
}