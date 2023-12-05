resource "aws_lambda_permission" "this" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/*"
}
