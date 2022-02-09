resource "aws_codestarconnections_connection" "github_connection" {
  name = "github/codepipeline"
  provider_type = "GitHub"
}

resource "aws_codepipeline" "codepipeline" {
  name     = "aws-pipeline-build-image"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = data.aws_s3_bucket.artifacts.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["tf-ecr-config"]

      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.github_connection.arn
        FullRepositoryId = "hatanasov/codepipeline-test"
        BranchName       = "main"
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["tf-ecr-config"]
      output_artifacts = ["tf-ecr-build"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.build_image.name
      }
    }
  }
}
