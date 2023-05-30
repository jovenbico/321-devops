resource "aws_iam_user" "this" {
  name = var.name

  force_destroy = var.force_destroy
}
