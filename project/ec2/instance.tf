data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

####################################
#   SSH Key
####################################
resource "aws_key_pair" "deployer-key" {
key_name = "deployer-key"
public_key = file("~/.ssh/testkey.pub")
}

####################################
#   Bastion Instance
####################################
resource "aws_instance" "bastion_instance"{
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = var.pub-sub1-id
  associate_public_ip_address = "true"
  user_data = file("userdata.template")

  key_name = aws_key_pair.deployer-key.key_name
  vpc_security_group_ids = [var.vpc-sg-id]
  tags = { Name = "bastion_instance" }
}