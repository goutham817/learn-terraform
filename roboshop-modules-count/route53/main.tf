resource "aws_route53_record" "record" {
  zone_id = "Z0831747KRD8G7UKNE8H"
  name    = "${var.instance_name}-dev.devopsb78.online"
  type    = "A"
  ttl     = 30
  records = [var.ip_address]
}

variable "instance_name" {}
variable "ip_address" {}