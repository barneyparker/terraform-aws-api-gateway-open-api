module "mock_route" {
  source = "../modules/route"

  path = "/mock"
  handlers = [
    module.mock.json
  ]
}

module "mock" {
  source = "../modules/mock"

  method        = "get"
  model_name    = "Example"
  content_type  = "application/json"
  response_body = jsonencode({ message = "Hello World!" })
}
