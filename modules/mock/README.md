# Terraform-AWS-API-Gateway-OpenAPI Mock Integration

This module creates a mock integration for an API Gateway resource.

Designed to be used with the with the Route and OpenAPI modules.

## Usage

```hcl
module "mock_integration" {
  source = "barneyparker/api=-gateway-open-api//mock"

  method        = "get"
  model_name    = "Example"
  content_type  = "application/json"
  response_body = jsonencode({ message = "Hello World!" })
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| method | The HTTP method for the integration | `string` | n/a | yes |
| model\_name | The name of the model to use for the integration | `string` | n/a | yes |
| content\_type | The content type for the integration | `string` | n/a | yes |
| response\_body | The response body for the integration | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| json | The JSON representation of the integration |
