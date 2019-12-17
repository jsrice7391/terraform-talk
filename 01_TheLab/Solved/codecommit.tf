locals {
  repositories = [
    {
      "name"        = "tf-talk-repo",
      "description" = "This is the TF talk repo",
      "github_url"  = "https://github.com/jsrice7391/terraform-talk",
      "buildspec"   = "buildspec/buildspec.yml"
      }, {
      "name"        = "another-repo",
      "description" = "The other repo",
      "github_url"  = "https://github.com/jsrice7391/powershellvsts",
      "buildspec"   = "buildspec/buildspec.yml"
  }]
}

resource "aws_iam_role" "tf_demo_codebuild" {
  name               = "tf-demo-codebuild"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

module "codebuilds" {
  source = "./codetools"
  repos  = local.repositories
  role   = aws_iam_role.tf_demo_codebuild.name
}
