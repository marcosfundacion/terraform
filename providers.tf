terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.90.1"
    }
  }

  backend "s3" {
    encrypt = true
    bucket         = "${tf_backend_bucket}"
    key            = "${tf_backend_key}"
    dynamodb_table = "${tf_backend_dynamodb_table}"
  }
}

provider "aws" {
  region = "us-east-1"
}