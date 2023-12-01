# Terraform-AWS-API-Gateway-OpenAPI OpenAPI Module

This module creates an API Gateway resource for an OpenAPI specification.

Designed to be used with the with the Route module.

## Usage

```hcl
module "spec" {
  source = "../"

  info = {
    title       = "Example API"
    description = "Example API"
    version     = "1.0.0"
  }

  servers = [
    {
      url      = "https://api.example.com"
      basepath = "/"
    }
  ]

  routes = [
    module.index_route.json,
    module.media_route.json,
    module.mock_route.json,
    module.lambda_route.json,
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| spec_version | The OpenAPI specification version | `string` | `"3.0.1"` | no |
| info | The OpenAPI info object | `map(string)` | n/a | yes |
| servers | The OpenAPI servers object | `list(map(string))` | n/a | yes |
| routes | The OpenAPI routes object | `list(string)` | n/a | yes |
| models | The OpenAPI models object | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| json | The JSON representation of the resource |
