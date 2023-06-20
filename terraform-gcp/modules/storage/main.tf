resource "random_id" "name_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "this" {
  name     = format("%s-%s", random_id.name_prefix.hex, var.name)
  location = var.location
}
