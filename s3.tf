#################################
# creative-corners
#################################
resource "aws_s3_bucket" "creative-corners" {
  bucket = "creative-corners"
  tags = {
    type = "client"
  }
}

resource "aws_s3_bucket_acl" "creative-corners_acl" {
  bucket = aws_s3_bucket.creative-corners.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "creative-corners_versioning" {
  bucket = aws_s3_bucket.creative-corners.id
  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket_public_access_block" "creative-corners_public_access_block" {
  bucket                  = aws_s3_bucket.creative-corners.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "creative-corners_bucket_encryption" {
  bucket = aws_s3_bucket.creative-corners.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
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

