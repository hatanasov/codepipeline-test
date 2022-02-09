terraform {
  backend "s3" {
    bucket  = "aws-codepipeline-test-eu-west-1-121123-tfstate"
    encrypt = true
    key     = "CodePipeline/terraform.tfstate"
    region  = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}