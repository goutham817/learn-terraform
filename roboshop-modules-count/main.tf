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

module "ec2" {
  count = length(var.instance)
  source = "./ec2"
  instance_name = var.instance[count.index]
}

module "route53" {
  count = length(var.instance)
  source = "./route53"
  instance_name = var.instance[count.index]
  ip_address = module.ec2[count.index].ip_address
}