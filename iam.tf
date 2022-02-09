####### CodePipeline
resource "aws_iam_role_policy" "codepipeline_role_policy" {
  name   = "CodePipelineRolePolicy"
  role   = aws_iam_role.codepipeline_role.id
  policy = file("codepipeline_policy.json")
}

resource "aws_iam_role" "codepipeline_role" {
  name               = "CodePipelineRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


######## CodeBuild

resource "aws_iam_role_policy" "codebuild_role_policy" {
  name   = "CodeBuildRolePolicy"
  role   = aws_iam_role.codebuild_role.id
  policy = file("codebuild_policy.json")
}

resource "aws_iam_role" "codebuild_role" {
  name               = "CodeBuildRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
