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
      "github_url"  = "https://github.com/jsrice7391/terraform-talk",
      "buildspec"   = "buildspec/buildspec.yml"
  }]
}


resource "aws_codecommit_repository" "repository" {
  count           = length(local.repositories)
  repository_name = lookup(element(local.repositories, count.index), "name")
  description     = lookup(element(local.repositories, count.index), "name")
  default_branch  = "master"
}


resource "aws_codebuild_webhook" "example" {
  count        = length(local.repositories)
  project_name = "${lookup(element(local.repositories, count.index), "name")}"

  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH"
    }

    filter {
      type    = "HEAD_REF"
      pattern = "master"
    }
  }
}


resource "aws_codebuild_project" "tf_codebuild_projects" {
  count         = length(local.repositories)
  name          = "${lookup(element(local.repositories, count.index), "name")}"
  description   = "Baler Codebuild Project for: ${lookup(element(local.repositories, count.index), "name")}"
  build_timeout = "60"
  service_role  = aws_iam_role.tf_demo_codebuild.name

  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type    = "BUILD_GENERAL1_MEDIUM"
    image           = "aws/codebuild/nodejs:10.14.1-1.7.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = "true"
  }

  source {
    type            = "GITHUB"
    location        = "${lookup(element(local.repositories, count.index), "github_url")}"
    git_clone_depth = 1
    buildspec       = "${lookup(element(local.repositories, count.index), "buildspec")}"
  }
}
