output "arn" {
  value = aws_appsync_api.regional.api_arn
}
output "dns" {
  value = aws_appsync_api.regional.dns
}
output "id" {
  value = aws_appsync_api.regional.api_id
}
output "endpoint" {
  value = local.custom_domain ? "https://${aws_appsync_domain_name.regional[0].domain_name}/event" : "https://${aws_appsync_api.regional.dns}/event"
}
