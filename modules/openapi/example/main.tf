module "spec" {
  source = "../"

  info = {
    title       = "Example API"
    description = "Example API"
    version     = "1.0.0"
  }

  servers = [
    {
      url      = "https://api.example.com"
      basepath = "/"
    }
  ]
}