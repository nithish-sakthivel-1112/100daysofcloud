terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "website_name" {
    bucket = var.bucket_name
}

resource "aws_s3_object" "index_html" {
    bucket = aws_s3_bucket.website_name.id
    key = "index.html"
    source = "website/index.html"
    etag = filemd5("website/index.html")
    content_type = "text/html"
}

resource "aws_s3_object" "error_html" {
    bucket = aws_s3_bucket.website_name.id
    key = "error.html"
    source = "website/error.html"
    etag = filemd5("website/error.html")
    content_type = "text/html"
}

