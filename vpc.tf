
# Neworking VPC And Subnets

resource "aws_vpc" "easyway-elior" {
  cidr_block = "10.0.0.0/16"
  tags = merge(local.common_tags, {
    Name = "${var.vpc_name}"
  })

}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.easyway-elior.id
  cidr_block = "10.0.1.0/24"
  tags = merge(local.common_tags, {
    Name = "${var.subnet_one}"
  })

}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.easyway-elior.id
  cidr_block = "10.0.2.0/24"
  tags = merge(local.common_tags, {
    Name = "${var.subnet_two}"
  })
}


resource "aws_internet_gateway" "gw-easyway-elior" {
  vpc_id = aws_vpc.easyway-elior.id
  tags   = local.common_tags
  # depends_on = [
  #   aws_vpc.easyway-elior
  # ]
}

resource "aws_route_table" "mainrt-easyway-elior" {
  vpc_id = aws_vpc.easyway-elior.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-easyway-elior.id
  }


  # depends_on = [
  #   aws_vpc.easyway-elior,
  #   aws_internet_gateway.gw-easyway-elior
  # ]

  tags = local.common_tags

}

// Assosiate subnets with route table that has IGW - Making subnets public
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.mainrt-easyway-elior.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.mainrt-easyway-elior.id
}


variable "vpc_name" {
  default = "easyName_vpc_elior"
}

variable "subnet_one" {
  default = "public_sb1_easyway_elior"
}

variable "subnet_two" {
  default = "public_sb2_easyway_elior"
}
