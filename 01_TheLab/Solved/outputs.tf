output "vpc_id" {
  value       = "${aws_vpc.jrice_default_vpc.id}"
  description = "The ID of the main VPC with in the Account"
}

output "vpc_name" {
  value       = aws_vpc.jrice_default_vpc.main_route_table_id
  description = "The name of the VPC"
}

output "private_subnet_id" {
  value = aws_subnet.public_subnet_one.id
}
