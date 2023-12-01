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
