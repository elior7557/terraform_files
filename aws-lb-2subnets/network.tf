
# Neworking VPC And Subnets

resource "aws_vpc" "easyway-elior" {
  cidr_block = var.vpc_cidr
  tags = merge(local.common_tags, {
    Name = var.vpc_name
  })

}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.easyway-elior.id
  cidr_block        = var.subnet_one_cidr
  availability_zone = var.subnet_one_az
  tags = merge(local.common_tags, {
    Name = var.subnet_one
  })

}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.easyway-elior.id
  cidr_block        = var.subnet_two_cidr
  availability_zone = var.subnet_two_az
  tags = merge(local.common_tags, {
    Name = var.subnet_two
  })

}


resource "aws_internet_gateway" "gw-easyway-elior" {
  vpc_id = aws_vpc.easyway-elior.id
  tags   = local.common_tags
}

resource "aws_route_table" "mainrt-easyway-elior" {
  vpc_id = aws_vpc.easyway-elior.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-easyway-elior.id
  }

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



