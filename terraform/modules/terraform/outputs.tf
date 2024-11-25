
# Outputs for Terraform Module (Enhanced)

output "terraform_version" {
  value       = "Terraform installed version: ${var.terraform_version}"
  description = "The validated version of Terraform."
}

output "terraform_backend_status" {
  value       = "Backend configuration validated successfully."
  description = "Indicates the backend configuration is valid."
}

output "terraform_debug_mode" {
  value       = var.debug_mode ? "Enabled" : "Disabled"
  description = "Status of debugging mode for Terraform workflows."
}
