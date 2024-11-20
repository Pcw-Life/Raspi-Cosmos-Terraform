# Enable or disable each module based on user input
variable "install_home_assistant" {
  type        = bool
  default     = false
  description = "Set to true to install Home Assistant."
}

variable "install_node_red" {
  type        = bool
  default     = false
  description = "Set to true to install Node-RED for automation."
}

variable "install_cosmos_cloud" {
  type        = bool
  default     = false
  description = "Set to true to install Cosmos Cloud."
}

variable "install_grafana" {
  type        = bool
  default     = false
  description = "Set to true to install Grafana for data visualization."
}

variable "install_prometheus" {
  type        = bool
  default     = false
  description = "Set to true to install Prometheus for monitoring."
}

variable "install_unifi" {
  type        = bool
  default     = false
  description = "Set to true to install UniFi Network Server."
}

variable "install_pihole" {
  type        = bool
  default     = false
  description = "Set to true to install Pi-hole for DNS-based ad-blocking."
}

variable "install_onepassword" {
  type        = bool
  default     = false
  description = "Set to true to enable 1Password integration."
}

variable "install_onepassword_connect" {
  type        = bool
  default     = false
  description = "Set to true to enable 1Password Connect Server."
}

# Credential-related variables
variable "onepassword_vault_name" {
  type        = string
  description = "The name of the 1Password vault to use for storing credentials."
}

variable "required_services" {
  type = list(object({
    name        = string
    username    = string
    password    = string
    email       = string
    api_token   = string
    ssh_key     = string
  }))
  description = "List of required services and their credentials."
}

# Cloudflare-specific variables
variable "cloudflare_api_token" {
  type        = string
  description = "API token for Cloudflare."
}

# Pi-hole-specific variables
variable "pihole_password" {
  type        = string
  description = "Password for the Pi-hole web interface."
}

variable "local_ipv4" {
  type        = string
  description = "Local IPv4 address for Pi-hole."
}