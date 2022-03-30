variable "mariadb_password" {
  type = string
}

resource "aws_ssm_parameter" "secret" {
  name        = "/dev/mariadb_rds_master_password"
  description = "MariaDB DB password"
  type        = "SecureString"
  value       = var.mariadb_password
}
