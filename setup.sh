#!/bin/bash

# Enhanced guided setup script for PCW|Integrates Smarthome System Development

echo "🚀 Welcome to the PCW|Integrates Setup!"
echo "This guided setup will help you configure your system."
echo "Please answer 'yes' or 'no' for each module."

# Function to prompt for software installation
prompt_install() {
    local software_name=$1
    local var_name=$2
    read -p "Install $software_name? (yes/no): " response
    case "$response" in
        [Yy][Ee][Ss]) eval "$var_name=true" ;;
        [Nn][Oo]) eval "$var_name=false" ;;
        *) echo "Invalid input. Please enter 'yes' or 'no'."; prompt_install "$software_name" "$var_name" ;;
    esac
}

# Prompt for each software module
prompt_install "Home Assistant" install_home_assistant
prompt_install "Node-RED" install_node_red
prompt_install "Cosmos Cloud" install_cosmos_cloud
prompt_install "Grafana" install_grafana
prompt_install "Prometheus" install_prometheus
prompt_install "UniFi Controller" install_unifi
prompt_install "MySQL or MongoDB" install_database

# Check for 1Password CLI
if ! command -v op &> /dev/null; then
    echo "❌ 1Password CLI not found. Please install 1Password CLI and login before continuing."
    exit 1
else
    echo "🔑 Checking 1Password authentication..."
    if ! op account list &> /dev/null; then
        echo "❌ You are not logged into 1Password. Please log in with 'op signin'."
        exit 1
    else
        echo "✅ 1Password authenticated."
    fi
fi

# Check and manage required credentials in 1Password
echo "🔍 Checking for required credentials in 1Password..."
required_items=("cloudflare_api_token" "onepassword_api_key" "grafana_admin_password" "unifi_admin_password")

for item in "${required_items[@]}"; do
    if ! op item get "$item" &> /dev/null; then
        echo "⚠️ The 1Password item '$item' is missing."
        echo "Would you like to (1) Create it, (2) Add it manually, or (3) Skip? (1/2/3)"
        read -p "Your choice: " choice
        case "$choice" in
            1) 
                echo "🔑 Generating and saving '$item'..."
                generated_password=$(openssl rand -base64 16)
                op item create --category=login --title="$item" --password="$generated_password" \
                    --vault="PCWProps" --url="https://example.com" > /dev/null
                echo "✅ '$item' created and saved in 1Password."
                ;;
            2)
                echo "⚠️ Please add '$item' to your 1Password vault manually and rerun the script."
                exit 1
                ;;
            3)
                echo "⚠️ Skipping '$item'. This may cause issues during installation."
                ;;
            *)
                echo "Invalid choice. Exiting."
                exit 1
                ;;
        esac
    else
        echo "✅ '$item' found in 1Password."
    fi
done

# Create the .tfvars file for Terraform
cat <<EOT > selection.tfvars
install_home_assistant = ${install_home_assistant}
install_node_red = ${install_node_red}
install_cosmos_cloud = ${install_cosmos_cloud}
install_grafana = ${install_grafana}
install_prometheus = ${install_prometheus}
install_unifi = ${install_unifi}
install_database = ${install_database}
EOT

echo "✅ Configuration saved to selection.tfvars."

# Final instructions
echo "🎉 Setup complete!"
echo "You can now run the following command to apply your configuration:"
echo "terraform apply -var-file=selection.tfvars"