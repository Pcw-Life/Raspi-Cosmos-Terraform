
# Variables for 1Password Module (Enhanced)

variable "op_connect_host" {
  description = "The 1Password Connect Server host URL."
  type        = string
}

variable "op_connect_token" {
  description = "The API token for the 1Password Connect Server."
  type        = string
  sensitive   = true
}

variable "debug_mode" {
  description = "Enable debugging for 1Password workflows."
  type        = bool
  default     = false
}
