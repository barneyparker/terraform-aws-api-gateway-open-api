# Terraform-AWS-API-Gateway-OpenAPI Lambda-Proxy Integration

This module creates a Lambda-Proxy integration for an API Gateway resource.

Designed to be used with the with the Route and OpenAPI modules.

## Usage

```hcl
module "lambda_proxy_integration" {
  source = "barneyparker/api-gateway-open-api//lambda-proxy"

  method = "get"
  invoke_arn = aws_lambda_function.example.invoke_arn
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| method | The HTTP method for the integration | `string` | 'get' | no |
| invoke\_arn | The Invoke ARN of the Lambda function to integrate with | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| json | The JSON representation of the integration |
