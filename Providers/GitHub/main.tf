# GitHub is A providers we can use to create repos.
# We can access it by creating a token and storring it in a terraform.tfvars
# We then access them within the variables.tf file
provider "github" {
    token   = "${var.GITHUB_TOKEN}"
    organization = "${var.GITHUB_ORGANIZATION}"
}



