resource "google_project_service" "iam_api" {
  project = var.project_id
  service = "iam.googleapis.com"
  disable_on_destroy = false
}

resource "google_service_account" "terraform_user" {
  account_id = var.terraform_user
  project = var.project_id

  depends_on = [google_project_service.iam_api]
}

resource "google_project_iam_member" "security_admin_binding" {
  project = var.project_id
  role    = "roles/iam.securityAdmin"
  member = "serviceAccount:${google_service_account.terraform_user.email}"

  depends_on = [google_service_account.terraform_user]
}

resource "google_project_iam_member" "pubsub_admin_binding" {
  project = var.project_id
  role    = "roles/pubsub.admin"
  member = "serviceAccount:${google_service_account.terraform_user.email}"

  depends_on = [google_service_account.terraform_user]
}

resource "google_project_iam_member" "cloud_run_admin_binding" {
  project = var.project_id
  role    = "roles/run.admin"
  member = "serviceAccount:${google_service_account.terraform_user.email}"

  depends_on = [google_service_account.terraform_user]
}

resource "google_project_iam_member" "service_usage_admin_binding" {
  project = var.project_id
  role    = "roles/serviceusage.serviceUsageAdmin"
  member = "serviceAccount:${google_service_account.terraform_user.email}"

  depends_on = [google_service_account.terraform_user]
}

resource "google_project_iam_member" "storage_object_admin_binding" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.terraform_user.email}"

  depends_on = [google_service_account.terraform_user]
}

resource "google_project_iam_member" "service_account_admin_binding" {
  project = var.project_id
  role    = "roles/iam.serviceAccountAdmin"
  member = "serviceAccount:${google_service_account.terraform_user.email}"

  depends_on = [google_service_account.terraform_user]
}

resource "google_project_iam_member" "service_account_user_binding" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member = "serviceAccount:${google_service_account.terraform_user.email}"

  depends_on = [google_service_account.terraform_user]
}

resource "google_service_account_key" "terraform_user_key" {
  service_account_id = google_service_account.terraform_user.email
}

resource "local_file" "service_account_key" {
  content  = base64decode(google_service_account_key.terraform_user_key.private_key)
  filename = "./service-account.json"
}
