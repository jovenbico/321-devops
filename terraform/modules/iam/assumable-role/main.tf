data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = var.trusted_role_actions

    principals {
      type        = "AWS"
      identifiers = var.trusted_role_arns
    }

    principals {
      type        = "Service"
      identifiers = var.trusted_role_services
    }
  }
}

resource "aws_iam_role" "this" {
  name = var.role_name

  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "admin" {
  count = var.attach_admin_policy ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = var.admin_role_policy_arn
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_instance_profile ? 1 : 0
  name  = var.role_name
  role  = aws_iam_role.this.name
}