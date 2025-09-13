data aws_region "current" {
}

data "aws_iam_policy_document" "log-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = "appsync.amazonaws.com"
    }
  }
}
data "aws_iam_policy_document" "log" {
  statement {
      actions   = ["logs:CreateLogStream", "logs:PutLogEvents"]
      resources = [aws_cloudwatch_log_group.log.arn]
      effect    = "Allow"
  }
}
