variable "spec_version" {
  type        = string
  description = "Version of the OpenAPI spec"
  default     = "3.0.1"
}

variable "info" {
  type = object({
    title       = string,
    description = string,
    version     = string
  })
  description = "API Gateway Info"
  default     = null
}

variable "servers" {
  type = list(object({
    url      = string,
    basepath = string
  }))
  description = "API Gateway Servers"
  default     = []
}

variable "routes" {
  type        = list(string)
  description = "API Gateway Routes and their Integrations"
  default     = []
}

variable "models" {
  type        = map(string)
  description = "API Gateway Models"
  default     = {}
}
