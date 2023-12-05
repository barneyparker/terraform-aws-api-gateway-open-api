module "swagger" {
  source = "barneyparker/simple-lambda/aws"

  name         = var.name
  description  = "API Gateway Swagger Export Handler"
  handler      = "index.handler"
  source_dir   = "${path.module}/src"
  runtime      = "nodejs18.x"
  timeout      = 3
  memory_size  = 128
  architecture = "arm64"
  policies = [
    data.aws_iam_policy_document.swagger.json,
  ]
}

module "this" {
  source = "../lambda-proxy"

  method            = "get"
  invoke_arn        = module.swagger.invoke_arn
  arn               = module.swagger.arn
  api_execution_arn = var.api_execution_arn
}

data "aws_iam_policy_document" "swagger" {
  statement {
    actions = ["apigateway:GET"]

    resources = [
      "*"
    ]
  }
}
