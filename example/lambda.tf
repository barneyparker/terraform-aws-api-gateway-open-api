module "function" {
  source  = "barneyparker/simple-lambda/aws"
  version = "1.0.1"

  name         = "example-lambda"
  description  = "example for testing"
  handler      = "index.handler"
  runtime      = "nodejs18.x"
  source_dir   = "${path.module}/functions/example"
  architecture = "arm64"
  memory_size  = 128
  timeout      = 3
}

module "lambda_proxy_route" {
  source = "../modules/route"

  path = "/lambda"
  handlers = [
    module.lambda_proxy.json
  ]
}


module "lambda_proxy" {
  source = "../modules/lambda-proxy"

  method            = "get"
  invoke_arn        = module.function.invoke_arn
  arn               = module.function.arn
  api_execution_arn = module.api.execution_arn
}

data "aws_iam_policy_document" "lambda" {
  statement {
    actions   = ["lambda:InvokeFunction"]
    resources = ["*"]
  }
}
