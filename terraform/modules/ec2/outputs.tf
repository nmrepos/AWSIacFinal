output "instance_ids" {
  description = "IDs of EC2 instances"
  value       = aws_instance.main[*].id
}

output "public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = aws_instance.main[*].public_ip
}

output "private_ips" {
  description = "Private IP addresses of EC2 instances"
  value       = aws_instance.main[*].private_ip
}

output "security_group_id" {
  description = "ID of EC2 security group"
  value       = aws_security_group.ec2.id
}
