resource "aws_cloudwatch_log_group" "log" {
  count             = local.log_enabled ? 1 : 0
  name              = "/aws/appsync/apis/${var.name}"
  retention_in_days = 14
}
