# tfsec:ignore:aws-s3-enable-bucket-encryption
# tfsec:ignore:aws-s3-enable-bucket-logging
# tfsec:ignore:aws-s3-encryption-customer-key
resource "aws_s3_bucket" "us_east_1_backups" {
  for_each = toset(var.us_east_1_buckets)
  bucket   = each.key
  provider = aws.us-east-1
}

resource "aws_s3_bucket_public_access_block" "us_east_1_backups" {
  for_each = aws_s3_bucket.us_east_1_backups
  bucket   = each.value.id
  provider = aws.us-east-1

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# tfsec:ignore:aws-s3-enable-versioning
resource "aws_s3_bucket_versioning" "us_east_1_backups" {
  for_each = aws_s3_bucket.us_east_1_backups
  bucket   = each.value.id
  provider = aws.us-east-1

  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket_acl" "us_east_1_backups" {
  for_each = aws_s3_bucket.us_east_1_backups
  bucket   = each.value.id
  provider = aws.us-east-1

  acl = "private"
}

# tfsec:ignore:aws-s3-enable-bucket-encryption
# tfsec:ignore:aws-s3-enable-bucket-logging
# tfsec:ignore:aws-s3-encryption-customer-key tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket" "creative-corners" {
  bucket = "creative-corners"
}

# tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_public_access_block" "creative-corners_public_access_block" {
  bucket = aws_s3_bucket.creative-corners.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# tfsec:ignore:aws-s3-enable-versioning tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_versioning" "creative-corners-bucket_versioning" {
  bucket = aws_s3_bucket.creative-corners.id
  versioning_configuration {
    status = "Suspended"
  }
}

# tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_acl" "creative-corners_acl" {
  bucket = aws_s3_bucket.creative-corners.id
  acl    = "private"
}

# tfsec:ignore:aws-s3-enable-bucket-encryption
# tfsec:ignore:aws-s3-enable-bucket-logging
# tfsec:ignore:aws-s3-encryption-customer-key tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket" "photos-shapeshed-com" {
  bucket = "photos.shapeshed.com"
}

# tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_public_access_block" "photos-shapeshed-com" {
  bucket = aws_s3_bucket.photos-shapeshed-com.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# tfsec:ignore:aws-s3-enable-versioning tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_versioning" "photos-shapeshed-com" {
  bucket = aws_s3_bucket.photos-shapeshed-com.id
  versioning_configuration {
    status = "Suspended"
  }
}

# tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_acl" "photos-shapeshed-com" {
  bucket = aws_s3_bucket.photos-shapeshed-com.id
  acl    = "private"
}

# tfsec:ignore:aws-s3-enable-bucket-encryption
# tfsec:ignore:aws-s3-enable-bucket-logging
# tfsec:ignore:aws-s3-encryption-customer-key tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket" "static-shapeshed-com" {
  bucket = "static.shapeshed.com"
}

# tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_public_access_block" "static-shapeshed-com" {
  bucket = aws_s3_bucket.static-shapeshed-com.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# tfsec:ignore:aws-s3-enable-versioning tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_versioning" "static-shapeshed-com" {
  bucket = aws_s3_bucket.static-shapeshed-com.id
  versioning_configuration {
    status = "Suspended"
  }
}

# tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_acl" "static-shapeshed-com" {
  bucket = aws_s3_bucket.static-shapeshed-com.id
  acl    = "private"
}

# tfsec:ignore:aws-s3-enable-bucket-encryption
# tfsec:ignore:aws-s3-enable-bucket-logging
# tfsec:ignore:aws-s3-encryption-customer-key tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket" "samornbo-com" {
  provider = aws.us-east-1
  bucket   = "samornbo.com"
}

# tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_public_access_block" "samornbo-com" {
  provider = aws.us-east-1
  bucket   = aws_s3_bucket.samornbo-com.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# tfsec:ignore:aws-s3-enable-versioning tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_versioning" "samornbo-com" {
  provider = aws.us-east-1
  bucket   = aws_s3_bucket.samornbo-com.id
  versioning_configuration {
    status = "Suspended"
  }
}

# tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_acl" "samornbo-com" {
  provider = aws.us-east-1
  bucket   = aws_s3_bucket.samornbo-com.id
  acl      = "private"
}

# tfsec:ignore:aws-s3-enable-bucket-encryption
# tfsec:ignore:aws-s3-enable-bucket-logging
# tfsec:ignore:aws-s3-encryption-customer-key
# tfsec:ignore:aws-s3-enable-versioning
resource "aws_s3_bucket" "mta_sts_shapeshed_com" {
  bucket = "mta-sts.shapeshed.com"
}

resource "aws_s3_bucket_public_access_block" "mta_sts_shapeshed_com" {
  bucket = aws_s3_bucket.mta_sts_shapeshed_com.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# tfsec:ignore:aws-s3-enable-versioning 
resource "aws_s3_bucket_versioning" "mta_sts_shapeshed_com" {
  bucket = aws_s3_bucket.mta_sts_shapeshed_com.id
  versioning_configuration {
    status = "Suspended"
  }
}

# tflint-ignore: terraform_naming_convention
resource "aws_s3_bucket_acl" "mta_sts_shapeshed_com" {
  bucket = aws_s3_bucket.mta_sts_shapeshed_com.id
  acl    = "private"
}
