resource "aws_ses_domain_identity" "shapeshed_com" {
  provider = aws.eu-west-2
  domain   = "shapeshed.com"
}

resource "aws_ses_domain_dkim" "shapeshed_com" {
  provider = aws.eu-west-2
  domain   = aws_ses_domain_identity.shapeshed_com.domain
}

