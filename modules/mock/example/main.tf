module "mock" {
  source = "../"

  method        = "get"
  model_name    = "Example"
  content_type  = "application/json"
  response_body = jsonencode({ message = "Hello World!" })
}
