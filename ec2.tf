resource "aws_instance" "web" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  key_name               = "test.pem"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id              = aws_subnet.public.id

  root_block_device {
    delete_on_termination = true
  }

  tags = {
    Project = "NetSPI_EC2"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/your_private_key")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nfs-utils",
      "sudo mount -t nfs4 ${aws_efs_mount_target.mount_target.dns_name}:/ ${var.data_dir}",
      "sudo mkdir -p ${var.data_dir}",
      "sudo chown ubuntu:ubuntu ${var.data_dir}",
      "echo '${aws_efs_file_system.efs.id}' > /etc/mounts/efs-id.txt",
      "chmod 600 /etc/mounts/efs-id.txt",
      "echo '${aws_s3_bucket.private_bucket.id}' > /etc/mounts/s3-bucket-id.txt",
      "chmod 600 /etc/mounts/s3-bucket-id.txt",
    ]
  }
}
