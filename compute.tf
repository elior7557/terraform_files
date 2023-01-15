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


// Seurity Groups
resource "aws_security_group" "httpSSH" {
  name        = "eliorSG"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.easyway-elior.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

