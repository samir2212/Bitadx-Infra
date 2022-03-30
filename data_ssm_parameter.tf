data "aws_ssm_parameter" "mariadb_rds_master_password" {
  name = "/dev/mariadb_rds_master_password"
}
