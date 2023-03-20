data "google_client_config" "current" {}

variable "project_id" {
  type = string
  default = data.google_client_config.current.project
}

variable "firestore_location" {
  type = string
  default = "eur3"
}

variable "terraform_user" {
  type = string
  default = "xia-terraform"
}
