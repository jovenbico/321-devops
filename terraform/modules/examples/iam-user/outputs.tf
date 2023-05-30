output "module_iam_user_arn" {
  value = module.iam_user.iam_user_arn
}

output "module_iam_user_encrypted_password" {
  value = module.iam_user.iam_user_encrypted_password
}

output "module_iam_user_password" {
  value = module.iam_user.iam_user_password
}

output "module_iam_access_key_id" {
  value = module.iam_user.iam_access_key_id
}

output "module_iam_access_key_secret" {
  value     = module.iam_user.iam_access_key_secret
  sensitive = true
}
