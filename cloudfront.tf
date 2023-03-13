resource "aws_cloudfront_distribution" "cf-shapeshed-com" {
  aliases = [
    "shapeshed.com",
  ]
  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2and3"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  tags                = {}
  tags_all            = {}
  wait_for_deployment = true

  custom_error_response {
    error_caching_min_ttl = 10
    error_code            = 404
    response_code         = 0
  }

  default_cache_behavior {
    allowed_methods = [
      "GET",
      "HEAD",
    ]
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods = [
      "GET",
      "HEAD",
    ]
    compress               = true
    default_ttl            = 0
    max_ttl                = 0
    min_ttl                = 0
    smooth_streaming       = false
    target_origin_id       = "static.shapeshed.com.s3.eu-west-1.amazonaws.com"
    trusted_key_groups     = []
    trusted_signers        = []
    viewer_protocol_policy = "redirect-to-https"

    function_association {
      event_type   = "viewer-request"
      function_arn = "arn:aws:cloudfront::535487841971:function/index"
    }
  }

  origin {
    connection_attempts      = 3
    connection_timeout       = 10
    domain_name              = "static.shapeshed.com.s3.eu-west-1.amazonaws.com"
    origin_access_control_id = "E1IIZUUZGRNE2J"
    origin_id                = "static.shapeshed.com.s3.eu-west-1.amazonaws.com"
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = aws_acm_certificate.cert-shapeshed-com.arn
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "cf-www-shapeshed-com" {
  aliases = [
    "www.shapeshed.com",
  ]
  enabled          = true
  http_version     = "http2"
  is_ipv6_enabled  = true
  price_class      = "PriceClass_All"
  retain_on_delete = false
  tags = {
    "site" = "shapeshed.com"
  }
  tags_all = {
    "site" = "shapeshed.com"
  }
  wait_for_deployment = true

  default_cache_behavior {
    allowed_methods = [
      "GET",
      "HEAD",
    ]
    cached_methods = [
      "GET",
      "HEAD",
    ]
    compress               = false
    default_ttl            = 86400
    max_ttl                = 31536000
    min_ttl                = 0
    smooth_streaming       = false
    target_origin_id       = "S3-www.shapeshed.com"
    trusted_key_groups     = []
    trusted_signers        = []
    viewer_protocol_policy = "allow-all"

    forwarded_values {
      headers                 = []
      query_string            = false
      query_string_cache_keys = []

      cookies {
        forward           = "none"
        whitelisted_names = []
      }
    }
  }

  origin {
    connection_attempts = 3
    connection_timeout  = 10
    domain_name         = "static.shapeshed.com.s3.eu-west-1.amazonaws.com"
    origin_id           = "S3-www.shapeshed.com"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/E2IDSMMHI1IIKQ"
    }
  }
  origin {
    connection_attempts = 3
    connection_timeout  = 10
    domain_name         = "static.shapeshed.com.s3.eu-west-1.amazonaws.com"
    origin_id           = "static.shapeshed.com.s3.eu-west-1.amazonaws.com"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/E15EJ0BFVBGSIQ"
    }
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:535487841971:certificate/bec48333-b864-4dd5-b546-d69f5331a10c"
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1"
    ssl_support_method             = "sni-only"
  }
}

