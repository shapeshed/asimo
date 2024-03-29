terraform {
  required_version = "~> 1.4.0"
  cloud {
    organization = "shapeshed"

    workspaces {
      name = "asimo"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}
provider "aws" {
  region = "eu-west-2"
  alias  = "eu-west-2"
}

