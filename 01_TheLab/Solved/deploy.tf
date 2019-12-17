

resource "aws_s3_bucket" "new_s3_bucket" {
  bucket        = "justins-test-bucket"
  acl           = "private"
  force_destroy = "true"
  versioning {
    enabled = true
  }
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


resource "aws_instance" "test-server" {
  ami           = "ami-00068cd7555f543d5"
  instance_type = "t2.micro"
  tags = {
    Name       = "test_server"
    AnotherTag = "This one should work"
  }
}

