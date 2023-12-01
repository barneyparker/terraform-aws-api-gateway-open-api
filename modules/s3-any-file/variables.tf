variable "bucket_name" {
  type        = string
  description = "S3 bucket where the files is stored"
}

variable "files_path" {
  type        = string
  description = "Path in the S3 bucket to the files to be served"
  default     = "index.html"
}

variable "path_parameter" {
  type        = string
  description = "Path parameter to be used in the API Gateway e.g. /media/{items}"
  default     = "items"
}
variable "role_arn" {
  type        = string
  description = "Role ARN to be assumed to serve the file"
}

variable "region" {
  type        = string
  description = "Region where the S3 bucket is located"
}
