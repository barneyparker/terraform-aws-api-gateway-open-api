output "json" {
  value = templatefile("${path.module}/mock.json", {
    method        = var.method
    model_name    = var.model_name
    content_type  = var.content_type
    response_body = replace(var.response_body, "\"", "\\\"")
  })
}
