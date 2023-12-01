variable "method" {
  type        = string
  description = "HTTP method"
  default     = "get"

}
variable "model_name" {
  type        = string
  description = "Model name"
  default     = "Empty"
}

variable "content_type" {
  type        = string
  description = "Content-Type header MIME type"
  default     = "text/plain"
}

variable "response_body" {
  type        = string
  description = "Response body"
  default     = "Hello, World!"
}
