# Cloudflare Workers setup
resource "cloudflare_worker_script" "ddns_worker" {
  name = "ddns-worker"
  content = file("${path.module}/workers/ddns_worker.js")
}

resource "cloudflare_worker_route" "ddns_route" {
  pattern = "example.com/ddns"
  zone_id = var.cloudflare_zone_id
  script_name = cloudflare_worker_script.ddns_worker.name
}