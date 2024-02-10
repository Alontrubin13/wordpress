resource "aws_key_pair" "wordpress-key" {
  key_name   = "ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDT3gkxA0U61rHGxOdsHGzxE2MPYCS5OTZWUrJcg27RyMwYDqAQ0DSDSWZDoYtQQnV4xa2IOWv4o2cytnQPbxMkSbB+LlrVmt6Z40AlSh1+QpcwF6dPm4pOGJcVo3aUi0DV9Fw47F3HrW16h4QkV2raJODQ8ZL30EgqiMem+dn7FVzp95f6FkDxrV3SKntuux3YBcQDxaNtLv5YWD3sl+Gl0fH5xM5HZWykQ//u7y+A3V6kw2fzawJKp7hwytcWqKiqbvSQ7RkfTmo7LVn70m6hyXl0oflmO8VR2ViooaIP1fmSjZNptbnqdwjDjFPNJ/wXuLJm/nk1LNJDsEJN1CT/ alontrubin@Alons-MacBook-Pro.local"
}

resource "aws_instance" "wordpress-eC2" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = aws_key_pair.wordpress-key.id
  vpc_security_group_ids = [aws_security_group.wordpress-sg.id]
  subnet_id = aws_subnet.public-subnet1.id
  associate_public_ip_address = true

  tags = {
    Name = "wordpress-ec2"
  }
}