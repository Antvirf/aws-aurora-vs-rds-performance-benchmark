
variable "rds_version" {
  type = string
}

variable "sku" {
  type = string
}


module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = " 5.9.0"

  identifier = "test-db-rds"

  engine               = "postgres"
  engine_version       = var.rds_version
  family               = "postgres${var.rds_version}" # DB parameter group
  major_engine_version = var.rds_version              # DB option group
  instance_class       = var.sku

  allocated_storage     = 100
  max_allocated_storage = 100

  db_name                = "postgres"
  username               = "postgres"
  create_random_password = false
  password               = "postgres"
  port                   = 5432

  publicly_accessible    = true
  multi_az               = false
  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [module.security_group.security_group_id]

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  create_cloudwatch_log_group     = true

  backup_retention_period = 1
  skip_final_snapshot     = true
  deletion_protection     = false

  storage_encrypted = true

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60
  monitoring_role_name                  = "example-monitoring-role-name"
  monitoring_role_use_name_prefix       = true
  monitoring_role_description           = "Description for monitoring role"
}
