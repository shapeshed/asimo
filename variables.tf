variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "us_east_1_buckets" {
  description = "Buckets in the us-east-1 region"
  type        = list(string)
  default = [
    "com.shapeshed.bomberg",
    "com.shapeshed.cdn",
    "com.shapeshed.clearmatics",
    "com.shapeshed.auster",
    "com.shapeshed.orwell",
    "com.shapeshed.wozniak",
  ]
}
