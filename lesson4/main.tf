terraform {
  backend "s3"{
    bucket = "nargis-tfstate"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "s3" {
  bucket = "nargis-tfstate"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3.id
  versioning_configuration {
    status = "Enabled"
  }
}