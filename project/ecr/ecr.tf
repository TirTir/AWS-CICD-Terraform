####################################
#   Elastic Container Registry
####################################
resource "aws_ecr_repository" "test_ecr" {
  name = "test_ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}