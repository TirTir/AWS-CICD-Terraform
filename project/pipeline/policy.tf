####################################
#   IAM Poicy
####################################
resource "aws_iam_role_policy" "codebuild-policy" {
  name = "codebuild_policy"
  role = var.codebuild-role-id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [ # codebuild
          "codebuild:CreateReportGroup",
          "codebuild:CreateReport",
          "codebuild:UpdateReport",
          "codebuild:BatchPutTestCases",
          "codebuild:BatchPutCodeCoverages",
          "codebuild:BatchGetBuilds",
          "codebuild:StartBuild"
        ]
        Effect   = "Allow"
        Resource = [
          "arn:aws:codebuild:${var.region_name}:${var.account_id}:project/${var.subject}*"
        ]
      },
      {
        Action = [ # ECR Registry
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer",
          "ecr:CompleteLayerUpload",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
        Effect   = "Allow"
        Resource = [
          "${data.aws_ecr_repository.this.arn}"        
        ]
      },
      # {
      #   Action = [ # CloudWatchLogs
      #     "logs:CreateLogGroup",
      #     "logs:CreateLogStream",
      #     "logs:PutLogEvents"
      #   ]
      #   Effect   = "Allow"
      #   Resource = [
      #     "arn:aws:logs:${local.region_name}:${local.account_id}:log-group:${local.name}*:log-stream:${local.name}*/*"
      #   ]
      # }
    ]
  })
}
resource "aws_iam_role_policy" "pipeline_policy" {
  name = "pipeline_policy"
  role = var.pipeline-role-id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [ # S3
          "s3:*"
        ]
        Effect   = "Allow"
        Resource = [
          "${aws_s3_bucket.this.arn}", "${aws_s3_bucket.this.arn}/*"
        ]
      },
      {
        Action = [ # codecommitpull
          "codecommit:GitPull",
          "codecommit:GetBranch",
          "codecommit:GetCommit",
          "codecommit:GetRepository",
          "codecommit:GetUploadArchiveStatus",
          "codecommit:UploadArchive",
          "codecommit:CancelUploadArchive"
        ]
        Effect   = "Allow"
        Resource = [
          "${data.aws_codecommit_repository.this.arn}"
        ]
      }
    ]
  })
}
resource "aws_iam_role_policy" "trigger-policy" {
  name = "jin_policy"
  role = var.trigger-role-id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [ 
          "codepipeline:StartPipelineExecution"
        ]
        Effect   = "Allow"
        Resource = [
          "${data.aws_codecommit_repository.this.arn}"
        ]
      },
    ]
  })
}