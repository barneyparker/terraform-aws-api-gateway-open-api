# Terraform-AWS-API-Gateway-OpenAPI S3 Specific File Integration

This module creates an S3 integration for an API Gateway resource which always returns a fixed file.

Designed to be used with the with the Route and OpenAPI modules.

## Usage

```hcl
module "s3_specific_file_integration" {
  source = "barneyparker/api-gateway-open-api//s3-specific-file"

  bucket_name = "my-bucket"
  filename    = "index.html"
  mime_type   = "text/html"
  role_arn    = "arn:aws:iam::123456789012:role/MyRole"
  region      = "eu-west-1"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | The name of the S3 bucket | `string` | n/a | yes |
| filename | The name of the file to return | `string` | n/a | yes |
| mime\_type | The MIME type of the file | `string` | n/a | yes |
| role\_arn | The ARN of the IAM role to use for the integration | `string` | n/a | yes |
| region | The AWS region of the S3 bucket | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| json | The JSON representation of the integration |
