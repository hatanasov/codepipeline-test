data "aws_s3_bucket" "artifacts" {
  bucket = "aws-codepipeline-test-eu-west-1-44233-artifacts"
}

data "aws_s3_bucket" "tfstate" {
  bucket = "aws-codepipeline-test-eu-west-1-121123-tfstate"
}

# data "aws_codestarconnections_connection" "github_connection" {
#   arn = aws_codestarconnections_connection.github_connection.arn
# }

