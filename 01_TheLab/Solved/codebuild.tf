# locals {
#   codebuild_projects = [
#     {
#       "project_name"      = "TF Talk Repo",
#       "github_repo"       = "",
#       "buildspec"         = "buildspec/buildspec.yml",
#       "local_cache_modes" = "LOCAL_DOCKER_LAYER_CACHE",
#     }
#   ]
# }
# resource "aws_codebuild_project" "tf_codebuild_projects" {
#   count         = length(local.codebuild_projects)
#   name          = "${lookup(element(local.codebuild_projects, count.index), "project_name")}"
#   description   = "Baler Codebuild Project for: ${lookup(element(local.codebuild_projects, count.index), "project_name")}"
#   build_timeout = "60"
#   service_role  = aws_iam_role_policy.tf_demo.name

#   environment {
#     compute_type    = "BUILD_GENERAL1_MEDIUM"
#     image           = "aws/codebuild/nodejs:10.14.1-1.7.0"
#     type            = "LINUX_CONTAINER"
#     privileged_mode = "true"
#   }
# }
