variable "path" {
  type        = string
  description = "Path to these handlers"
}

variable "handlers" {
  type        = list(string)
  description = "List of method handlers"
  default     = []
}