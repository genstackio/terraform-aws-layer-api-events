resource "aws_cloudwatch_log_group" "log" {
  count             = local.log_enabled ? 1 : 0
  name              = "/aws/appsync/apis/${aws_appsync_api.regional.api_id}"
  retention_in_days = 14
}
