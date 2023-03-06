module "s3-creative-corners" {
  source                  = "terraform-aws-modules/s3-bucket/aws"
  version                 = "3.7.0"
  bucket                  = "creative-corners"
  acl                     = "private"
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
  versioning = {
    enabled = false
  }
}
module "s3-photos-shapeshed-com" {
  source                  = "terraform-aws-modules/s3-bucket/aws"
  version                 = "3.7.0"
  bucket                  = "photos.shapeshed.com"
  acl                     = "private"
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
  versioning = {
    enabled = false
  }
}
module "s3-static-shapeshed-com" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.7.0"
  bucket  = "static.shapeshed.com"
  versioning = {
    enabled = false
  }
}
module "s3-us-east-1" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.7.0"
  for_each = toset([
    "bomberg",
    "cdn.shapeshed.com",
    "clearmatics.shapeshed.com",
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
