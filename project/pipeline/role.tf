####################################
#   IAM Role
####################################
resource "aws_iam_role" "codebuild_role" {
  name = "jin_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = [ "codebuild.amazonaws.com" ]
        }
      },
    ]
  })
}

resource "aws_iam_role" "pipeline_role" {
  name = "jin_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = [ "codepipeline.amazonaws.com" ]
        }
      },
    ]
  })
}

resource "aws_iam_role" "trigger_role" {
  name = "jin_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = ["events.amazonaws.com"]
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codebuild-attach" {
    role       = aws_iam_role.codebuild_role.name
    policy_arn = var.codebuild-role-arn
}
resource "aws_iam_role_policy_attachment" "pipeline-attach" {
    role       = aws_iam_role.pipeline_role.name
    policy_arn = var.pipeline-role-arn
}
resource "aws_iam_role_policy_attachment" "trigger-attach" {
    role       = aws_iam_role.trigger_role.name
    policy_arn = var.pipeline-role-arn
}