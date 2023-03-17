terraform {
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
  required_version = "~> 1.4.0"

}

provider "aws" {
  region = var.aws_region
}
provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

