variable "vpc-id" {
  description = "The ID of the VPC"
  type = string
}
variable "subnet-id" {
  description = "The ID of the Subnet"
  type = string
}

variable "subject" {
  description = "The Subject"
  type = string
}
variable "account_id" {
  description = "The ID of the account"
  type = string
}
variable "region_name" {
  description = "The Name of the region"
  type = string
}
variable "codecommit_repo_name" {
  description = "The Name of the codecommit repo"
  type = string
}
variable "codebuild-role-id" {
  description = "The ID of the role associated with the codebuild"
  type = string
}
variable "pipeline-role-id" {
  description = "The ID of the role associated with the pipeline"
  type = string
}
variable "trigger-role-id" {
  description = "The ID of the role associated with the trigger"
  type = string
}

variable "codebuild-role-arn" {
  description = "The ARN of the role associated with the codebuild"
  type = string
}
variable "pipeline-role-arn" {
  description = "The ARN of the role associated with the pipeline"
  type = string
}
variable "trigger-role-arn" {
  description = "The ARN of the role associated with the trigger"
  type = string
}