####################################
#   Elastic IPs
####################################
resource "aws_eip" "elastic_ip" {
  # instance = aws_instance.web.id
  domain   = "vpc"
}

####################################
#   Nat Gateway
####################################
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = var.eip-id
  subnet_id     = var.pub-sub1-id
  tags = {
    Name = "nat_gateway"
  }
}