data "google_project" "project" {
}

resource "google_project_service" "cloudrun_api" {
  project = var.project_id
  service = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_iam_member" "repository_binding" {
  project = var.repository_project
  role    = "roles/storage.objectAdmin"
  member = "serviceAccount:service-${data.google_project.project.number}@serverless-robot-prod.iam.gserviceaccount.com"
  depends_on = [google_project_service.cloudrun_api]
}
