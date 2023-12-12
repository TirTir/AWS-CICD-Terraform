####################################
#   Backend S3 Bucket
####################################
resource "aws_s3_bucket" "jin_bucket" {
  bucket = "jin-bucket"

  tags = {
    Name = "Backend bucket"
    Environment = "Dev"
  }
}

####################################
#   Configuration
####################################
resource "aws_s3_bucket_versioning" "backend-versioning" {
  bucket = aws_s3_bucket.jin_bucket.id

  # 파일 업데이트 시 새 버전 생성
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend-encryption" {
  bucket = aws_s3_bucket.jin_bucket.id

  # 서버 측 암호화 설정
  rule {
    apply_server_side_encryption_by_default {
    sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "backend-public-access" {
  bucket = aws_s3_bucket.jin_bucket.id

  # S3 버킷 퍼블릭 액세스 차단 구성 관리
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}