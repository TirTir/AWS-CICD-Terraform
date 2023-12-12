output "jin_bucket_id" {
  value = aws_s3_bucket.jin_bucket.id
  description = "The ID of the S3 bucket"
}
output "jin_bucket_arn" {
  value = aws_s3_bucket.jin_bucket.arn
  description = "The ARN of the S3 bucket"
}