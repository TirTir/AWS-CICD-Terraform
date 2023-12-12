output "bastion_instance_id" {
  description = "Bastion Instance ID"
  value = aws_instance.bastion_instance.id
}