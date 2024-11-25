resource "unifi_firewall_rule" "allow_essential_services" {
  name        = "Allow Essential Network Services"
  action      = "accept"
  protocol    = "tcp_udp"
  src_address = "All 4"
  dst_address = "Ports for Essential Network Services"
  ruleset     = "LAN_IN"
  enabled     = true
  rule_index  = 1000
}

resource "unifi_firewall_rule" "allow_iot_services" {
  name        = "Allow IoT Services"
  action      = "accept"
  protocol    = "tcp_udp"
  src_address = "IoT 4"
  dst_address = "Ports for IoT Specific Services"
  ruleset     = "LAN_IN"
  enabled     = true
  rule_index  = 1010
}

resource "unifi_firewall_rule" "deny_iot_to_private" {
  name        = "Deny IoT to Private Networks"
  action      = "drop"
  protocol    = "all"
  src_address = "IoT 4"
  dst_address = "Private 4"
  ruleset     = "LAN_IN"
  enabled     = true
  rule_index  = 1020
}

resource "unifi_firewall_rule" "allow_guest_internet" {
  name        = "Allow Guest Internet Access"
  action      = "accept"
  protocol    = "tcp_udp"
  src_address = "Guest 4"
  dst_address = "any"
  dst_port    = "80-443" # Use a range for HTTP and HTTPS
  ruleset     = "GUEST_IN"
  enabled     = true
  rule_index  = 1030
}

resource "unifi_firewall_rule" "allow_limited_access_internet" {
  name        = "Allow Limited Access to Internet"
  action      = "accept"
  protocol    = "tcp_udp"
  src_address = "Limited Access 4"
  dst_address = "Ports Internet Access and Web Services"
  ruleset     = "LAN_IN"
  enabled     = true
  rule_index  = 1040
}

resource "unifi_firewall_rule" "docker_domains" {
  for_each    = toset(var.docker_domains)
  name        = "Allow Docker - ${each.value}"
  action      = "accept"
  protocol    = "tcp_udp"
  dst_address = each.value
  ruleset     = "LAN_IN"
  enabled     = true
  rule_index  = 3000 + index(var.docker_domains, each.value)
}

resource "unifi_firewall_rule" "allow_management_to_iot" {
  name        = "Allow Management to IoT"
  action      = "accept"
  protocol    = "tcp_udp"
  src_address = var.management_vlan
  dst_address = unifi_firewall_group.iot_devices.id
  ruleset     = "LAN_IN"
  enabled     = true
}

resource "unifi_firewall_rule" "allow_guest_to_iot" {
  name        = "Allow Guest to Selected IoT"
  action      = "accept"
  protocol    = "tcp_udp"
  src_address = var.guest_vlan
  dst_address = unifi_firewall_group.iot_devices_guest.id
  ruleset     = "LAN_IN"
  enabled     = true
}
