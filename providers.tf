terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.90.1"
    }
  }

  backend "s3" {
    encrypt = true
    bucket         = "${TF_BACKEND_BUCKET}"
    key            = "${TF_BACKEND_KEY}"
    dynamodb_table = "${TF_BACKEND_DYNAMODB_TABLE}"
  }
}

provider "aws" {
  region = "us-east-1"
}