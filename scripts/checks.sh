
#!/bin/bash

# Define all software packages and their required fields
declare -A SOFTWARE_PACKAGES
SOFTWARE_PACKAGES=(
  ["1password-cli"]="cli_path,cli_version"
  ["github-cli"]="github_username,github_personal_access_token,ssh_private_key,ssh_public_key"
  ["docker"]="docker_username,docker_password,docker_api_key"
  ["cloudflare"]="cloudflare_email,cloudflare_api_token,cloudflare_zone_id"
  ["1password-connect"]="op_connect_host,op_connect_token"
  ["terraform"]="terraform_version,terraform_access_token"
  ["cosmos-cloud"]="admin_email,admin_username,admin_password"
  ["home-assistant"]="admin_email,admin_username,admin_password,ha_api_token"
  ["node-red"]="admin_username,admin_password,node_red_api_token"
  ["grafana-suite"]="admin_username,admin_password,grafana_api_token"
  ["pi-hole"]="admin_password,pihole_port"
  ["prometheus"]="admin_username,admin_password,prometheus_api_key"
  ["datadog"]="datadog_api_key,datadog_app_key"
  ["portainer"]="admin_username,admin_password,portainer_api_token"
)

# Vault Name
VAULT_NAME="YourVaultName"

# Function to prompt for missing fields interactively
prompt_and_update_field() {
  local software="$1"
  local field="$2"
  local item_id="$3"

  echo -n "Enter value for $field in $software: "
  read -r value

  if [[ -z "$value" ]]; then
    echo "Invalid input. Please enter a non-empty value."
    prompt_and_update_field "$software" "$field" "$item_id"
  else
    op item edit --vault "$VAULT_NAME" --field "$field" --value "$value" "$item_id"
    echo "Updated $field for $software."
  fi
}

# Function to select an existing 1Password item
select_existing_item() {
  echo "Fetching all items in the vault..."
  op item list --vault "$VAULT_NAME" --format json | jq -r '.[] | "\(.title)"'
  echo "Enter the title of the item you want to edit:"
  read -r selected_title
  ITEM_ID=$(op item list --vault "$VAULT_NAME" --format json | jq -r ".[] | select(.title=="$selected_title") | .id")
  if [[ -z "$ITEM_ID" ]]; then
    echo "Invalid selection. Please try again."
    select_existing_item
  fi
  echo "You selected: $selected_title"
  echo "$ITEM_ID"
}

# Main check loop
for software in "${!SOFTWARE_PACKAGES[@]}"; do
  echo "Checking 1Password vault for $software..."
  ITEM_ID=$(op item list --vault "$VAULT_NAME" --format json | jq -r ".[] | select(.title=="$software") | .id")

  if [[ -z "$ITEM_ID" ]]; then
    echo "Creating a new 1Password item for $software..."
    IFS=',' read -r -a fields <<< "${SOFTWARE_PACKAGES[$software]}"
    ITEM_ID=$(op item create --vault "$VAULT_NAME" --category login --title "$software" $(for field in "${fields[@]}"; do echo "--label $field --value 'PLACEHOLDER'"; done) | jq -r '.id')
    echo "1Password item for $software created. Update it with correct values in the vault."
  else
    echo -n "Do you already have an account for $software? (yes/no): "
    read -r account_exists

    if [[ "$account_exists" == "yes" ]]; then
      echo -n "Do you want to use an existing 1Password record or create a new one? (existing/new): "
      read -r record_choice

      if [[ "$record_choice" == "existing" ]]; then
        ITEM_ID=$(select_existing_item)
      fi

      echo "Checking required fields for $software..."
      IFS=',' read -r -a fields <<< "${SOFTWARE_PACKAGES[$software]}"
      for field in "${fields[@]}"; do
        FIELD_VALUE=$(op item get --vault "$VAULT_NAME" --field "$field" "$ITEM_ID" 2>/dev/null)
        if [[ -z "$FIELD_VALUE" || "$FIELD_VALUE" == "PLACEHOLDER" ]]; then
          prompt_and_update_field "$software" "$field" "$ITEM_ID"
        else
          echo "$field for $software is already set."
        fi
      done
    else
      echo "Skipping token/key fields for $software. These will be created during installation."
    fi
  fi
done

echo "Credential check complete. Proceed to installation for token/key generation."
