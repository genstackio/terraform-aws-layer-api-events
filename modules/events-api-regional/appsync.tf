resource "aws_appsync_api" "regional" {
  name = var.name

  event_config {
    auth_provider {
      auth_type = local.authentication_type
      dynamic "cognito_config" {
        for_each = "AMAZON_COGNITO_USER_POOLS" == local.authentication_type ? { x: 1 } : {}
        content {
          user_pool_id = var.user_pool_id
          aws_region   = data.aws_region.current.name
        }
      }
      dynamic "lambda_authorizer_config" {
        for_each = "AWS_LAMBDA" == local.authentication_type ? { x: 1 } : {}
        content {
          authorizer_uri                   = var.authorizer_lambda_arn
          authorizer_result_ttl_in_seconds = 300
        }
      }
    }
    connection_auth_mode {
      auth_type = local.authentication_type
    }
    default_publish_auth_mode {
      auth_type = local.authentication_type
    }
    default_subscribe_auth_mode {
      auth_type = local.authentication_type
    }
  }
}

resource "aws_appsync_domain_name" "regional" {
  count           = local.custom_domain ? 1 : 0
  domain_name     = var.dns
  certificate_arn = aws_acm_certificate.cert[0].arn
}

resource "aws_appsync_domain_name_api_association" "regional" {
  count       = local.custom_domain ? 1 : 0
  api_id      = aws_appsync_api.regional.api_id
  domain_name = aws_appsync_domain_name.regional[0].domain_name
}
