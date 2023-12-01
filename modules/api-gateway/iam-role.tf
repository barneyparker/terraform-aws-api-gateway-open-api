resource "aws_iam_role" "this" {
  name               = "${var.api_name}-role"
  assume_role_policy = data.aws_iam_policy_document.this_assume.json

  inline_policy {
    name   = "Permissions"
    policy = data.aws_iam_policy_document.this.json
  }
}

data "aws_iam_policy_document" "this_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      identifiers = ["apigateway.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "this" {

  override_policy_documents = var.iam_policies

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents",
      "logs:GetLogEvents",
      "logs:FilterLogEvents",
    ]

    resources = ["*"]
  }
}
