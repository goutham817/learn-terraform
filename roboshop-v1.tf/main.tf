resource "aws_instance" "frontend" {
  ami           = 973714476881
  instance_type = "t3.small"
  vpc_security_group_ids = 703671899885

  tags = {
    Name = "frontend"
  }
}