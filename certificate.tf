resource "aws_acm_certificate" "shapeshed_com" {
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

resource "aws_acm_certificate_validation" "shapeshed_com" {
  provider                = aws.us-east-1
  certificate_arn         = aws_acm_certificate.shapeshed_com.arn
  validation_record_fqdns = [for record in aws_route53_record.shapeshed_com_acm_validation : record.fqdn]
}

resource "aws_acm_certificate" "samornbo_com" {
  provider      = aws.us-east-1
  domain_name   = "samornbo.com"
  key_algorithm = "RSA_2048"
  subject_alternative_names = [
    "*.samornbo.com",
    "samornbo.com",
  ]
  tags              = {}
  tags_all          = {}
  validation_method = "DNS"

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}

resource "aws_acm_certificate_validation" "samornbo_com" {
  provider                = aws.us-east-1
  certificate_arn         = aws_acm_certificate.samornbo_com.arn
  validation_record_fqdns = [for record in aws_route53_record.samornbo_com_acm_validation : record.fqdn]
}
