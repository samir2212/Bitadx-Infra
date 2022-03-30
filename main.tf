terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "bitadx-terraform-state-dev"
    key            = "bitadx01-dev/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo-dev"
    region         = "eu-central-1"
  }
}

provider "aws" {
  region = var.aws_region
}
