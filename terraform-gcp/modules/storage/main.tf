resource "random_id" "name_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "this" {
  name     = format("%s-%s", random_id.name_prefix.hex, var.name)
  location = var.location
}

resource "google_storage_bucket_iam_member" "members" {
  for_each = {
    for m in var.iam_members : "${m.role} ${m.member}" => m
  }

  bucket = google_storage_bucket.this.name
  role   = each.value.role
  member = each.value.member
}
