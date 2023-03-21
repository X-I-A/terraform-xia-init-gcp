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

resource "google_project_iam_binding" "security_admin_binding" {
  project = var.project_id
  role    = "roles/securitycenter.admin"
  members = ["serviceAccount:${google_service_account.terraform_user.email}"]
  depends_on = [google_service_account.terraform_user]
}

resource "google_project_iam_binding" "service_usage_admin_binding" {
  project = var.project_id
  role    = "roles/serviceusage.serviceUsageAdmin"
  members = ["serviceAccount:${google_service_account.terraform_user.email}"]
  depends_on = [google_service_account.terraform_user]
}

resource "google_project_iam_binding" "storage_object_admin_binding" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  members = ["serviceAccount:${google_service_account.terraform_user.email}"]
  depends_on = [google_service_account.terraform_user]
}

resource "google_project_iam_binding" "service_account_admin_binding" {
  project = var.project_id
  role    = "roles/iam.serviceAccountAdmin"
  members = ["serviceAccount:${google_service_account.terraform_user.email}"]
  depends_on = [google_service_account.terraform_user]
}

resource "google_project_iam_binding" "service_account_user_binding" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  members = ["serviceAccount:${google_service_account.terraform_user.email}"]
  depends_on = [google_service_account.terraform_user]
}

# Step 5: Generate a json key
resource "google_service_account_key" "terraform_user_key" {
  service_account_id = google_service_account.terraform_user.email
}

resource "local_file" "service_account_key" {
  content  = base64decode(google_service_account_key.terraform_user_key.private_key)
  filename = "./service-account.json"
}