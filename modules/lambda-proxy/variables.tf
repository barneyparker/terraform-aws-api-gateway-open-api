variable "method" {
  type        = string
  description = "HTTP method"
  default     = "get"
}

variable "invoke_arn" {
  type        = string
  description = "Lambda function arn"
}
