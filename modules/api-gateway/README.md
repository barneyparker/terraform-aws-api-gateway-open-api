# Terraform-AWS-API-Gateway-OpenAPI API Gateway Module

This module creates an API Gateway resource using OpenAPI specification.

Designed to be used with the with the Route module.

## Usage

```hcl
module "api" {
  source = "../modules/api-gateway"

  providers = {
    aws.global = aws.global
  }

  # API
  api_name     = "example"
  openapi_spec = module.spec.json

  # Domain
  zone_id = data.aws_route53_zone.zone.zone_id
  domain  = var.domain

  iam_policies = [
    data.aws_iam_policy_document.s3_access.json
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_name | The name of the API | `string` | n/a | yes |
| openapi\_spec | The OpenAPI specification | `string` | n/a | yes |
| endpoint\_type | The endpoint type for the API | `string` | `"REGIONAL"` | no |
| stage\_name | The name of the API stage | `string` | `"v1"` | no |
| log\_retention\_in\_days | The number of days to retain the logs for | `number` | `7` | no |
| access\_log\_format | The format for the API Gateway access logs | `string` | `"json"` | no |
| zone\_id | The Route53 zone ID for the domain | `string` | n/a | yes |
| domain | The domain for the API | `string` | n/a | yes |
| iam\_policies | The IAM policies to attach to the API Gateway role | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| role_arn | The ARN of the API Gateway role |
| role_name | The name of the API Gateway role |