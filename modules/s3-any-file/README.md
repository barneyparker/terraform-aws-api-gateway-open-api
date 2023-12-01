# Terraform-AWS-API-Gateway-OpenAPI S3 Any File Integration

This module creates an S3 integration for an API Gateway resource which returns a <named> file from the specific S3 bucket and path.

Designed to be used with the with the Route and OpenAPI modules.

## Usage

```hcl
module "s3_any_file_integration" {
  source = "barneyparker/api-gateway-open-api//s3-any-file"

  bucket_name    = "my-bucket"
  files_path     = "media"
  path_parameter = "item"
  role_arn       = "arn:aws:iam::123456789012:role/MyRole"
  region         = "eu-west-1"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | The name of the S3 bucket | `string` | n/a | yes |
| files\_path | The path to the files in the S3 bucket | `string` | n/a | yes |
| path\_parameter | The name of the URL path parameter to capture the file name | `string` | n/a | yes |
| role\_arn | The ARN of the IAM role to use for the integration | `string` | n/a | yes |
| region | The AWS region of the S3 bucket | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| json | The JSON representation of the integration |
