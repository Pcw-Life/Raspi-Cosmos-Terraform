# PCW|Integrates Smarthome System Development 🚀

Welcome to the **PCW|Integrates Smarthome System Development** repository! This setup automates the installation and configuration of a comprehensive smart home system with network management, monitoring, and automation features.

---

## Quick Start 🚀

[🚀 **CLICK HERE TO JUMP THE INSTALLATION PROCESS**](#how-to-start-the-installation)  
(See below for a detailed outline of the process.)

---

## High-Level Setup Checklist 📋

1. [PCW|Integrates Smarthome System Development 🚀](#pcwintegrates-smarthome-system-development-)
   1. [Quick Start 🚀](#quick-start-)
   2. [High-Level Setup Checklist 📋](#high-level-setup-checklist-)
   3. [Prerequisites ✅](#prerequisites-)
   4. [Software Selection 🛠️](#software-selection-️)
   5. [Credential Check 🔐](#credential-check-)
      1. [Supported Credentials](#supported-credentials)
      2. [Credential Check Workflow](#credential-check-workflow)
   6. [Pi-hole Setup for DNS-Based Ad-Blocking 🚫](#pi-hole-setup-for-dns-based-ad-blocking-)
   7. [Cosmos Cloud Setup ☁️](#cosmos-cloud-setup-️)
   8. [Dry Run and Installation 🚦](#dry-run-and-installation-)
   9. [Troubleshooting 🛠️](#troubleshooting-️)
   10. [How to Start the Installation](#how-to-start-the-installation)

---

## Prerequisites ✅

Ensure you have the following installed and ready:

- **1Password CLI and Desktop**
- **Docker** (on Raspberry Pi and MacBook Pro)
- **GitHub Account**
- **Cloudflare Account** (with API tokens)

---

## Software Selection 🛠️

The setup script will guide you through software selection with `yes/no` prompts. For each module:

1. Confirm whether you want to install the software.
2. Specify if you already have login credentials or need new ones created.
3. Follow the on-screen prompts to verify and update credentials.

---

## Credential Check 🔐

### Supported Credentials

- **Cloudflare:** API token
- **Cosmos Cloud:** Admin email, username, and password
- **Grafana:** Admin password
- **Home Assistant:** Username and password
- **Node-RED:** Admin password
- **Pi-hole:** Admin password
- **Prometheus:** Integration key (if applicable)
- **UniFi Controller:** Admin username and password
- **GitHub:** Token and SSH key
- **1Password:** Master password, secret key, and vault name
- **Raspberry Pi:** Local username and password

### Credential Check Workflow

1. The script will check 1Password for stored credentials for each selected service.
2. If credentials are missing, it will prompt you to:
   - Add them manually.
   - Generate new credentials (if supported by the service).
3. Once all credentials are verified, the installation process begins.

---

## Pi-hole Setup for DNS-Based Ad-Blocking 🚫

Pi-hole will enhance your network security by blocking unwanted DNS queries:

1. Install Pi-hole as a Docker container.
2. Configure DNS settings to integrate with your network.
3. Manage and monitor DNS queries via the Pi-hole web interface.

---

## Cosmos Cloud Setup ☁️

Cosmos Cloud provides a centralized management platform:

1. Deploy Cosmos as a Docker container.
2. Configure DNS and security settings.

---

## Dry Run and Installation 🚦

After selecting your software and verifying credentials:

1. **Run a Dry Run:** Ensures all configurations are complete.

   ```bash
   terraform apply -var-file=selection.tfvars -plan-only
   ```

2. **Begin Installation:** Once the dry run passes, proceed with the installation.  

Run:  

```bash
terraform apply -var-file=selection.tfvars
```

Follow the on-screen prompts to confirm any final configurations.

---

## Troubleshooting 🛠️

**Missing Credentials:**  
Use the credential check module to verify missing items:  

```bash
terraform apply -target=module.credential_check
```

**Service Installation Failures:**  
Review logs for specific modules. Logs are generated for each module to aid in identifying the issue.

**Re-run Terraform:**  
If errors persist, rerun the Terraform workflow after resolving issues:  

```bash
terraform apply -var-file=selection.tfvars
```

 **Consult Documentation:**  
Refer to the official documentation of each software module for additional guidance.

If you encounter any issues during the installation:

- **Check Logs:** Review any error messages displayed during the setup.
- **Verify Credentials:** Ensure all required credentials exist and are labeled correctly in 1Password.
- **Re-run the Script:** Re-run `setup.sh` after resolving any issues.
- **Seek Help:** Refer to the documentation or contact support if problems persist.

---

## How to Start the Installation

To begin the setup, run the following command in your terminal:

```bash
bash setup.sh
```

This script will guide you through the software selection process, generate the necessary configuration files, and prepare the system for installation.

1. **Navigate to the Repository Directory**  
   Ensure you are in the directory where the repository was cloned:

   ```bash
   cd /path/to/Raspi-Cosmos-Terraform
   ```

2. **Run the Setup Script**  
   Execute the setup script to start the installation process:

   ```bash
   bash setup.sh
   ```

3. **Follow the Prompts**  
   - The script will ask you to select which software packages to install.
   - It will check your 1Password vault for credentials and guide you to create or correct any missing items.
   - A `selection.tfvars` file will be generated based on your choices.

4. **Run a Dry Run**  
   The setup script will automatically perform a dry run to validate the configuration:

   ```bash
   terraform plan -var-file=selection.tfvars
   ```

   - If any errors occur, the script will guide you through resolving them.

5. **Apply the Configuration**  
   Once the dry run completes successfully, you can apply the configuration to deploy all selected services:

   ```bash
   terraform apply -var-file=selection.tfvars
   ```

---
