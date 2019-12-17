resource "aws_codecommit_repository" "repository" {
  count           = length(var.repos)
  repository_name = lookup(element(var.repos, count.index), "name")
  description     = lookup(element(var.repos, count.index), "name")
  default_branch  = "master"
}


resource "aws_codebuild_project" "tf_codebuild_projects" {
  count         = length(var.repos)
  name          = "${lookup(element(var.repos, count.index), "name")}"
  description   = "Baler Codebuild Project for: ${lookup(element(var.repos, count.index), "name")}"
  build_timeout = var.timeout
  service_role  = var.role

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
    location        = "${lookup(element(var.repos, count.index), "github_url")}"
    git_clone_depth = 1
    buildspec       = "${lookup(element(var.repos, count.index), "buildspec")}"
  }
}



resource "aws_codebuild_webhook" "example" {
  count        = length(var.repos)
  project_name = "${lookup(element(var.repos, count.index), "name")}"

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

