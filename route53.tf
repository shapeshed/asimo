resource "aws_route53_zone" "shapeshed_com" {
  name = "shapeshed.com"
}

resource "aws_route53_record" "shapeshed_com_A" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = aws_route53_zone.shapeshed_com.name
  type    = "A"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.cf-shapeshed-com.domain_name
    zone_id                = aws_cloudfront_distribution.cf-shapeshed-com.hosted_zone_id
  }
}

resource "aws_route53_record" "moxie_shapeshed_com_A" {
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
    for dvo in aws_acm_certificate.cert-shapeshed-com.domain_validation_options : dvo.domain_name => {
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

resource "aws_route53_record" "shapeshed_com_AAAA" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = aws_route53_zone.shapeshed_com.name
  type    = "AAAA"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.cf-shapeshed-com.domain_name
    zone_id                = aws_cloudfront_distribution.cf-shapeshed-com.hosted_zone_id
  }
}

resource "aws_route53_record" "moxie_shapeshed_com_AAAA" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "moxie.shapeshed.com"
  type    = "AAAA"
  records = [
    "2600:3c01::f03c:91ff:fe93:30f8",
  ]
  ttl = 86400
}

resource "aws_route53_record" "d78e316caf6d1de59613b2e5a7e0d62b_shapeshed_com_CNAME" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "d78e316caf6d1de59613b2e5a7e0d62b.shapeshed.com"
  type    = "CNAME"
  ttl     = 86400
  records = [
    "verify.bing.com.",
  ]
}

resource "aws_route53_record" "googlee87068e8125fba47_shapeshed_com_CNAME" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "googlee87068e8125fba47.shapeshed.com"
  type    = "CNAME"
  ttl     = 86400
  records = [
    "GOOGLE.com.",
  ]
}

resource "aws_route53_record" "shgsbo4u9t_shapeshed_com_CNAME" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "shgsbo4u9t.shapeshed.com"
  type    = "CNAME"
  ttl     = 86400
  records = [
    "zz.baidu.com.",
  ]
}

resource "aws_route53_record" "w6yzyrt6eyqt_shapeshed_com_CNAME" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "w6yzyrt6eyqt.shapeshed.com"
  type    = "CNAME"
  ttl     = 86400
  records = [
    "gv-h46mybslvl2p4v.dv.googlehosted.com.",
  ]
}

resource "aws_route53_record" "shapeshed_com_MX" {
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

resource "aws_route53_record" "shapeshed_com_NS" {
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

resource "aws_route53_record" "shapeshed_com_SOA" {
  name    = aws_route53_zone.shapeshed_com.name
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  type    = "SOA"
  records = [
    "ns-115.awsdns-14.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400",
  ]
  ttl = 900
}

resource "aws_route53_record" "shapeshed_com_TXT" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = aws_route53_zone.shapeshed_com.name
  type    = "TXT"
  records = [
    "google-site-verification=VH4lMZXngyYKnvq-OftIaK7k83_HILU9XDozv4WppzU",
    "v=spf1 include:_spf.google.com -all",
  ]
  ttl = 86400
}

resource "aws_route53_record" "__acme-challenge_shapeshed_com_TXT" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "_acme-challenge.shapeshed.com"
  type    = "TXT"
  records = [
    "A-uhrILL2l86Qe3D3ItXlWbWoqTQdjTmN0FgC7w-uuU"
  ]
  ttl = 60
}

resource "aws_route53_record" "yandex-verification_shapeshed_com_TXT" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "yandex-verification.shapeshed.com"
  type    = "TXT"
  records = [
    "5dc1b233ee950ba7"
  ]
  ttl = 86400
}

resource "aws_route53_record" "moxie__domainkey_shapeshed_com_TXT" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "moxie._domainkey.shapeshed.com"
  type    = "TXT"
  records = [
    "v=DKIM1; k=rsa; s=email;\"\"p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4ftJNVp9PkT2Rs8yIoXmOVKvMfmN/SNi7riECgpLGmR/QSseCPTVypv7DF/q83XoEQj6amU2hcVslKN+wN2D6VzlZ7PQXi7jZKrHSvq3T9agj8YWlLf6WmJB7RlEXIn0sWUdSgvUzPly9D/Z9Al2rex8MyD67apF1nIkBvQ18hFRajuhFVZj/hLGBhRb0xRSyrDpmy4lDQkPEn\"\"g7MLNN0JqQY0bynhvOvg3ZgM2cokykxaCUQNC++P5Szdzs8SM25N+fUj/oYMPZC4gFvgA0Nq0U+frRE1pbSStcmxRgLqO3VPxnTdOjbP7VVvvJ04TDp6IScJYkfNN7ZZYly2CH5QIDAQAB",
  ]
  ttl = 60
}

resource "aws_route53_record" "shapeshed__domainkey_shapeshed_com_TXT" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "shapeshed._domainkey.shapeshed.com"
  type    = "TXT"
  records = [
    "v=DKIM1; k=rsa;\"\"p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqlb+nP3HGcfXCWjVpjyMeLG5z5BOdgyGxpH5Vc7VrKu8dfwJyZ/e1gzB7doHe3BsHvOSN+dZrydHBiDFiZ9FMykmFQGv0iaKBqT3etkayXvr43okeJz5//\"\"THYIB/4LSJw6uj9KZlpoCjmhl1pZIzuy6+t5xDTGLJIf2lNKe+5NQR+K60/gSpuAymioExG83eug8OwEg/MxXP/qGb4ntJkyV\"\"GStV1MZj2t02imzv5n725bG9Z81cWcEgjcIVV1HBn+ugy/ULyj6fCiZgxW3luBhPNHmNdQbE9NaO/DXsgBIQLhXbcdEL37vcQ1Hb8D0WrlUzFtPlHIDurJCptSywUswIDAQAB",
  ]
  ttl = 60
}

resource "aws_route53_record" "__dmarc_shapeshed_com_TXT" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "_dmarc.shapeshed.com"
  type    = "TXT"
  records = [
    "v=DMARC1; p=quarantine; pct=20; adkim=s; aspf=r; fo=1; rua=mailto:postmaster@shapeshed.com; ruf=mailto:forensic@shapeshed.com;"
  ]
  ttl = 60
}

resource "aws_route53_zone" "samornbo-com" {
  name = "samornbo.com"
}

resource "aws_route53_record" "samornbo_com_acm_validation" {
  for_each = {
    for dvo in aws_acm_certificate.samornbo-com.domain_validation_options : dvo.domain_name => {
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

resource "aws_route53_record" "samornbo-com_A" {
  zone_id = aws_route53_zone.samornbo-com.zone_id
  name    = aws_route53_zone.samornbo-com.name
  type    = "A"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.samornbo-com.domain_name
    zone_id                = aws_cloudfront_distribution.samornbo-com.hosted_zone_id
  }
}

resource "aws_route53_record" "samornbo-com_AAAA" {
  zone_id = aws_route53_zone.samornbo-com.zone_id
  name    = aws_route53_zone.samornbo-com.name
  type    = "AAAA"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.samornbo-com.domain_name
    zone_id                = aws_cloudfront_distribution.samornbo-com.hosted_zone_id
  }
}
