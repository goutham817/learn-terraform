resource "aws_instance" "instance" {
  ami           =
  instance_type =

  tags = {
    Name = "HelloWorld"
  }
}