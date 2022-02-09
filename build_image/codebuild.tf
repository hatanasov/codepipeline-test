resource "aws_codebuild_project" "build_image" {
  name          = "build_container"
  service_role  = aws_iam_role.codebuild_role.arn
  
  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = var.Region
    }

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = data.aws_caller_identity.current.id
    }

    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = aws_ecr_repository.docker_images.name
    }

    environment_variable {
      name  = "SOLUTION_DIR"
      value = "build_image"
    }

    environment_variable {
      name  = "IMAGE_TAG"
      value = "latest"
    }

    environment_variable {
      name  = "DOCKERFILE_DIR"
      value = "docker"
    }
  }

    source {
      type = "CODEPIPELINE"
      # buildspec = file("${path.module}/docker/buildspec.yml")
    }
}
