variable "name" {
  type        = string
  description = "Name of the Swagger handler"
  default     = "swagger"
}

variable "api_execution_arn" {
  type        = string
  description = "API Gateway Execution Arn"
}