resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "MyS3Bucket"
  }
}
