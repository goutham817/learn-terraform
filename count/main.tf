variable "instance" {
  default = [
    "frontend",
    "user",
    "shipping",
    "payment",
    "mysql",
    "mongodb",
    "rabbitmq",
    "redis",
    "catalogue",
    "dispatch",
    "cart",
  ]
}

resource "aws_instance" "instance" {
  count = length(var.instance)
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-04bbe439f126319e7"]
  tags = {
    Name = var.instance[count.index]
  }
}

resource "aws_route53_record" "record" {
  count = length(var.instance)
  zone_id = Z0831747KRD8G7UKNE8H
  name    = "${var.instance[count.index]}-dev.devopsb78.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[count.index].private_ip]
}