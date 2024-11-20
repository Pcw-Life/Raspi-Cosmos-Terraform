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

variable "install_vscode" {
  type        = bool
  default     = false
  description = "Set to true to install Visual Studio Code and extensions."
}

# Credential-related variables
variable "onepassword_vault_name" {
  type        = string
  description = "The name of the 1Password vault to use for storing credentials."
  default     = "PCWProps"
}

variable "required_services" {
  type = map(object({
    item_name      = string
    username_key   = string
    password_key   = string
    email_key      = string
    api_token_key  = string
    ssh_key_key    = string
    login_url_key  = string
  }))
  description = "Required services and the fields expected in 1Password."
  default = {
    cloudflare = {
      item_name      = "Cloudflare API"
      username_key   = ""
      password_key   = ""
      email_key      = "email"
      api_token_key  = "api_token"
      ssh_key_key    = ""
      login_url_key  = "https://dash.cloudflare.com"
    }
    cosmos = {
      item_name      = "Cosmos Admin"
      username_key   = "username"
      password_key   = "password"
      email_key      = "email"
      api_token_key  = ""
      ssh_key_key    = ""
      login_url_key  = ""
    }
    grafana = {
      item_name      = "Grafana Admin"
      username_key   = "username"
      password_key   = "password"
      email_key      = "email"
      api_token_key  = ""
      ssh_key_key    = ""
      login_url_key  = "https://grafana.com"
    }
    home_assistant = {
      item_name      = "Home Assistant Admin"
      username_key   = "username"
      password_key   = "password"
      email_key      = "email"
      api_token_key  = ""
      ssh_key_key    = ""
      login_url_key  = "https://home-assistant.io"
    }
    node_red = {
      item_name      = "Node-RED Admin"
      username_key   = "username"
      password_key   = "password"
      email_key      = "email"
      api_token_key  = ""
      ssh_key_key    = ""
      login_url_key  = "https://nodered.org"
    }
    pihole = {
      item_name      = "Pi-hole Admin"
      username_key   = "username"
      password_key   = "password"
      email_key      = ""
      api_token_key  = ""
      ssh_key_key    = ""
      login_url_key  = "http://pi.hole"
    }
    prometheus = {
      item_name      = "Prometheus Admin"
      username_key   = "username"
      password_key   = "password"
      email_key      = "email"
      api_token_key  = ""
      ssh_key_key    = ""
      login_url_key  = ""
    }
    unifi = {
      item_name      = "UniFi Admin"
      username_key   = "username"
      password_key   = "password"
      email_key      = "email"
      api_token_key  = ""
      ssh_key_key    = ""
      login_url_key  = "https://unifi.ui.com"
    }
    github = {
      item_name      = "GitHub PAT"
      username_key   = "username"
      password_key   = ""
      email_key      = "email"
      api_token_key  = "personal_access_token"
      ssh_key_key    = "ssh_key"
      login_url_key  = "https://github.com"
    }
    onepassword = {
      item_name      = "1Password Admin"
      username_key   = "username"
      password_key   = "password"
      email_key      = "email"
      api_token_key  = "secret_key"
      ssh_key_key    = ""
      login_url_key  = "https://my.1password.com"
    }
    raspberrypi = {
      item_name      = "RaspberryPi Admin"
      username_key   = "username"
      password_key   = "password"
      email_key      = ""
      api_token_key  = ""
      ssh_key_key    = ""
      login_url_key  = ""
    }
  }
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