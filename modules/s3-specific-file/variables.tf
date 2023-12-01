variable "bucket_name" {
  type        = string
  description = "S3 bucket where the files is stored"
}

variable "filename" {
  type        = string
  description = "Name of the file to be downloaded"
  default     = "index.html"
}

variable "mime_type" {
  type        = string
  description = "MIME type of the file to be served"
  default     = "text/html"
}

variable "role_arn" {
  type        = string
  description = "Role ARN to be assumed to serve the file"
}

variable "region" {
  type        = string
  description = "Region where the S3 bucket is located"
}
