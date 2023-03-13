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

resource "aws_s3_bucket" "creative-corners" {
  bucket = "creative-corners"
}

resource "aws_s3_bucket_public_access_block" "creative-corners_public_access_block" {
  bucket = aws_s3_bucket.creative-corners.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "creative-corners-bucket_versioning" {
  bucket = aws_s3_bucket.creative-corners.id
  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket_acl" "creative-corners_acl" {
  bucket = aws_s3_bucket.creative-corners.id
  acl    = "private"
}

resource "aws_s3_bucket" "photos-shapeshed-com" {
  bucket = "photos.shapeshed.com"
}

resource "aws_s3_bucket_public_access_block" "photos-shapeshed-com" {
  bucket = aws_s3_bucket.photos-shapeshed-com.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "photos-shapeshed-com" {
  bucket = aws_s3_bucket.photos-shapeshed-com.id
  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket_acl" "photos-shapeshed-com" {
  bucket = aws_s3_bucket.photos-shapeshed-com.id
  acl    = "private"
}
