locals {
  custom_domain = var.dns != null && var.dns_zone != null
  authentication_type = var.user_pool_id != null ? "AMAZON_COGNITO_USER_POOLS" : (var.authorizer_lambda_arn != null ? "AWS_LAMBDA" : "API_KEY")
}
