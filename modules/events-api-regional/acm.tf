resource "aws_acm_certificate_validation" "cert" {
  count                   = local.custom_domain ? 1 : 0
  provider                = aws.acm
  certificate_arn         = aws_acm_certificate.cert[0].arn
  validation_record_fqdns = [aws_route53_record.cert_validation[0].fqdn]
}

resource "aws_acm_certificate" "cert" {
  count             = local.custom_domain ? 1 : 0
  domain_name       = var.dns
  validation_method = "DNS"
  provider          = aws.acm
  lifecycle {
    create_before_destroy = true
  }
}
