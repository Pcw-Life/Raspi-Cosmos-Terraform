
# 1Password Module (Enhanced)

# Validate the Connect Server and Token
resource "null_resource" "validate_connect_server" {
  provisioner "local-exec" {
    command = <<EOT
      curl -s -o /dev/null -w '%{http_code}' -H "Authorization: Bearer ${var.op_connect_token}"       ${var.op_connect_host}/v1/vaults
    EOT
  }
}

# Outputs
output "connect_server_status" {
  value       = null_resource.validate_connect_server.id == "200" ? "Online" : "Offline"
  description = "The status of the 1Password Connect Server."
}
