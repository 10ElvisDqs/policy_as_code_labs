terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

#resource "aws_s3_bucket" "insecure_bucket" {
# bucket = "lab-insecure-bucket-${random_id.bucket_id.hex}"
# acl    = "private"
# # Intentionally missing server_side_encryption_configuration
#}

# Secure example (commented) - enable server-side encryption
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "lab-secure-bucket-${random_id.bucket_id.hex}"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_versioning" "secure_bucket_versioning" {
  bucket = aws_s3_bucket.secure_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}