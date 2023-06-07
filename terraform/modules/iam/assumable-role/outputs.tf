output "iam_role_arn" {
  value = aws_iam_role.this.arn
}

output "iam_instance_profile_arn" {
  value = try(aws_iam_instance_profile.this[0].arn, "")
}