data "aws_ami" "aws_ami" {
  owners      = ["amazon", "self"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}

module "webserver" {
  source = "./modules/web"

  instance_type = var.instance_type
  ami_id        = data.aws_ami.aws_ami.id
}

output "public_ip" {
  value = module.webserver.public_ip
}
