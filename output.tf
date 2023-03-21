output "json_key" {
  value = base64decode(google_service_account_key.terraform_user_key.private_key)
}
