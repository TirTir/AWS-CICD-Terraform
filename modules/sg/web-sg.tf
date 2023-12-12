
####################################
#   WEB Security Group
####################################
resource "aws_security_group" "web_security_group" {
  name        = "web_security_group"
  description = "Allow SSH/HTTP inbound traffic"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups = [var.vpc-sg-id]
  }

  ingress {
    description      = "Allow HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.0.11.0/24", "10.0.12.0/24"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_security_group"
  }
}


####################################
#   WAS Security Group
####################################
resource "aws_security_group" "was_security_group" {
  name        = "was_security_group"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups = [var.vpc-sg-id]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.0.11.0/24", "10.0.12.0/24"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "was_security_group"
  }
}
