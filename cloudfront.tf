# tfsec:ignore:aws-cloudfront-enable-waf 
# tfsec:ignore:aws-cloudfront-enable-logging tflint-ignore: terraform_naming_convention
resource "aws_cloudfront_distribution" "cf-shapeshed-com" {
  aliases = [
    "shapeshed.com",
    "www.shapeshed.com"
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
    # AWS Managed Policy
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
    target_origin_id       = aws_s3_bucket.static-shapeshed-com.bucket_regional_domain_name
    trusted_key_groups     = []
    trusted_signers        = []
    viewer_protocol_policy = "redirect-to-https"

    function_association {
      event_type   = "viewer-request"
      function_arn = "arn:aws:cloudfront::535487841971:function/naked-domain"
    }
  }

  origin {
    connection_attempts      = 3
    connection_timeout       = 10
    domain_name              = aws_s3_bucket.static-shapeshed-com.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.static-shapeshed-com.id
    origin_id                = aws_s3_bucket.static-shapeshed-com.bucket_regional_domain_name
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

# tflint-ignore: terraform_naming_convention
resource "aws_cloudfront_origin_access_control" "static-shapeshed-com" {
  name                              = aws_s3_bucket.static-shapeshed-com.bucket_regional_domain_name
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# tfsec:ignore:aws-cloudfront-enable-waf 
# tfsec:ignore:aws-cloudfront-enable-logging tflint-ignore: terraform_naming_convention
resource "aws_cloudfront_distribution" "samornbo-com" {
  # tflint-ignore: terraform_naming_convention
  aliases = [
    "samornbo.com",
    "www.samornbo.com"
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
    # AWS Managed Policy
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods = [
      "GET",
      "HEAD",
    ]
    compress         = true
    default_ttl      = 0
    max_ttl          = 0
    min_ttl          = 0
    smooth_streaming = false
    # Bug in Terraform https://github.com/hashicorp/terraform-provider-aws/issues/15102
    # target_origin_id       = aws_s3_bucket.samornbo-com.bucket_regional_domain_name
    target_origin_id       = "samornbo.com.s3.us-east-1.amazonaws.com"
    trusted_key_groups     = []
    trusted_signers        = []
    viewer_protocol_policy = "redirect-to-https"

    function_association {
      event_type   = "viewer-request"
      function_arn = "arn:aws:cloudfront::535487841971:function/naked-domain"
    }
  }

  origin {
    connection_attempts = 3
    connection_timeout  = 10
    # Bug in Terraform https://github.com/hashicorp/terraform-provider-aws/issues/15102
    # domain_name              = aws_s3_bucket.samornbo-com.bucket_regional_domain_name
    domain_name              = "samornbo.com.s3.us-east-1.amazonaws.com"
    origin_access_control_id = aws_cloudfront_origin_access_control.samornbo-com.id
    # Bug in Terraform https://github.com/hashicorp/terraform-provider-aws/issues/15102
    # origin_id                = aws_s3_bucket.samornbo-com.bucket_regional_domain_name
    origin_id = "samornbo.com.s3.us-east-1.amazonaws.com"
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = aws_acm_certificate.samornbo-com.arn
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}

# tflint-ignore: terraform_naming_convention
resource "aws_cloudfront_origin_access_control" "samornbo-com" {
  # Bug in Terraform https://github.com/hashicorp/terraform-provider-aws/issues/15102
  # name                              = aws_s3_bucket.samornbo-com.bucket_regional_domain_name
  name                              = "samornbo.com.s3.us-east-1.amazonaws.com"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
