output "iam_user_arn" {
  value = aws_iam_user.this.arn
}

output "iam_user_encrypted_password" {
  description = "The user encrypted password"
  value       = aws_iam_user_login_profile.this.encrypted_password
}

output "iam_user_password" {
  description = "The user password"
  value       = aws_iam_user_login_profile.this.password
}

output "iam_access_key_id" {
  description = "The access key ID"
  value       = try(aws_iam_access_key.this[0].id, "")
}

output "iam_access_key_secret" {
  description = "The access key secret"
  value       = try(aws_iam_access_key.this[0].secret, "")
  sensitive   = true
}
