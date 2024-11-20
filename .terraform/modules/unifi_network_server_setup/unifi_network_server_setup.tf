# UniFi Network Server Setup
resource "null_resource" "unifi_network_server" {
  provisioner "local-exec" {
    command = <<EOT
      #!/bin/bash
      set -e

      echo "🔍 Checking for required dependencies..."
      if ! command -v curl &> /dev/null; then
        echo "❌ 'curl' is not installed. Installing it now..."
        sudo apt-get update && sudo apt-get install -y curl
      fi

      echo "📥 Downloading UniFi Network Server package..."
      curl -o /tmp/unifi_sysvinit_all.deb https://dl.ui.com/unifi/8.6.9/unifi_sysvinit_all.deb

      echo "🔧 Installing UniFi Network Server..."
      sudo dpkg -i /tmp/unifi_sysvinit_all.deb || sudo apt-get install -f -y

      echo "🧹 Cleaning up installation files..."
      rm /tmp/unifi_sysvinit_all.deb

      echo "✅ UniFi Network Server installation completed successfully!"
    EOT
  }
}

output "unifi_network_server_status" {
  value = "UniFi Network Server setup complete. Access it via your browser after configuring the network."
}