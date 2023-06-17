module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "db-test-vpc"
  cidr = local.vpc_cidr

  azs                          = local.azs
  public_subnets               = [for k, v in local.azs : cidrsubnet(local.split_cidrs[0], 2, k)]
  private_subnets              = [for k, v in local.azs : cidrsubnet(local.split_cidrs[1], 2, k)]
  database_subnets             = [for k, v in local.azs : cidrsubnet(local.split_cidrs[2], 2, k)]
  create_database_subnet_group = true

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name        = "test-sg-rds"
  description = "Complete PostgreSQL example security group"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    // Inbound PostgreSQL + SSH
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  // allow all outbound
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Allow all outbound"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
