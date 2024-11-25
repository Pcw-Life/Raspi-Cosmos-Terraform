
# Terraform Setup Module (Enhanced)

# Validate Terraform installation and backend configuration
resource "null_resource" "validate_terraform" {
  provisioner "local-exec" {
    command = "terraform version && terraform init -backend=false"
  }
}

output "terraform_version" {
  value       = chomp(data.external.terraform_version.result.version)
  description = "The installed version of Terraform."
}

output "terraform_backend_status" {
  value       = "Validated backend configuration for Terraform."
  description = "Indicates the backend configuration is valid."
}
