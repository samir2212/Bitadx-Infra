# terraform-bitadx


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | terraform-aws-modules/alb/aws | 6.4.0 |
| <a name="module_container_cloudwatch_loggroup"></a> [container\_cloudwatch\_loggroup](#module\_container\_cloudwatch\_loggroup) | terraform-aws-modules/cloudwatch/aws//modules/log-group | 2.3.0 |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | terraform-aws-modules/ecs/aws | 3.4.1 |
| <a name="module_mariadb-master-rds"></a> [mariadb-master-rds](#module\_mariadb-master-rds) | terraform-aws-modules/rds/aws | 3.5.0 |
| <a name="module_sg_alb"></a> [sg\_alb](#module\_sg\_alb) | terraform-aws-modules/security-group/aws | 4.7.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 2.77.0 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_appautoscaling_policy.ecs_policy_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.ecs_policy_memory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.ecs_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_cloudwatch_log_group.php_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.proxy_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecr_repository.php_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecs_service.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.php_app_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.pull_env_from_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.task_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs-task-execution-role-policy-attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_role_s3_data_bucket_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.env-bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.env-bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_public_access_block.env-bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.env-bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.env-bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.mariadb-rds-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_iam_policy_document.s3_data_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_ssm_parameter.mariadb_rds_master_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"eu-central-1"` | no |
| <a name="input_az_list"></a> [az\_list](#input\_az\_list) | n/a | `list(any)` | <pre>[<br>  "eu-central-1a",<br>  "eu-central-1b"<br>]</pre> | no |
| <a name="input_ecs_php_app"></a> [ecs\_php\_app](#input\_ecs\_php\_app) | n/a | `string` | `"php_app"` | no |
| <a name="input_ecs_proxy"></a> [ecs\_proxy](#input\_ecs\_proxy) | n/a | `string` | `"proxy"` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment name | `string` | `"dev"` | no |
| <a name="input_env_file"></a> [env\_file](#input\_env\_file) | n/a | `string` | `"dev.env"` | no |
| <a name="input_php_app_image"></a> [php\_app\_image](#input\_php\_app\_image) | n/a | `string` | `"840128973210.dkr.ecr.eu-central-1.amazonaws.com/php_app-dev:main_e85fabc0"` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | `"bitadx"` | no |
| <a name="input_proxy_image"></a> [proxy\_image](#input\_proxy\_image) | n/a | `string` | `"840128973210.dkr.ecr.eu-central-1.amazonaws.com/proxy-dev:main_e85fabc0"` | no |
| <a name="input_username"></a> [username](#input\_username) | n/a | `string` | `"admin"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | `"10.200.0.0/16"` | no |
| <a name="input_vpc_cidr_private_a"></a> [vpc\_cidr\_private\_a](#input\_vpc\_cidr\_private\_a) | n/a | `string` | `"10.200.11.0/24"` | no |
| <a name="input_vpc_cidr_private_b"></a> [vpc\_cidr\_private\_b](#input\_vpc\_cidr\_private\_b) | n/a | `string` | `"10.200.12.0/24"` | no |
| <a name="input_vpc_cidr_public_a"></a> [vpc\_cidr\_public\_a](#input\_vpc\_cidr\_public\_a) | n/a | `string` | `"10.200.1.0/24"` | no |
| <a name="input_vpc_cidr_public_b"></a> [vpc\_cidr\_public\_b](#input\_vpc\_cidr\_public\_b) | n/a | `string` | `"10.200.2.0/24"` | no |

## Outputs

No outputs.
