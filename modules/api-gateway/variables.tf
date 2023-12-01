variable "api_name" {
  type        = string
  description = "API Gateway Name"
}

variable "openapi_spec" {
  type        = string
  description = "OpenAPI Specification"
}

variable "endpoint_type" {
  type        = string
  description = "API Gateway Endpoint Type"
  default     = "REGIONAL"
}

variable "stage_name" {
  type        = string
  description = "API Gateway Stage Name"
  default     = "stage"
}

variable "log_retention_in_days" {
  type        = number
  description = "API Gateway Access Log Retention in Days"
  default     = 7

}

variable "access_log_format" {
  type        = string
  description = "API Gateway Access Log Format in JSON"
  default     = "{\"requestTime\":\"$context.requestTime\",\"requestId\":\"$context.requestId\",\"protocol\":\"$context.protocol\",\"domainName\":\"$context.domainName\",\"httpMethod\":\"$context.httpMethod\",\"requestPath\":\"$context.path\",\"stage\":\"$context.stage\",\"status\":\"$context.status\",\"requestHeader\":\"$context.requestHeader\",\"requestQuerystring\":\"$context.requestQuerystring\",\"integrationStatus\":\"$context.integration.status\",\"integrationType\":\"$context.integrationType\",\"responseHeader\":\"$context.responseHeader\"}"
}

variable "zone_id" {
  type        = string
  description = "Route53 Zone ID"
  default     = null
}

variable "domain" {
  type        = string
  description = "Domain Name"
  default     = null
}

variable "iam_policies" {
  type        = list(string)
  description = "IAM Policies to be added to the API Gateway Role"
  default     = []
}
