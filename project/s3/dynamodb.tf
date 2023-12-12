####################################
#   DynamoDB
####################################
resource "aws_dynamodb_table" "backend-dynamodb" {
  name           = "backend-dynamodb"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
