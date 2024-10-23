terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.46.0"
    }
  }

  backend "s3" {
    bucket         = "architectf"
    key            = "blog"
    region         = "us-east-1"
    dynamodb_table = "architectf-timeline"
  }

  required_version = "1.6.1"
}

provider "aws" {
  region = "us-east-1"
}
