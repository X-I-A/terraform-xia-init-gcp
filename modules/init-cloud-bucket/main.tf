resource "google_storage_bucket" "terraform-state-backed" {
  name          = "${var.project_id}-tf-states"
  location      = var.gcs_location
  force_destroy = true

  versioning {
    enabled = true
  }
}
