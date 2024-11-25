#!/bin/bash

# Read credentials from 1Password
api_url=$(op read "op://PCWICV/UniFi Controller Settings/API URL")
api_token=$(op read "op://PCWICV/UniFi Controller Settings/API Token")
site_id=$(op read "op://PCWICV/UniFi Controller Settings/Site ID")
management_ssid=$(op read "op://PCWICV/UniFi Controller Settings/Management SSID")
iot_ssid=$(op read "op://PCWICV/UniFi Controller Settings/IoT SSID")
guest_ssid=$(op read "op://PCWICV/UniFi Controller Settings/Guest SSID")

# Check if all required secrets are retrieved
if [[ -z "$api_url" || -z "$api_token" || -z "$site_id" || -z "$management_ssid" || -z "$iot_ssid" || -z "$guest_ssid" ]]; then
  echo "Error: Failed to retrieve one or more secrets from 1Password."
  exit 1
fi

# Export variables for Terraform
export UNIFI_API_URL="$api_url"
export UNIFI_API_TOKEN="$api_token"
export UNIFI_SITE_ID="$site_id"
export MANAGEMENT_SSID="$management_ssid"
export IOT_SSID="$iot_ssid"
export GUEST_SSID="$guest_ssid"

echo "Credentials and SSIDs exported as environment variables."
