terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.19.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  alias  = "global"
  region = "us-east-1"
}