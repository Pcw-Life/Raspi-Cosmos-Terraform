
# Outputs for 1Password Module (Enhanced)

output "connect_server_status" {
  value       = null_resource.validate_connect_server.id == "200" ? "Online" : "Offline"
  description = "The status of the 1Password Connect Server."
}
