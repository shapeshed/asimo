module "s3-eu-west-1" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.7.0"
  for_each = toset([
    "creative-corners",
    "photos.shapeshed.com"
  ])
  bucket                  = each.key
  acl                     = "private"
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
module "s3-us-east-1" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.7.0"
  for_each = toset([
    "bomberg",
    "cdn.shapeshed.com",
    "com.shapeshed.clearmatics",
    "com.shapeshed.auster",
    "com.shapeshed.orwell",
    "george-mbp"
  ])
  providers = {
    aws = aws.us-east-1
  }
  bucket                  = each.key
  acl                     = "private"
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
module "s3-static-shapeshed-com" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.7.0"
  bucket  = "static.shapeshed.com"
  versioning = {
    enabled = false
  }
}
