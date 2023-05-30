provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
}

module "iam_policy" {
  source = "../../iam/policy"

  name        = "S3RestrictedROPolicy"
  description = "S3 Restricted Read-Only Policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:List*",
          "s3-object-lambda:Get*",
          "s3-object-lambda:List*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}
