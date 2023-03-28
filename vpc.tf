resource "aws_vpc" "openredalert_vpc" {
  cidr_block = var.cidr-vpc

  tags = {
    Name = "OpenRedAlertVPC"
  }
}

resource "aws_subnet" "openredalert_subnet" {
  vpc_id            = aws_vpc.openredalert_vpc.id
  cidr_block        = var.cidr-subnet
  availability_zone = "eu-central-1a"

  tags = {
    Name = "OpenRedAlertSubnet"
  }
}

resource "aws_internet_gateway" "openredalert_igw" {
  vpc_id = aws_vpc.openredalert_vpc.id

  tags = {
    Name = "OpenRedAlertIGW"
  }
}

resource "aws_route_table" "openredalert_route_table" {
  vpc_id = aws_vpc.openredalert_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.openredalert_igw.id
  }

  tags = {
    Name = "OpenRedAlertRouteTable"
  }
}

resource "aws_route_table_association" "openredalert_subnet_association" {
  subnet_id      = aws_subnet.openredalert_subnet.id
  route_table_id = aws_route_table.openredalert_route_table.id
}