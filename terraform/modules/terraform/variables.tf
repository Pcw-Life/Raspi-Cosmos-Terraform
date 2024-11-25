
# Variables for Terraform Module (Enhanced)

variable "terraform_path" {
  description = "The path where Terraform is installed."
  type        = string
  default     = "/usr/local/bin/terraform"
}

variable "terraform_version" {
  description = "Specific version of Terraform to validate or install."
  type        = string
  default     = "1.5.0"
}

variable "backend_configuration" {
  description = "Backend configuration for Terraform initialization."
  type        = map(string)
  default     = {
    bucket         = "example-terraform-state"
    region         = "us-west-2"
    key            = "terraform/state"
    dynamodb_table = "terraform-lock"
  }
}

variable "debug_mode" {
  description = "Enable debugging for Terraform workflows."
  type        = bool
  default     = false
}
