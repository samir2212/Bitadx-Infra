resource "aws_acm_certificate" "bitadx" {
  domain_name       = "bitadx.com"
  validation_method = "DNS"

  tags = {
    Name = "bitadx.com"
    Environment = "${var.env}"
  }

  subject_alternative_names = [
    "*.bitadx.com",
  ]

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }

  lifecycle {
    create_before_destroy = true
  }
}
