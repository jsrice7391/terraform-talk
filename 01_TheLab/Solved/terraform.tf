terraform {
  backend "s3" {
    bucket = "justin-rice-tf-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
