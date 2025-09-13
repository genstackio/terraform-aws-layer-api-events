variable "name" {
  type = string
}
variable "dns" {
  type    = string
  default = null
}
variable "dns_zone" {
  type    = string
  default = null
}
variable "user_pool_id" {
  type    = string
  default = null
}
variable "authorizer_lambda_arn" {
  type    = string
  default = null
}
variable "log_level" {
  type    = string
  default = null
}
