resource "aws_acm_certificate" "cert-shapeshed-com" {
  provider      = aws.us-east-1
  domain_name   = "shapeshed.com"
  key_algorithm = "RSA_2048"
  subject_alternative_names = [
    "*.shapeshed.com",
    "shapeshed.com",
  ]
  tags              = {}
  tags_all          = {}
  validation_method = "DNS"

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}

resource "aws_acm_certificate" "cert-www-shapeshed-com" {
  provider      = aws.us-east-1
  domain_name   = "www.shapeshed.com"
  key_algorithm = "RSA_2048"
  subject_alternative_names = [
    "www.shapeshed.com",
  ]
  tags              = {}
  tags_all          = {}
  validation_method = "DNS"

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}

