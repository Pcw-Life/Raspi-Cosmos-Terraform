# UniFi Network Server Setup
resource "null_resource" "unifi_network_server" {
  provisioner "local-exec" {
    command = <<EOT
      #!/bin/bash
      set -e
      echo "Downloading UniFi Network Server..."
      curl -o /tmp/unifi_sysvinit_all.deb https://dl.ui.com/unifi/8.6.9/unifi_sysvinit_all.deb

      echo "Installing UniFi Network Server..."
      sudo dpkg -i /tmp/unifi_sysvinit_all.deb || sudo apt-get install -f -y

      echo "Cleaning up installation files..."
      rm /tmp/unifi_sysvinit_all.deb

      echo "UniFi Network Server installation completed!"
    EOT
  }
}