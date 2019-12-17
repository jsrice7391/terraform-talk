output "vpc_id" {
  value       = "${aws_vpc.jrice_default_vpc.id}"
  description = "The ID of the main VPC with in the Account"
}

