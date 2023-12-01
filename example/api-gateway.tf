module "api" {
  source = "../modules/api-gateway"

  providers = {
    aws.global = aws.global
  }

  # API
  api_name     = "example"
  openapi_spec = module.spec.json

  # Domain
  zone_id = data.aws_route53_zone.zone.zone_id
  domain  = var.domain

  iam_policies = [
    data.aws_iam_policy_document.s3_access.json,
    data.aws_iam_policy_document.lambda.json,
  ]
}
