resource "aws_s3_bucket" "remote_s3" {
  bucket = "remote-ritesh-state-bucket"

  tags = {
    Name        = "remote_ritesh_bucket_01"
    Environment = "Dev"
  }
}