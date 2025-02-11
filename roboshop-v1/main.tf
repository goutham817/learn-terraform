resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-04bbe439f126319e7"]
tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = Z0831747KRD8G7UKNE8H
  name    = "frontend-dev.devopsb78.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}