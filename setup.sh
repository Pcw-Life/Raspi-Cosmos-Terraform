#!/bin/bash

# Guided setup script for PCW|Integrates Smarthome System Development

echo "Welcome to the PCW|Integrates Setup!"
echo "Let's go through the setup and select the software modules you want to install."
echo "Please answer 'yes' or 'no' for each module."

# Prompt for each software module
read -p "Install Home Assistant? (yes/no): " install_home_assistant
read -p "Install Node-RED? (yes/no): " install_node_red
read -p "Install Cosmos Cloud? (yes/no): " install_cosmos_cloud
read -p "Install Grafana? (yes/no): " install_grafana
read -p "Install Prometheus? (yes/no): " install_prometheus
read -p "Install UniFi Controller? (yes/no): " install_unifi
read -p "Install MySQL or MongoDB? (yes/no): " install_database

# Prompt for 1Password Integration
if ! command -v op &> /dev/null; then
    echo "1Password CLI not found. Please install 1Password CLI and login before continuing."
    exit 1
else
    echo "Checking 1Password authentication..."
    op account list > /dev/null
    if [ $? -ne 0 ]; then
        echo "You are not logged into 1Password. Please log in with 'op signin'."
        exit 1
    else
        echo "1Password authenticated."
    fi
fi

# Check for necessary credentials in 1Password
echo "Checking for required credentials in 1Password..."
required_items=("cloudflare_api_token" "onepassword_api_key" "grafana_admin_password" "unifi_admin_password")
for item in "${required_items[@]}"; do
    if ! op item get "$item" &> /dev/null; then
        echo "The 1Password item '$item' is missing. Please add it to continue."
    fi
done

# Create the .tfvars file for Terraform
cat <<EOT > selection.tfvars
install_home_assistant = "${install_home_assistant}"
install_node_red = "${install_node_red}"
install_cosmos_cloud = "${install_cosmos_cloud}"
install_grafana = "${install_grafana}"
install_prometheus = "${install_prometheus}"
install_unifi = "${install_unifi}"
install_database = "${install_database}"
EOT

echo "Setup complete! Run 'terraform apply -var-file=selection.tfvars' to start the installation."