module "mariadb-master-rds" {
  source                    = "terraform-aws-modules/rds/aws"
  version                   = "3.5.0"
  identifier                = "${var.env}-${var.project}-mariadb-rds-master"
  storage_type              = "gp2"
  allocated_storage         = "20"
  max_allocated_storage     = "40"
  create_db_parameter_group = false
  engine                    = "mariadb"
  major_engine_version      = "10.4"
  engine_version            = "10.4.24"
  instance_class            = "db.t3.micro"
  port                      = "3306"
  create_db_subnet_group    = true
  subnet_ids                = module.vpc.private_subnets[*]
  username                  = var.username
  password                  = data.aws_ssm_parameter.mariadb_rds_master_password.value
  backup_retention_period   = 7
  create_monitoring_role    = true
  deletion_protection       = false
  monitoring_interval  = 60
  monitoring_role_name = "MyRDSMonitoringRole"
  tags = {
    Environment = "${var.env}"
  }

  multi_az               = true
  vpc_security_group_ids = ["${aws_security_group.mariadb-rds-sg.id}"]
}

# ECS to RDS
resource "aws_security_group" "mariadb-rds-sg" {
  name        = "${var.env}-${var.project}-mariadb-rds-sg"
  description = "allow inbound access from the ECS tasks only"
  vpc_id      = module.vpc.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = "3306"
    to_port         = "3306"
    cidr_blocks     = [
      var.vpc_cidr_private_a,
      var.vpc_cidr_private_b
    ]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
