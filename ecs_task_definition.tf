# module "ecs-container-definition" {
#   source           = "cloudposse/ecs-container-definition/aws"
#   version          = "0.58.1"
#   container_name   = "proxy-${var.project}-${var.env}"
#   container_image  = var.ecs_proxy_image_name
#   container_memory = 128

#   port_mappings = [
#     {
#       containerPort = 80
#       hostPort      = 80
#       protocol      = "tcp"
#     }
#   ]
#   log_configuration = {
#     logDriver = "awslogs",
#     options = {
#       awslogs-group  = "/ecs/${var.project}-${var.env}/proxy",
#       awslogs-region = var.aws_region,
#       awslogs-stream-prefix : "ecs",
#     }
#   }
#   environment_files = [
#     {
#       value = "${aws_s3_bucket.env-bucket.arn}/${var.env_file}"
#       "type" : "s3"
#     },
#   ]

# }
