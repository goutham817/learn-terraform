resource "aws_instance" "instances" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0f0129348e05b5636"]
  tags = {
    Name = "test-${var.env}"
  }
}
variable "env" {}
