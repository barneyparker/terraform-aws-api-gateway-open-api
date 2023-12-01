resource "aws_api_gateway_rest_api" "this" {
  name = var.api_name
  body = var.openapi_spec

  endpoint_configuration {
    types = [var.endpoint_type]
  }
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id

  triggers = {
    redeployment = sha1(var.openapi_spec)
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "this" {
  deployment_id = aws_api_gateway_deployment.this.id
  rest_api_id   = aws_api_gateway_rest_api.this.id
  stage_name    = var.stage_name

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.this.arn
    format          = var.access_log_format
  }
}

resource "aws_api_gateway_account" "this" {
  cloudwatch_role_arn = aws_iam_role.this.arn
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/api-gateway/${aws_api_gateway_rest_api.this.name}"
  retention_in_days = var.log_retention_in_days
}

