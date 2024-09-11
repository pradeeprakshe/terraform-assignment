output "s3_bucket_id" {
  value       = aws_s3_bucket.private_bucket.id
  description = "ID of the S3 bucket"
}

output "efs_volume_id" {
  value       = aws_efs_file_system.efs.id
  description = "ID of the EFS volume"
}

output "ec2_instance_id" {
  value       = aws_instance.web.id
  description = "ID of the EC2 instance"
}

output "security_group_id" {
  value       = aws_security_group.ec2_sg.id
  description = "ID of the Security Group"
}

output "subnet_id" {
  value       = aws_subnet.public.id
  description = "ID of the Subnet"
}
