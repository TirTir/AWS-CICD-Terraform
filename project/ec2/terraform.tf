# data "terraform_remote_state" "vpc" {
#   backend = "s3"
#   config {
#     bucket = "jin-bucket"
#     key = "vpc/terraform.tfstate"
#     region = "us-east-2"
#     encrypt = true
#     lock_table = "TerraformLock"
#   }
# }