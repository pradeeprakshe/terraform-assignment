resource "aws_s3_bucket" "private_bucket" {
  bucket = "netspi-private-bucket-${random_uuid.bucket_suffix.result}"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Project = "NetSPI_S3Bucket"
  }
}
