
variable "aurora_version" {
  type = string
}

module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "8.3.1"

  name           = "test-db-aurora"
  engine         = "aurora-postgresql"
  engine_version = var.aurora_version

  master_username             = "postgres"
  master_password             = "postgres"
  manage_master_user_password = false

  storage_type = "aurora-iopt1"
  instances = {
    1 = {
      instance_class      = var.sku
      publicly_accessible = true
    }
  }

  vpc_id                 = module.vpc.vpc_id
  db_subnet_group_name   = module.vpc.database_subnet_group_name
  vpc_security_group_ids = [module.security_group.security_group_id]

  apply_immediately   = true
  skip_final_snapshot = true
  deletion_protection = false

  storage_encrypted = true

  enabled_cloudwatch_logs_exports = ["postgresql"]
  create_cloudwatch_log_group     = true
}
