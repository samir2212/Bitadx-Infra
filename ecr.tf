resource "aws_ecr_repository" "proxy" {
  name                 = "proxy-${var.project}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}