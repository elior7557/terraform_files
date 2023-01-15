# Compute file 
# This file contains:
//ec2
//sg


resource "aws_instance" "easyway1" {
  ami                         = "ami-03c476a1ca8e3ebdc" #eu-west-3
  instance_type               = "t3a.micro"
  vpc_security_group_ids      = [aws_security_group.httpSSH.id]
  subnet_id                   = aws_subnet.subnet1.id
  associate_public_ip_address = true

  tags = merge(local.common_tags, {
    Name = "easyWay1-Elior"
  })
}

resource "aws_instance" "easyway2" {
  ami                         = "ami-03c476a1ca8e3ebdc" #eu-west-3
  instance_type               = "t3a.micro"
  vpc_security_group_ids      = [aws_security_group.httpSSH.id]
  subnet_id                   = aws_subnet.subnet2.id
  associate_public_ip_address = true
  tags = merge(local.common_tags, {
    Name = "easyWay2-Elior"
  })
}


