terraform {
  backend "s3" {
    role   = "arn:aws:iam::777978046959:role/tf-demo-codebuild"
    bucket = "justin-rice-tf-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
