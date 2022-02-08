resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "aws-codepipeline-test-eu-west-1-11233-artifacts"
  acl    = "private"
}
