output "role_arn" {
  value = aws_iam_role.this.arn
}

output "role_name" {
  value = aws_iam_role.this.name
}

output "execution_arn" {
  value = aws_api_gateway_rest_api.this.execution_arn
}
