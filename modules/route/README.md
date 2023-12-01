# Terraform-AWS-API-Gateway-OpenAPI Route Module

This module creates an API Gateway resource for a Route.  It is the container for specific handlers to configure methods and integrations

Designed to be used with the with the OpenAPI module.

## Usage

```hcl
module "route" {
  source = "barneyparker/api-gateway-open-api//route"

  path = "/example"
  handlers = [
    module.s3_specific_file_integration.json,
    module.s3_any_file_integration.json,
    module.mock_integration.json,
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| path | The path for the resource | `string` | n/a | yes |
| handlers | The handlers for the resource | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| json | The JSON representation of the resource |