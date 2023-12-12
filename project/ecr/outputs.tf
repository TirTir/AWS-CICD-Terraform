output "test_ecr_url" {
  description = "Test ECR Url"
  value = aws_ecr_repository.test_ecr.repository_url
}