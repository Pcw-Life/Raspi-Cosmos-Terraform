# PCW|Integrates Smarthome System Development 🚀

Welcome to the **PCW|Integrates Smarthome System Development** repository! This setup automates the installation and configuration of a comprehensive smart home system with network management, monitoring, and automation features. 

---

## High-Level Setup Checklist 📋

1. [PCW|Integrates Smarthome System Development 🚀](#pcwintegrates-smarthome-system-development-)
   1. [High-Level Setup Checklist 📋](#high-level-setup-checklist-)
   2. [Prerequisites ✅](#prerequisites-)
   3. [Software Selection 🛠️](#software-selection-️)
   4. [1Password Integration 🔐](#1password-integration-)
   5. [Cosmos Cloud Setup ☁️](#cosmos-cloud-setup-️)
   6. [Home Assistant Setup 🏠](#home-assistant-setup-)
   7. [Node-RED Integration 🔄](#node-red-integration-)
   8. [Grafana Setup for Analytics 📊](#grafana-setup-for-analytics-)
   9. [Prometheus Setup for Monitoring 📈](#prometheus-setup-for-monitoring-)
   10. [UniFi Controller for Identity Enterprise 🌐](#unifi-controller-for-identity-enterprise-)
   11. [Database Setup 🗄️](#database-setup-️)
   12. [1Password Connect Server for APIs 🌉](#1password-connect-server-for-apis-)
   13. [GitHub CLI and VS Code Extensions 💻](#github-cli-and-vs-code-extensions-)
   14. [Cloudflare Workers Setup for DDNS 🌐](#cloudflare-workers-setup-for-ddns-)
   15. [Dry Run and Installation 🚦](#dry-run-and-installation-)
   16. [Troubleshooting 🛠️](#troubleshooting-️)

---

## Prerequisites ✅

Make sure you have the following installed and configured:
- **VS Code** with Remote-SSH setup for access to your Raspberry Pi
- **1Password Desktop and CLI** on both your MacBook and Raspberry Pi
- **Docker** installed on your Raspberry Pi and Docker Desktop on your MacBook Pro
- **Cloudflare Account** with API tokens for DNS and Cloudflare Workers
- **GitHub Account** for managing repositories and Actions

---

## Software Selection 🛠️

To begin, select the software packages you want to install. The Terraform workflow will prompt you with `yes`/`no` options for each package and collect any required information. 

---

## 1Password Integration 🔐

Ensure that your 1Password is correctly configured. The following values should be stored in 1Password to avoid storing sensitive data in code:

- **1Password Integration**
  - Vault: `PCW Integrates`
  - Item: `API Credentials`
  - Credential Name: `API Key`

- **UniFi Controller**
  - Vault: `PCW Integrates`
  - Item: `UniFi`
  - Credential Name: `Admin Password`

The Terraform workflow will interactively check 1Password for these values and prompt you if any are missing.

---

## Cosmos Cloud Setup ☁️

Cosmos Cloud will serve as the front-end management platform. This setup will:
1. Deploy Cosmos Cloud on Docker.
2. Configure necessary DNS and security settings with Cloudflare.

---

## Home Assistant Setup 🏠

Set up **Home Assistant** for smart home device integration. This module will:
1. Install Home Assistant on your Raspberry Pi.
2. Configure IoT devices and automation workflows.

---

## Node-RED Integration 🔄

Add **Node-RED** for creating and managing automation flows within Home Assistant:
1. Deploy Node-RED as a Docker container.
2. Configure Node-RED to communicate with Home Assistant for automation tasks.

---

## Grafana Setup for Analytics 📊

**Grafana** will visualize your data and provide analytics dashboards:
1. Install Grafana as a Docker container.
2. Configure it to pull data from Prometheus and other sources.

---

## Prometheus Setup for Monitoring 📈

**Prometheus** will handle system monitoring and alerting:
1. Install Prometheus.
2. Set up integrations with Grafana and configure alerting rules.

---

## UniFi Controller for Identity Enterprise 🌐

The **UniFi Controller** enables centralized network management:
1. Deploy UniFi Controller as a Docker container.
2. Integrate it with UniFi Identity Enterprise for SSO and App Launcher.

---

## Database Setup 🗄️

For data storage, choose between **MySQL** or **MongoDB**:
1. Deploy the selected database on Docker.
2. Configure database connections for Home Assistant and other services.

---

## 1Password Connect Server for APIs 🌉

**1Password Connect Server** enables secure API access:
1. Deploy 1Password Connect Server.
2. Integrate it with other components to securely manage secrets.

---

## GitHub CLI and VS Code Extensions 💻

Install **GitHub CLI** and other VS Code extensions for seamless development:
1. Use the 1Password API to authenticate GitHub CLI.
2. Ensure extensions are linked to the correct repositories and credentials.

---

## Cloudflare Workers Setup for DDNS 🌐

Set up **Cloudflare Workers** to manage DDNS and other services:
1. Configure Workers using the Cloudflare API.
2. Set up DDNS to dynamically manage domain records.

---

## Dry Run and Installation 🚦

Once all configurations are set:
1. **Run a Dry Run**: The Terraform script will verify configurations and alert you to any missing information.
2. **Begin Installation**: If the dry run completes successfully, the workflow will proceed with installation.

---

## Troubleshooting 🛠️

If you encounter any issues during the setup:
1. Review each module’s logs.
2. Confirm that all necessary credentials are available in 1Password.
3. Re-run the Terraform workflow, ensuring interactive prompts are addressed.

---

Feel free to reach out for assistance if any problems arise. Enjoy building your automated smart home system! 🚀