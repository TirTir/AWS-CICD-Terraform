####################################
#   Internet Gateway
####################################
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = var.vpc-id
  tags = {
    Name = "internet-gateway"
  }
}