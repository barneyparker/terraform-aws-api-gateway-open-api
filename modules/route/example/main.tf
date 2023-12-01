module "route" {
  source = "../"

  path = "/"
  handlers = [
    "abc",
    "def",
  ]
}
