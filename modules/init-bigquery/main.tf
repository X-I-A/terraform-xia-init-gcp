resource "google_project_service" "bigquery_api" {
  project = var.project_id
  service = "bigquery.googleapis.com"
  disable_on_destroy = false
}

resource "google_bigquery_dataset" "dataset" {
  project = var.project_id
  dataset_id = var.dataset_id
  description = "Default Bigquery Dataset to hold standard app"
  location = var.dataset_location

  depends_on = [google_project_service.bigquery_api]
}