output "json" {
  value = templatefile("${path.module}/lambda.json", {
    invoke_arn = var.invoke_arn
    method     = var.method
  })
}
