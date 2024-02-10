resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  identifier                 = "mysql"
  username             = "admin"
  password             = "adminadmin"
  db_subnet_group_name = aws_db_subnet_group.private_subnet.name
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
}

resource "aws_db_subnet_group" "private_subnet" {
  name       = "private_subnet"
  subnet_ids = [aws_subnet.private-subnet1.id, aws_subnet.private-subnet3.id, aws_subnet.private-subnet3.id]
}