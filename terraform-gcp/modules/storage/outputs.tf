output "bucket_url" {
  description = "The base URL of the bucket"
  value       = google_storage_bucket.this.url
}
