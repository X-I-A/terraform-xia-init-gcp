resource "google_project_service" "pubsub_api" {
  project = var.project_id
  service = "pubsub.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service_identity" "pubsub_agent" {
  provider = google-beta
  project  = var.project_id
  service  = "pubsub.googleapis.com"
}

resource "google_project_iam_member" "project_token_creator" {
  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${google_project_service_identity.pubsub_agent.email}"
}

resource "google_project_iam_member" "project_pubsub_admin" {
  project = var.project_id
  role    = "roles/pubsub.admin"
  member  = "serviceAccount:${google_project_service_identity.pubsub_agent.email}"
}
