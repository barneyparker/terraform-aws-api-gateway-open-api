# Terraform AWS API Gateway Open API

This module creates an API Gateway REST API from an Open API (Swagger) specification.  AWS provides a number of extensions to the Open API specification, and this module contains a number of submodules to simplify creating an OpenAPI document that implements the AWS extensions.

## Submodules

*TODO: * Add links to submodules as they are created

## Root API module

The root module creates an API Gateway REST API from an Open API (Swagger) document.  You can provide your own document, or use one of the submodules to generate one.

## Example Usage

```hcl
module "my_api" {
  source = "github.com/terraform-community-modules/tf_aws_api_gateway_open_api"

  name = "my_api"
  description = "My API"
  open_api_document = "${file("open_api.json")}"
}
```

## Inputs

TBD

## Outputs

TBD