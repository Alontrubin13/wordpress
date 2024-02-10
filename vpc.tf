resource "aws_vpc" "wordpress-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "wordpress-vpc"
  }
}

resource "aws_internet_gateway" "wordpress_igw" {
  vpc_id = aws_vpc.wordpress-vpc.id

  tags = {
    Name = "wordpress_igw"
  }
}

resource "aws_route_table" "wordpess-rt" {
  vpc_id = aws_vpc.wordpress-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wordpress_igw.id
  }
  tags = {
    Name = "wordpess-rt"
  }
}

resource "aws_subnet" "public-subnet1" {
  vpc_id     = aws_vpc.wordpress-vpc.id
  cidr_block = "10.0.0.0/20"

  tags = {
    Name = "public-subnet1"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id     = aws_vpc.wordpress-vpc.id
  cidr_block = "10.0.16.0/20"

  tags = {
    Name = "public-subnet2"
  }
}

resource "aws_subnet" "public-subnet3" {
  vpc_id     = aws_vpc.wordpress-vpc.id
  cidr_block = "10.0.32.0/20"

  tags = {
    Name = "public-subnet3"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.wordpess-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.wordpess-rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.public-subnet3.id
  route_table_id = aws_route_table.wordpess-rt.id
}

resource "aws_subnet" "private-subnet1" {
  vpc_id     = aws_vpc.wordpress-vpc.id
  cidr_block = "10.0.128.0/20"
  availability_zone = "us-east-1a" 

  tags = {
    Name = "private-subnet1"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id     = aws_vpc.wordpress-vpc.id
  cidr_block = "10.0.144.0/20"
  availability_zone = "us-east-1b" 

  tags = {
    Name = "private-subnet2"
  }
}

resource "aws_subnet" "private-subnet3" {
  vpc_id     = aws_vpc.wordpress-vpc.id
  cidr_block = "10.0.160.0/20"
  availability_zone = "us-east-1c"
   
  tags = {
    Name = "private-subnet3"
  }
}