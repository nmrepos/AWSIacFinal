# S3 Module - Creates 4 private S3 buckets with versioning

# Create S3 buckets
resource "aws_s3_bucket" "terraform_buckets" {
  count  = length(var.bucket_names)
  bucket = "${var.bucket_names[count.index]}-nm1811iac"

  tags = {
    Name        = var.bucket_names[count.index]
    Environment = var.environment
    Owner       = var.owner
    Purpose     = "Terraform S3 Bucket ${count.index + 1}"
  }
}

# Block all public access for S3 buckets
resource "aws_s3_bucket_public_access_block" "terraform_buckets_pab" {
  count  = length(aws_s3_bucket.terraform_buckets)
  bucket = aws_s3_bucket.terraform_buckets[count.index].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable versioning on S3 buckets (Bonus Challenge)
resource "aws_s3_bucket_versioning" "terraform_buckets_versioning" {
  count  = var.enable_versioning ? length(aws_s3_bucket.terraform_buckets) : 0
  bucket = aws_s3_bucket.terraform_buckets[count.index].id
  
  versioning_configuration {
    status = "Enabled"
  }
}


