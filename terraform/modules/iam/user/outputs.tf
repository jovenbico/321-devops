output "iam_user_arn" {
  value = aws_iam_user.this.arn
}

output "iam_user_encrypted_password" {
  value = aws_iam_user_login_profile.this.encrypted_password
}

output "iam_user_password" {
  value = aws_iam_user_login_profile.this.password
}