# Compute file 
# This file contains:
//ec2
//sg


resource "aws_instance" "easyway1" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  vpc_security_group_ids      = [aws_security_group.httpSSH.id]
  subnet_id                   = var.subnet_ids[0]
  associate_public_ip_address = var.associate_public_ip_address

  tags = merge(var.common_tags, {
    Name = var.ec2_names[0]
  })

}

resource "aws_instance" "easyway2" {
  count                       = var.provision_second_ec2 ? 1 : 0
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  vpc_security_group_ids      = [aws_security_group.httpSSH.id]
  subnet_id                   = var.subnet_ids[1]
  associate_public_ip_address = var.associate_public_ip_address
  tags = merge(var.common_tags, {
    Name = var.ec2_names[1]
  })
}


