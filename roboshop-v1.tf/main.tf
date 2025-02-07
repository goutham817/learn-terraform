resource "aws_instance" "frontend" {
  ami           = 973714476881
  instance_type = "t3.small"
  vpc_security_group_ids = sg-04bbe439f126319e7

  tags = {
    Name = "frontend"
  }
}