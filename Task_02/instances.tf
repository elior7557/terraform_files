# Compute file 
# This file contains:
//ec2
//sg


resource "aws_instance" "easyway1" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  vpc_security_group_ids      = [aws_security_group.httpSSH.id]
  subnet_id                   = aws_subnet.subnet1.id
  associate_public_ip_address = var.associate_public_ip_address

  tags = merge(local.common_tags, {
    Name = var.first_ec2_name
  })
}

resource "aws_instance" "easyway2" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  vpc_security_group_ids      = [aws_security_group.httpSSH.id]
  subnet_id                   = aws_subnet.subnet2.id
  associate_public_ip_address = var.associate_public_ip_address
  tags = merge(local.common_tags, {
    Name = var.second_ec2_name
  })
}


