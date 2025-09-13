resource "aws_iam_role" "log" {
  count              = var.log_enabled ? 1 : 0
  name               = "api-events-${var.name}-log-role"
  name_prefix        = null
  assume_role_policy = data.aws_iam_policy_document.log-assume-role.json
}
resource "aws_iam_role_policy" "log" {
  count       = var.log_enabled ? 1 : 0
  name        = "api-event-${var.name}-policy-log"
  name_prefix = null
  policy      = data.aws_iam_policy_document.log.json
  role        = aws_iam_role.log.id
}
