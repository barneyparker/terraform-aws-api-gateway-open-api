output "json" {
  value = templatefile("${path.module}/path.json", {
    path     = var.path
    handlers = join(",\n      ", var.handlers)
  })
}
