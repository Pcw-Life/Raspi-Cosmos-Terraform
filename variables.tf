# Enable or disable each module based on user input
variable "install_home_assistant" {
  type    = bool
  default = false
  description = "Set to true to install Home Assistant."
}

variable "install_node_red" {
  type    = bool
  default = false
  description = "Set to true to install Node-RED for automation."
}

variable "install_cosmos_cloud" {
  type    = bool
  default = false
  description = "Set to true to install Cosmos Cloud."
}

variable "install_grafana" {
  type    = bool
  default = false
  description = "Set to true to install Grafana for data visualization."
}

variable "install_prometheus" {
  type    = bool
  default = false
  description = "Set to true to install Prometheus for monitoring."
}

variable "install_unifi" {
  type    = bool
  default = false
  description = "Set to true to install UniFi Network Server."
}

variable "install_pihole" {
  type    = bool
  default = false
  description = "Set to true to install Pi-hole for DNS-based ad-blocking."
}

# Cloudflare variables
variable "cloudflare_api_token" {
  description = "API token for Cloudflare."
}

# 1Password variables
variable "install_onepassword" {
  type    = bool
  default = false
  description = "Set to true to enable 1Password integration."
}

variable "install_onepassword_connect" {
  type    = bool
  default = false
  description = "Set to true to enable 1Password Connect Server."
}

# Pi-hole-specific variables
variable "pihole_password" {
  description = "Password for the Pi-hole web interface."
}

variable "local_ipv4" {
  description = "Local IPv4 address for Pi-hole."
}