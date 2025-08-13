output "bucket_names" {
  description = "Names of created S3 buckets"
  value       = aws_s3_bucket.terraform_buckets[*].bucket
}

output "bucket_arns" {
  description = "ARNs of created S3 buckets"
  value       = aws_s3_bucket.terraform_buckets[*].arn
}

output "bucket_ids" {
  description = "IDs of created S3 buckets"
  value       = aws_s3_bucket.terraform_buckets[*].id
}
