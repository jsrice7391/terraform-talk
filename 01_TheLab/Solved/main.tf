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
}

resource "aws_subnet" "public_subnet_two" {
  vpc_id     = aws_vpc.jrice_default_vpc.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_security_group" "applications" {

  name = "applications-security-groups"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



# resource "aws_instance" "app_server" {
#   ami                    = "ami-00068cd7555f543d5"
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.applications.id]


#   user_data = <<-EOF
#               #!/bin/bash
#               echo "Hello, World" > index.html
#               nohup busybox httpd -f -p 8080 &
#               EOF

#   tags = {
#     Name = "AppServer"
#   }
# }

resource "aws_instance" "test-server" {
  ami           = "ami-00068cd7555f543d5"
  instance_type = "t2.micro"

  tags = {
    Name       = "test_server"
    AnotherTag = "This one should work"
  }
}


resource "aws_subnet" "private_subnet_one" {
  vpc_id                          = aws_vpc.jrice_default_vpc.id
  cidr_block                      = "10.0.3.0/24"
  assign_ipv6_address_on_creation = false

}

resource "aws_subnet" "private_subnet_two" {
  vpc_id                          = aws_vpc.jrice_default_vpc.id
  cidr_block                      = "10.0.4.0/24"
  assign_ipv6_address_on_creation = false

}

