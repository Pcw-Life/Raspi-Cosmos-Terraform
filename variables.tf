# Enable or disable each module based on user input
variable "install_home_assistant" {
  type    = bool
  default = false
}

variable "install_node_red" {
  type    = bool
  default = false
}

variable "install_cosmos_cloud" {
  type    = bool
  default = false
}

variable "install_grafana" {
  type    = bool
  default = false
}

variable "install_prometheus" {
  type    = bool
  default = false
}

variable "install_unifi" {
  type    = bool
  default = false
}

variable "install_database" {
  type    = bool
  default = false
}