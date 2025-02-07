resource "aws_instance" "frontend" {
  ami           = ami-09c813fb71547fc4f
  instance_type = "t3.small"
  vpc_security_group_ids = sg-02a4f5b772f901450

  tags = {
    Name = "frontend"
  }
}