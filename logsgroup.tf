module "container_cloudwatch_loggroup" {
  source            = "terraform-aws-modules/cloudwatch/aws//modules/log-group"
  version           = "2.3.0"
  name              = "/ecs/${var.project}/${var.env}/proxy"
  retention_in_days = 30
}
