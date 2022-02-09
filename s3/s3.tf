resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "aws-codepipeline-test-eu-west-1-44233-artifacts"
  acl    = "private"
}

resource "aws_s3_bucket" "terraform_tfstate" {
  bucket = "aws-codepipeline-test-eu-west-1-121123-tfstate"
  acl    = "private"
}