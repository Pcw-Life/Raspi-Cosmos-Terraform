
#!/bin/bash

# Define services and fields
declare -A SERVICES
SERVICES=(
  ["grafana"]="admin_username,admin_password,grafana_api_token,grafana_port"
  ["node-red"]="admin_username,admin_password,node_red_api_token,node_red_port"
  ["home-assistant"]="admin_email,admin_username,admin_password,home_assistant_port"
  ["pi-hole"]="pihole_admin_pass,timezone,pihole_port"
  ["unifi-controller"]="unifi_uid,unifi_api_key,unifi_port"
)

# Vault Name
VAULT_NAME="YourVaultName"

# Check and create 1Password items
for service in "${!SERVICES[@]}"; do
  echo "Checking 1Password vault for $service..."
  ITEM_EXISTS=$(op item list --vault "${VAULT_NAME}" --format json | jq -r ".[] | select(.title=="${service}") | .id")

  if [[ -z "$ITEM_EXISTS" ]]; then
    echo "Creating 1Password item for $service..."
    IFS=',' read -r -a fields <<< "${SERVICES[$service]}"
    op item create --vault "${VAULT_NAME}" --category login --title "$service" $(for field in "${fields[@]}"; do echo "--label $field --value 'PLACEHOLDER'"; done)
    echo "1Password item for $service created. Update it with correct values in the vault."
  else
    echo "$service item already exists in the vault."
  fi
done

# Export environment variables
for service in "${!SERVICES[@]}"; do
  echo "Fetching credentials for $service from 1Password..."
  IFS=',' read -r -a fields <<< "${SERVICES[$service]}"
  for field in "${fields[@]}"; do
    export "${field^^}"=$(op item get --vault "${VAULT_NAME}" --field "$field" "$service")
  done
done
