output "json" {
  value = templatefile("${path.module}/openapi.json", {
    spec_version = var.spec_version
    info         = var.info
    servers      = join(",\n    ", local.servers)
    routes       = join(",\n    ", var.routes)
  })
}
