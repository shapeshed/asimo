resource "aws_route53_zone" "shapeshed_com" {
  name = "shapeshed.com"
}

resource "aws_route53_record" "shapeshed_com_a" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = aws_route53_zone.shapeshed_com.name
  type    = "A"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.shapeshed_com.domain_name
    zone_id                = aws_cloudfront_distribution.shapeshed_com.hosted_zone_id
  }
}

resource "aws_route53_record" "moxie_shapeshed_com_a" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "moxie.shapeshed.com"
  type    = "A"
  records = [
    "173.255.248.188",
  ]
  ttl = 86400
}

resource "aws_route53_record" "shapeshed_com_acm_validation" {
  for_each = {
    for dvo in aws_acm_certificate.shapeshed_com.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.shapeshed_com.zone_id
}

resource "aws_route53_record" "shapeshed_com_aaaa" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = aws_route53_zone.shapeshed_com.name
  type    = "AAAA"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.shapeshed_com.domain_name
    zone_id                = aws_cloudfront_distribution.shapeshed_com.hosted_zone_id
  }
}

resource "aws_route53_record" "moxie_shapeshed_com_aaaa" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "moxie.shapeshed.com"
  type    = "AAAA"
  records = [
    "2600:3c01::f03c:91ff:fe93:30f8",
  ]
  ttl = 86400
}

# tflint-ignore: terraform_naming_convention
resource "aws_route53_record" "googlee87068e8125fba47_shapeshed_com_CNAME" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "googlee87068e8125fba47.shapeshed.com"
  type    = "CNAME"
  ttl     = 86400
  records = [
    "GOOGLE.com.",
  ]
}

# tflint-ignore: terraform_naming_convention
resource "aws_route53_record" "w6yzyrt6eyqt_shapeshed_com_CNAME" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "w6yzyrt6eyqt.shapeshed.com"
  type    = "CNAME"
  ttl     = 86400
  records = [
    "gv-h46mybslvl2p4v.dv.googlehosted.com.",
  ]
}

resource "aws_route53_record" "shapeshed_com_mx" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = aws_route53_zone.shapeshed_com.name
  type    = "MX"
  records = [
    "1 ASPMX.L.GOOGLE.COM",
    "5 ALT1.ASPMX.L.GOOGLE.COM",
    "5 ALT2.ASPMX.L.GOOGLE.COM",
    "10 ALT3.ASPMX.L.GOOGLE.COM",
    "10 ALT4.ASPMX.L.GOOGLE.COM",
  ]
  ttl = 60
}

resource "aws_route53_record" "shapeshed_com_ns" {
  name    = aws_route53_zone.shapeshed_com.name
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  type    = "NS"
  records = [
    "ns-115.awsdns-14.com.",
    "ns-1681.awsdns-18.co.uk.",
    "ns-588.awsdns-09.net.",
    "ns-1025.awsdns-00.org.",
  ]
  ttl = 172800
}

# tflint-ignore: terraform_naming_convention
resource "aws_route53_record" "shapeshed_com_soa" {
  name    = aws_route53_zone.shapeshed_com.name
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  type    = "SOA"
  records = [
    "ns-115.awsdns-14.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400",
  ]
  ttl = 900
}

# tflint-ignore: terraform_naming_convention
resource "aws_route53_record" "shapeshed_com_TXT" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = aws_route53_zone.shapeshed_com.name
  type    = "TXT"
  records = [
    "google-site-verification=VH4lMZXngyYKnvq-OftIaK7k83_HILU9XDozv4WppzU",
    "v=spf1 include:_spf.google.com include:amazonses.com -all",
  ]
  ttl = 86400
}

# tflint-ignore: terraform_naming_convention
resource "aws_route53_record" "shapeshed__domainkey_shapeshed_com_TXT" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "shapeshed._domainkey.shapeshed.com"
  type    = "TXT"
  records = [
    "v=DKIM1; k=rsa;\"\"p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqlb+nP3HGcfXCWjVpjyMeLG5z5BOdgyGxpH5Vc7VrKu8dfwJyZ/e1gzB7doHe3BsHvOSN+dZrydHBiDFiZ9FMykmFQGv0iaKBqT3etkayXvr43okeJz5//\"\"THYIB/4LSJw6uj9KZlpoCjmhl1pZIzuy6+t5xDTGLJIf2lNKe+5NQR+K60/gSpuAymioExG83eug8OwEg/MxXP/qGb4ntJkyV\"\"GStV1MZj2t02imzv5n725bG9Z81cWcEgjcIVV1HBn+ugy/ULyj6fCiZgxW3luBhPNHmNdQbE9NaO/DXsgBIQLhXbcdEL37vcQ1Hb8D0WrlUzFtPlHIDurJCptSywUswIDAQAB",
  ]
  ttl = 60
}

# tflint-ignore: terraform_naming_convention
resource "aws_route53_record" "__dmarc_shapeshed_com_TXT" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "_dmarc.shapeshed.com"
  type    = "TXT"
  records = [
    "v=DMARC1;p=quarantine;rua=mailto:155f2ac846@rua.easydmarc.eu;ruf=mailto:155f2ac846@ruf.easydmarc.eu;aspf=s;adkim=s;fo=1;"
  ]
  ttl = 60
}

resource "aws_route53_record" "shapeshed_com_amazonses_dkim_record" {
  count   = 3
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "${aws_ses_domain_dkim.shapeshed_com.dkim_tokens[count.index]}._domainkey"
  type    = "CNAME"
  ttl     = "600"
  records = ["${aws_ses_domain_dkim.shapeshed_com.dkim_tokens[count.index]}.dkim.amazonses.com"]
}

resource "aws_route53_record" "smtp_tls_shapeshed_com_txt" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "_smtp._tls.shapeshed.com"
  type    = "TXT"
  records = [
    "v=TLSRPTv1;rua=mailto:smtp-tls-reports@shapeshed.com;"
  ]
  ttl = 300
}

resource "aws_route53_record" "mta_sts_shapeshed_com_txt" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "_mta-sts.shapeshed.com"
  type    = "TXT"
  records = [
    "v=STSv1;id=1681810094392;"
  ]
  ttl = 300
}

# tflint-ignore: terraform_naming_convention
resource "aws_route53_zone" "samornbo-com" {
  name = "samornbo.com"
}

# tflint-ignore: terraform_naming_convention
resource "aws_route53_record" "samornbo_com_acm_validation" {
  for_each = {
    for dvo in aws_acm_certificate.samornbo_com.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.samornbo-com.zone_id
}

# tflint-ignore: terraform_naming_convention
resource "aws_route53_record" "samornbo-com_A" {
  zone_id = aws_route53_zone.samornbo-com.zone_id
  name    = aws_route53_zone.samornbo-com.name
  type    = "A"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.samornbo_com.domain_name
    zone_id                = aws_cloudfront_distribution.samornbo_com.hosted_zone_id
  }
}

# tflint-ignore: terraform_naming_convention
resource "aws_route53_record" "samornbo-com_AAAA" {
  zone_id = aws_route53_zone.samornbo-com.zone_id
  name    = aws_route53_zone.samornbo-com.name
  type    = "AAAA"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.samornbo_com.domain_name
    zone_id                = aws_cloudfront_distribution.samornbo_com.hosted_zone_id
  }
}

resource "aws_route53_record" "mta_sts_shapeshed_com_a" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "mta-sts.shapeshed.com"
  type    = "A"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.mta_sts_shapeshed_com.domain_name
    zone_id                = aws_cloudfront_distribution.mta_sts_shapeshed_com.hosted_zone_id
  }
}

resource "aws_route53_record" "mta_sts_shapeshed_com_aaaa" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "mta-sts.shapeshed.com"
  type    = "AAAA"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.mta_sts_shapeshed_com.domain_name
    zone_id                = aws_cloudfront_distribution.mta_sts_shapeshed_com.hosted_zone_id
  }
}
