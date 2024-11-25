
#!/bin/bash

ACTION=$1
TARGET_VERSION="1.5.0"  # Specify the minimum required version

if [[ "$ACTION" == "install" ]]; then
  echo "Checking if Terraform is installed..."
  if ! command -v terraform &>/dev/null; then
    echo "Terraform not found. Installing..."
    curl -fsSL https://releases.hashicorp.com/terraform/$(curl -s https://releases.hashicorp.com/terraform/ | grep -oP 'terraform/[0-9.]+/' | head -1 | grep -oP '[0-9.]+')/terraform_$(curl -s https://releases.hashicorp.com/terraform/ | grep -oP 'terraform/[0-9.]+/' | head -1 | grep -oP '[0-9.]+')_linux_amd64.zip -o terraform.zip
    unzip terraform.zip
    sudo mv terraform /usr/local/bin/
    rm terraform.zip
    echo "Terraform installed successfully."
  else
    INSTALLED_VERSION=$(terraform version | grep -oP 'Terraform v\d+\.\d+\.\d+')
    echo "Terraform is already installed: $INSTALLED_VERSION"
  fi

  echo "Validating Terraform version..."
  INSTALLED_VERSION=$(terraform version | grep -oP '\d+\.\d+\.\d+')
  if [[ "$INSTALLED_VERSION" < "$TARGET_VERSION" ]]; then
    echo "Upgrading Terraform to version $TARGET_VERSION..."
    curl -fsSL https://releases.hashicorp.com/terraform/$TARGET_VERSION/terraform_$TARGET_VERSION_linux_amd64.zip -o terraform.zip
    unzip terraform.zip
    sudo mv terraform /usr/local/bin/
    rm terraform.zip
    echo "Terraform upgraded to version $TARGET_VERSION."
  else
    echo "Terraform version is compatible."
  fi

  echo "Validating Terraform installation..."
  if terraform version &>/dev/null; then
    echo "Terraform is running and operational."
  else
    echo "Terraform validation failed. Please check the installation."
    exit 1
  fi

elif [[ "$ACTION" == "validate" ]]; then
  echo "Validating Terraform setup..."
  if terraform version &>/dev/null; then
    echo "Terraform is running and operational."
  else
    echo "Terraform validation failed. Please check the installation."
    exit 1
  fi

else
  echo "Unknown action: $ACTION"
  echo "Usage: $0 {install|validate}"
  exit 1
fi
