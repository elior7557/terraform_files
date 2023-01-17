
# Neworking VPC And Subnets

# Crate a VPC
resource "aws_vpc" "easyway-elior" {
  cidr_block = var.vpc_cidr
  tags = merge(var.common_tags, {
    Name = var.vpc_name
  })

}

# Create Subnets
resource "aws_subnet" "public-subnets" {
  count             = var.provision_second_subnet ? 2 : 1
  vpc_id            = aws_vpc.easyway-elior.id
  cidr_block        = var.subnet_cidr[count.index]
  availability_zone = var.subnet_az[count.index]
  tags = merge(var.common_tags, {
    Name = var.subnet_names[count.index]
  })
}



# IGW 
resource "aws_internet_gateway" "gw-easyway-elior" {
  vpc_id = aws_vpc.easyway-elior.id
  tags = merge(var.common_tags, {
    Name = "${var.vpc_name}-IGW"
  })
}

# RT
resource "aws_route_table" "mainrt-easyway-elior" {
  vpc_id = aws_vpc.easyway-elior.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-easyway-elior.id
  }

  tags = merge(var.common_tags, {
    Name = "RT-${var.vpc_name}-TF"
  })

}


// Assosiate subnets with route table that has IGW - Making subnets public
resource "aws_route_table_association" "a" {
  count          = var.provision_second_subnet ? 2 : 1
  subnet_id      = aws_subnet.public-subnets[count.index].id
  route_table_id = aws_route_table.mainrt-easyway-elior.id
}
