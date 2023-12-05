variable "method" {
  type        = string
  description = "HTTP method"
  default     = "get"
}

variable "invoke_arn" {
  type        = string
  description = "Lambda function Invoke arn"
}

variable "arn" {
  type        = string
  description = "Lambda function arn"
}

variable "api_execution_arn" {
  type        = string
  description = "API Gateway Execution Arn"
}
