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
    "com.shapeshed.bomberg",
    "com.shapeshed.cdn",
    "com.shapeshed.clearmatics",
    "com.shapeshed.auster",
    "com.shapeshed.orwell",
    "com.shapeshed.wozniak",
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

  intelligent_tiering = {
    general = {
      status = "Enabled"
      filter = {
        prefix = "/"
      }
      tiering = {
        ARCHIVE_ACCESS = {
          days = 90
        }
        DEEP_ARCHIVE_ACCESS = {
          days = 180
        }
      }
    }
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
