resource "aws_efs_file_system" "efs" {
  creation_token = "netspi-efs"

  tags = {
    Project = "NetSPI_EFS"
  }
}

resource "aws_efs_mount_target" "mount_target" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.ec2_sg.id]
}
