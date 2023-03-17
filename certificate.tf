# tflint-ignore: terraform_naming_convention
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

# tflint-ignore: terraform_naming_convention
resource "aws_acm_certificate_validation" "cert-shapeshed-com-validation" {
  provider                = aws.us-east-1
  certificate_arn         = aws_acm_certificate.cert-shapeshed-com.arn
  validation_record_fqdns = [for record in aws_route53_record.shapeshed_com_acm_validation : record.fqdn]
}

# FIXME
# tflint-ignore: terraform_naming_convention
resource "aws_acm_certificate" "samornbo-com" {
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

# tflint-ignore: terraform_naming_convention
resource "aws_acm_certificate_validation" "samornbo-com" {
  provider                = aws.us-east-1
  certificate_arn         = aws_acm_certificate.samornbo-com.arn
  validation_record_fqdns = [for record in aws_route53_record.samornbo_com_acm_validation : record.fqdn]
}
