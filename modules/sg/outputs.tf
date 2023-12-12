output "vpc_security_group_id" {
  description = "VPC Security Group ID"
  value = aws_security_group.vpc_security_group.id
}
output "web_security_group_id" {
  description = "WEB Security Group ID"
  value = aws_security_group.web_security_group.id
}
output "was_security_group_id" {
  description = "WAS Security Group ID"
  value = aws_security_group.was_security_group.id
}