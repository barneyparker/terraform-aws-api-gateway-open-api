resource "aws_s3_bucket" "bucket" {}

module "s3_file_upload" {
  source = "barneyparker/s3-file-upload/aws"

  bucket_id  = aws_s3_bucket.bucket.id
  source_dir = "${path.module}/files"
}

module "index_route" {
  source = "../modules/route"

  path = "/"
  handlers = [
    module.s3_index.json
  ]
}

module "s3_index" {
  source = "../modules/s3-specific-file"

  bucket_name = aws_s3_bucket.bucket.id
  role_arn    = module.api.role_arn
  filename    = "index.html"
  mime_type   = "text/html"
  region      = "eu-west-2"
}

module "media_route" {
  source = "../modules/route"

  path = "/media/{item}"
  handlers = [
    module.s3_media.json
  ]
}

module "s3_media" {
  source = "../modules/s3-any-file"

  bucket_name    = aws_s3_bucket.bucket.id
  role_arn       = module.api.role_arn
  files_path     = "media"
  path_parameter = "item"
  region         = "eu-west-2"
}

data "aws_iam_policy_document" "s3_access" {
  statement {
    actions = ["s3:GetObject"]

    resources = ["${aws_s3_bucket.bucket.arn}/*"]
  }
}
