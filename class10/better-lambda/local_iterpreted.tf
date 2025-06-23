locals {
  lambda_info = { for i in local.lambda_definition : i.name => i }
}