output "json" {
  value = templatefile("${path.module}/s3.json", {
    bucket_name    = var.bucket_name
    role_arn       = var.role_arn
    files_path     = var.files_path
    path_parameter = var.path_parameter
    region         = var.region
  })
}
