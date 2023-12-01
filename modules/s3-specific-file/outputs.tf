output "json" {
  value = templatefile("${path.module}/s3.json", {
    bucket_name = var.bucket_name
    role_arn    = var.role_arn
    filename    = var.filename
    mime_type   = var.mime_type
    region      = var.region
  })
}
