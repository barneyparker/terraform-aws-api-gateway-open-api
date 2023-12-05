# Terraform-AWS-API-Gateway-OpenAPI Swagger Module

This module creates an API Gateway resource which returns the current API Swagger specification.

Designed to be used with the with the Route and OpenAPI modules.

## Usage

```hcl
module "swagger" {
  source = "barneyparker/api-gateway-open-api//swagger"

  name              = "example-swagger"
  api_execution_arn = module.api.execution_arn
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the API | `string` | n/a | yes |
| api_execution_arn | The Execution ARN of the API Gateway (required for Lambda permission) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| json | The JSON representation of the integration |
