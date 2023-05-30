resource "aws_iam_user" "this" {
  name = var.name

  force_destroy = var.force_destroy
}

resource "aws_iam_user_login_profile" "this" {
  user = aws_iam_user.this.name

  password_length         = var.password_length
  password_reset_required = var.password_reset_required

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key,
    ]
  }
}

resource "aws_iam_access_key" "this" {
  count = var.create_iam_access_key ? 1 : 0

  user   = aws_iam_user.this.name
  status = var.iam_access_key_status
}
