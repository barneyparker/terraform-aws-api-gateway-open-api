module "swagger_route" {
  source = "../modules/route"

  path = "/swagger"
  handlers = [
    module.swagger.json
  ]
}

module "swagger" {
  source = "../modules/swagger"

  name              = "example-swagger"
  api_execution_arn = module.api.execution_arn
}
