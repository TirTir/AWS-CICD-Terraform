output "codebuild_role_id" {
  value = aws_iam_role.codebuild_role.id
  description = "The ID of the role associated with the codebuild"
}
output "pipeline_role_id" {
  value = aws_iam_role.pipeline_role.id
  description = "The ID of the role associated with the pipeline"
}
output "trigger_role_id" {
  value = aws_iam_role.trigger_role.id
  description = "The ID of the role associated with the trigger"
}

output "codebuild_role_arn" {
  value = aws_iam_role.codebuild_role.arn
  description = "The ARN of the role associated with the codebuild"
}
output "pipeline_role_arn" {
  value = aws_iam_role.pipeline_role.arn
  description = "The ARN of the role associated with the pipeline"
}
output "trigger_role_arn" {
  value = aws_iam_role.trigger_role.arn
  description = "The ARN of the role associated with the trigger"
}