variable "test_ec2_sku" {
  type = string
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"

  name = "test-instance"

  instance_type               = var.test_ec2_sku
  key_name                    = "testdbkey"
  monitoring                  = true
  vpc_security_group_ids      = [module.security_group.security_group_id]

  # put it in a public subnet and associate a public IP for access
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
}
