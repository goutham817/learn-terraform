terraform {
  backend "s3" {
    bucket = "terraform-817"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    }
  }
}

resource "null_resource" "test" {}