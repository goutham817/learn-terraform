variable "instances" {
  default = {
    fronted = {}
    mongodb = {}
    catalogue ={}
    redis = {}
    user = {}
    cart = {}
    dispatch= {}
    shipping = {}
  }
}

resource "aws_instance" "instances" {
  for_each = var.instances
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0f0129348e05b5636"]
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "record" {
  for_each = var.instances
  zone_id = "Z0831747KRD8G7UKNE8H"
  name    = "${each.key}-dev.devopsb78.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.instances[each.key].private_ip]
}