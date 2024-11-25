# Variables for UniFi Controller Module (Enhanced)

variable "unifi_controller_container_name" {
  description = "The name of the UniFi Controller container."
  type        = string
  default     = "unifi-controller"
}

variable "unifi_internal_port" {
  description = "Internal port for the UniFi Controller container."
  type        = number
  default     = 8443
}

variable "unifi_external_port" {
  description = "External port mapping for the UniFi Controller container."
  type        = number
  default     = 8443
}

variable "unifi_uid" {
  description = "UniFi Controller UID."
  type        = string
}

variable "unifi_api_key" {
  description = "UniFi Controller API key."
  type        = string
  sensitive   = true
}

variable "container_volume_path" {
  description = "The path inside the container to mount a volume."
  type        = string
  default     = "/unifi"
}

variable "host_volume_path" {
  description = "The path on the host machine to mount as a volume."
  type        = string
  default     = "/mnt/unifi/data"
}

variable "healthcheck_interval" {
  description = "Interval for container health checks."
  type        = string
  default     = "30s"
}

variable "healthcheck_timeout" {
  description = "Timeout for container health checks."
  type        = string
  default     = "10s"
}

variable "healthcheck_retries" {
  description = "Number of retries for container health checks."
  type        = number
  default     = 3
}

variable "docker_domains" {
  description = "List of Docker-related domains to allow in the firewall."
  type        = list(string)
  default = [
    "api.segment.io",
    "cdn.segment.com",
    "experiments.docker.com",
    "notify.bugsnag.com",
    "sessions.bugsnag.com",
    "auth.docker.io",
    "cdn.auth0.com",
    "login.docker.com",
    "desktop.docker.com",
    "hub.docker.com",
    "registry-1.docker.io",
    "production.cloudflare.docker.com",
    "docker-pinata-support.s3.amazonaws.com",
    "api.dso.docker.com"
  ]
}

variable "docker_source_subnet" {
  description = "Source subnet for Docker traffic."
  type        = string
}

variable "iot_ssid" {
  description = "SSID for IoT network"
  type        = string
}

variable "guest_ssid" {
  description = "SSID for Guest network"
  type        = string
}

variable "management_ssid" {
  description = "SSID for Management network"
  type        = string
}

variable "iot_vlan" {
  description = "VLAN for IoT network"
  type        = string
}

variable "guest_vlan" {
  description = "VLAN for Guest network"
  type        = string
}

variable "management_vlan" {
  description = "VLAN for Management network"
  type        = string
}
