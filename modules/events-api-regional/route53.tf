resource "aws_route53_record" "cert_validation" {
  count             = local.custom_domain ? 1 : 0
  name    = element(tolist(aws_acm_certificate.cert[0].domain_validation_options), 0).resource_record_name
  type    = element(tolist(aws_acm_certificate.cert[0].domain_validation_options), 0).resource_record_type
  zone_id = var.dns_zone
  records = [element(tolist(aws_acm_certificate.cert[0].domain_validation_options), 0).resource_record_value]
  ttl     = 60
}
