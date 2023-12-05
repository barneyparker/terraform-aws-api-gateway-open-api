module "spec" {
  source = "../modules/openapi"

  info = {
    title       = "Example"
    description = "Example OpenAPI Spec"
    version     = "2023-11-30T00:00:00Z"
  }

  servers = [
    {
      url      = "https://8eooqixc2d.execute-api.us-east-1.amazonaws.com/{basePath}"
      basepath = "/example"
    }
  ]

  routes = [
    module.index_route.json,
    module.media_route.json,
    module.mock_route.json,
    module.lambda_proxy_route.json,
    module.swagger_route.json,
  ]

  models = {
    "Example" = jsonencode({
      type = "object"
      properties = {
        message = {
          type = "string"
        }
      }
    })
  }
}
