#tfsec:ignore:aws-s3-enable-bucket-encryption
#tfsec:ignore:aws-s3-enable-bucket-logging
#tfsec:ignore:aws-s3-encryption-customer-key
#tfsec:ignore:aws-s3-enable-versioning
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

#tfsec:ignore:aws-s3-enable-bucket-encryption
#tfsec:ignore:aws-s3-enable-bucket-logging
#tfsec:ignore:aws-s3-encryption-customer-key
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

#tfsec:ignore:aws-s3-enable-versioning
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

#tfsec:ignore:aws-s3-enable-bucket-encryption
#tfsec:ignore:aws-s3-enable-bucket-logging
#tfsec:ignore:aws-s3-encryption-customer-key
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

#tfsec:ignore:aws-s3-enable-versioning
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

#tfsec:ignore:aws-s3-enable-bucket-encryption
#tfsec:ignore:aws-s3-enable-bucket-logging
#tfsec:ignore:aws-s3-encryption-customer-key
resource "aws_s3_bucket" "static-shapeshed-com" {
  bucket = "static.shapeshed.com"
}

resource "aws_s3_bucket_public_access_block" "static-shapeshed-com" {
  bucket = aws_s3_bucket.static-shapeshed-com.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#tfsec:ignore:aws-s3-enable-versioning
resource "aws_s3_bucket_versioning" "static-shapeshed-com" {
  bucket = aws_s3_bucket.static-shapeshed-com.id
  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket_acl" "static-shapeshed-com" {
  bucket = aws_s3_bucket.static-shapeshed-com.id
  acl    = "private"
}

#tfsec:ignore:aws-s3-enable-bucket-encryption
#tfsec:ignore:aws-s3-enable-bucket-logging
#tfsec:ignore:aws-s3-encryption-customer-key
resource "aws_s3_bucket" "samornbo-com" {
  provider = aws.us-east-1
  bucket   = "samornbo.com"
}

resource "aws_s3_bucket_public_access_block" "samornbo-com" {
  provider = aws.us-east-1
  bucket   = aws_s3_bucket.samornbo-com.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#tfsec:ignore:aws-s3-enable-versioning
resource "aws_s3_bucket_versioning" "samornbo-com" {
  provider = aws.us-east-1
  bucket   = aws_s3_bucket.samornbo-com.id
  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket_acl" "samornbo-com" {
  provider = aws.us-east-1
  bucket   = aws_s3_bucket.samornbo-com.id
  acl      = "private"
}
