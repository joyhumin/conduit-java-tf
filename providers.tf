provider "aws" {
  region = "ap-southeast-2"
  profile = "vector-sandbox"
}

terraform {
  required_providers {
    aws = {
      source = "aws"
      version = "~> 4.0"
    }
  }
}