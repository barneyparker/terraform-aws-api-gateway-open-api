locals {
  servers = [for server in var.servers : templatefile("${path.module}/servers.json", {
    url      = server.url
    basepath = server.basepath
  })]
}
