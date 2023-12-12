####################################
#   Public Subnet
####################################
resource "aws_subnet" "public_subnet1" {
  vpc_id     = var.vpc-id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "public_subnet1"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id     = var.vpc-id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet2"
  }
}

####################################
#   Private Subnet
####################################
resource "aws_subnet" "private_subnet1" {
  vpc_id     = var.vpc-id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "private_subnet1"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id     = var.vpc-id
  cidr_block = "10.0.12.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "private_subnet2"
  }
}
