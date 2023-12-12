output "vpc_id" { 
  description = "VPC ID"
  value = aws_vpc.vpc.id
}

################### Subnet ###################
output "public_subnet1_id" {
  description = "Public Subnet1 ID"
  value = aws_subnet.public_subnet1.id
}
output "public_subnet2_id" {
  description = "Public Subnet2 ID"
  value = aws_subnet.public_subnet2.id
}
output "private_subnet1_id" {
  description = "Private Subnet1 ID"
  value = aws_subnet.private_subnet1.id
}
output "private_subnet2_id" {
  description = "Private Subnet2 ID"
  value = aws_subnet.private_subnet2.id
}
###################################################

################### Route Table ###################
output "public_route_table_id" {
  description = "Public Route Table ID"
  value = aws_route_table.public_route_table.id
}
output "private_route_table_id" {
  description = "Private Route Table ID"
  value = aws_route_table.private_route_table.id
}
###################################################

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value = aws_internet_gateway.internet_gateway.id
}
output "nat_gateway_id" {
  description = "Nat Gateway ID"
  value = aws_nat_gateway.nat_gateway.id
}
output "elastic_ip_id" {
  description = "Elastic IP ID"
  value = aws_eip.elastic_ip.id
}