resource "aws_acm_certificate" "cert" {
  domain_name       = "dashboard.bitadx.com"
  validation_method = "DNS"

  tags = {
    Name = "dashboard.bitadx.com"
    Environment = "${var.env}"
  }

  subject_alternative_names = [
    "www.dashboard.bitadx.com",
  ]

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }

  lifecycle {
    create_before_destroy = true
  }
}
