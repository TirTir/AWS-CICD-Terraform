####################################
#   CI 구축
####################################
resource "aws_codebuild_project" "codebuild" {
  name = "codebuild"
  description    = "Build Docker Image"
  build_timeout  = 10

  service_role = aws_iam_role.example.arn

  # codePipeLine을 사용하기에 따로 codeBuild용 아티팩트 버킷을 사용하지않습니다.
  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type  = "S3"
    modes = [aws_s3_bucket.jin_backend]
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
  }

  vpc_config {
    vpc_id = var.vpc-id

    subnets = [
      for k, v in var.subnet-id : data.aws_subnet.this[k].id
    ]

    security_group_ids = [
      data.aws_security_group.was_security_group.id
    ]
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/TirTir/SKUPLATE.git"
    git_clone_depth = 1
  }

  tags = {
    Environment = "Test"
  }
}