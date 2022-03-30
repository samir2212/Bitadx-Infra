module "ecs-service-fargate" {
  source  = "cloudposse/ecs-alb-service-task/aws"
  version = "0.60.0"

  name                      = "${var.project}-${var.env}"
  ecs_cluster_arn           = module.ecs.ecs_cluster_arn
  container_definition_json = "[${module.ecs-container-definition.json_map_encoded}]"
  vpc_id                    = module.vpc.vpc_id
  subnet_ids                = module.vpc.private_subnets[*]

  ecs_load_balancers = [
    {
      target_group_arn = module.alb.target_group_arns[0],
      container_name   = "proxy-${var.project}-${var.env}",
      container_port   = 80,
      elb_name         = null
    },
  ]

  ignore_changes_desired_count   = false
  ignore_changes_task_definition = false
  launch_type                    = "FARGATE"
  network_mode                   = "awsvpc"
  security_group_ids             = [module.sg_alb.security_group_id]
  desired_count                  = 1
}
