provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_vpc" "jrice_default_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.jrice_default_vpc.id
}

resource "aws_subnet" "public_subnet_one" {
  vpc_id                  = aws_vpc.jrice_default_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.gw]
  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "public_subnet_two" {
  vpc_id     = aws_vpc.jrice_default_vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "Public Subnet Two"
  }
}


resource "aws_subnet" "private_subnet_one" {
  vpc_id                          = aws_vpc.jrice_default_vpc.id
  cidr_block                      = "10.0.3.0/24"
  assign_ipv6_address_on_creation = false

  tags = {
    Name = "Private Subnet 1"
  }

}

resource "aws_subnet" "private_subnet_two" {
  vpc_id                          = aws_vpc.jrice_default_vpc.id
  cidr_block                      = "10.0.4.0/24"
  assign_ipv6_address_on_creation = false

  tags = {
    Name = "Private Subnet 2"
  }

}

