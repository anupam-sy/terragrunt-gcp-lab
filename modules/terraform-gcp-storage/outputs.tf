output "bucket" {
  description = "The output of the storage bucket resource."
  value       = google_storage_bucket.bucket
}

output "bucket_url" {
  description = "The URL of the created cloud storage bucket."
  value       = google_storage_bucket.bucket.url
}