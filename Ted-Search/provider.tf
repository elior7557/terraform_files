terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region

}

