####################################
#   Public Route Table
####################################
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc-id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw-id
  }

  tags = {
    Name = "public_route_table"
  }
}

####################################
#   Association
####################################
resource "aws_route_table_association" "public-rt-association1" {
  subnet_id      = var.pub-sub2-id
  route_table_id = var.pub-rt-id
}
resource "aws_route_table_association" "public-rt-association2" {
  subnet_id      = var.pub-sub1-id
  route_table_id = var.pub-rt-id
}

####################################
#   Private Route Table
####################################
resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc-id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.ngw-id
  }

  tags = {
    Name = "private_route_table"
  }
}

####################################
#   Association
####################################
resource "aws_route_table_association" "private-rt-association1" {
  subnet_id      = var.pri-sub1-id
  route_table_id = var.pri-rt-id
}
resource "aws_route_table_association" "private-rt-association2" {
  subnet_id      = var.pri-sub2-id
  route_table_id = var.pri-rt-id
}