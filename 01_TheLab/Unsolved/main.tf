# Terrafroms true pwoer comes with the ability o work with multiple providers and manage those resources with a singular language
#  Create a provider block for the AWS provider 
terraform {
  backend "s3" {
    bucket = "justin-rice-tf-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  version = "~> 2.0"
  region  = "us-west-1"
}

resource "aws_s3_bucket" "new_s3_bucket" {
  bucket        = "justins-test-bucket-two"
  acl           = "private"
  force_destroy = "true"
  versioning {
    enabled = true
  }
}


resource "aws_vpc" "jrice_default_vpc_two" {
  cidr_block = "10.0.0.0/16"
}


# Once the AWS Provider is defined, create an AWS VPC wieth a default CIDR block of 10.0.0.0/16
