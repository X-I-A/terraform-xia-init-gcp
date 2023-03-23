module "init_project" {
  source = "../../modules/init-project"
  project_id = var.project_id
}

module "init_cloud_run" {
  source = "../../modules/init-cloud-run"
  project_id = var.project_id
  repository_project = var.repository_project
}

module "init_firestore" {
  source = "../../modules/init-firestore"
  project_id = var.project_id
  location = var.firestore_location
}

module "init_terraform_user" {
  source = "../../modules/init-terraform-user"
  project_id = var.project_id
  terraform_user = var.terraform_user
}

module "init_bigquery" {
  source = "../../modules/init-bigquery"
  project_id = var.project_id
  dataset_id = var.dataset_id
  dataset_location = var.data_location
}

module "init_cloud_storage" {
  source = "../../modules/init-cloud-bucket"
  project_id = var.project_id
  gcs_location = var.data_location
}
