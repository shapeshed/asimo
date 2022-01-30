terraform {
  cloud {
    organization = "shapeshed"

    workspaces {
      name = "asimo"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "terraform-cloud"
}

resource "aws_route53_zone" "shapeshed_com" {
  name = "shapeshed.com"
}

resource "aws_route53_record" "shapeshed_com_A" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = aws_route53_zone.shapeshed_com.name
  type    = "A"
  alias {
    evaluate_target_health = false
    name                   = "dvq61qbuoqa8n.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
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

resource "aws_route53_record" "finney_shapeshed_com_A" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "finney.shapeshed.com"
  type    = "A"
  records = [
    "45.79.87.169",
  ]
  ttl = 86400
}

resource "aws_route53_record" "mx01_shapeshed_com_A" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "mx01.shapeshed.com"
  type    = "A"
  records = [
    "173.255.248.188",
  ]
  ttl = 86400
}

resource "aws_route53_record" "mx02_shapeshed_com_A" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "mx02.shapeshed.com"
  type    = "A"
  records = [
    "45.79.87.169",
  ]
  ttl = 86400
}

resource "aws_route53_record" "shapeshed_com_AAAA" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = aws_route53_zone.shapeshed_com.name
  type    = "AAAA"
  alias {
    evaluate_target_health = false
    name                   = "dvq61qbuoqa8n.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
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

resource "aws_route53_record" "finney_shapeshed_com_AAAA" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "finney.shapeshed.com"
  type    = "AAAA"
  records = [
    "2600:3c01::f03c:93ff:fe84:fa35",
  ]
  ttl = 86400
}

resource "aws_route53_record" "mx01_shapeshed_com_AAAA" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "mx01.shapeshed.com"
  type    = "AAAA"
  records = [
    "2600:3c01::f03c:91ff:fe93:30f8",
  ]
  ttl = 86400
}

resource "aws_route53_record" "mx02_shapeshed_com_AAAA" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "mx02.shapeshed.com"
  type    = "AAAA"
  records = [
    "2600:3c01::f03c:93ff:fe84:fa35",
  ]
  ttl = 86400
}

resource "aws_route53_record" "__26eca8f67eb273a9cafb25ef1989fdf1_shapeshed_com_CNAME" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "_26eca8f67eb273a9cafb25ef1989fdf1.shapeshed.com"
  type    = "CNAME"
  ttl     = 300
  records = [
    "_ac0f44f6b20b6d08d8683d23e8f24bce.xrchbtpdjs.acm-validations.aws.",

  ]
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

resource "aws_route53_record" "__8e912589f272071e6beb0f31146b9819_www_shapeshed_com_CNAME" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "_8e912589f272071e6beb0f31146b9819.www.shapeshed.com"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "_2d7dea137e60e44fdb30e59e1e809008.xrchbtpdjs.acm-validations.aws.",
  ]
}

resource "aws_route53_record" "mail_shapeshed_com_CNAME" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "mail.shapeshed.com"
  type    = "CNAME"
  ttl     = 86400
  records = [
    "moxie.shapeshed.com.",
  ]
}

resource "aws_route53_record" "imap_shapeshed_com_CNAME" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "imap.shapeshed.com"
  type    = "CNAME"
  ttl     = 86400
  records = [
    "moxie.shapeshed.com.",
  ]
}

resource "aws_route53_record" "smtp_shapeshed_com_CNAME" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "smtp.shapeshed.com"
  type    = "CNAME"
  ttl     = 86400
  records = [
    "moxie.shapeshed.com.",
  ]
}

resource "aws_route53_record" "shapeshed_com_MX" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = aws_route53_zone.shapeshed_com.name
  type    = "MX"
  records = [
    "10 mx01.shapeshed.com",
    "20 mx02.shapeshed.com"
    # "1 ASPMX.L.GOOGLE.COM",
    # "5 ALT1.ASPMX.L.GOOGLE.COM",
    # "5 ALT2.ASPMX.L.GOOGLE.COM",
    # "10 ALT3.ASPMX.L.GOOGLE.COM",
    # "10 ALT4.ASPMX.L.GOOGLE.COM",
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
    # "v=spf1 mx a ip4:173.255.248.188 ip6:2600:3c01::f03c:91ff:fe93:30f8 ~all"
  ]
  ttl = 86400
}

resource "aws_route53_record" "__acme-challenge_shapeshed_com_TXT" {
  zone_id = aws_route53_zone.shapeshed_com.zone_id
  name    = "_acme-challenge.shapeshed.com"
  type    = "TXT"
  records = [
    "9ha6O94uBilOW30HXQb7Q-CnAOufb48Es7yF0GD4KfU"
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
    "v=DKIM1; k=rsa; s=email;",
    "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4ftJNVp9PkT2Rs8yIoXmOVKvMfmN/SNi7riECgpLGmR/QSseCPTVypv7DF/q83XoEQj6amU2hcVslKN+wN2D6VzlZ7PQXi7jZKrHSvq3T9agj8YWlLf6WmJB7RlEXIn0sWUdSgvUzPly9D/Z9Al2rex8MyD67apF1nIkBvQ18hFRajuhFVZj/hLGBhRb0xRSyrDpmy4lDQkPEn",
    "g7MLNN0JqQY0bynhvOvg3ZgM2cokykxaCUQNC++P5Szdzs8SM25N+fUj/oYMPZC4gFvgA0Nq0U+frRE1pbSStcmxRgLqO3VPxnTdOjbP7VVvvJ04TDp6IScJYkfNN7ZZYly2CH5QIDAQAB",
    "5dc1b233ee950ba7",
  ]
  ttl = 86400
}
