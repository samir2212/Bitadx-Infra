resource "aws_ecr_repository" "proxy" {
  name                 = "${var.ecs_proxy}-${var.env}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "php_app" {
  name                 = "${var.ecs_php_app}-${var.env}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
