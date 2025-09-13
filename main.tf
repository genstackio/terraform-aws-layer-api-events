module "regional-api" {
  source       = "./modules/events-api-regional"

  name                  = var.name
  dns                   = var.dns
  dns_zone              = var.dns_zone
  user_pool_id          = var.user_pool_id
  authorizer_lambda_arn = var.authorizer_lambda_arn
  log_level             = var.log_level

  providers    = {
    aws     = aws
    aws.acm = aws.acm
  }
}
