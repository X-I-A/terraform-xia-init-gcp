variable "project_id" {
  type = string
}

variable "repository_project" {
  type = string
}

variable "gcs_location" {
  type = string
  default = "EU"
}

variable "firestore_location" {
  type = string
  default = "eur3"
}

variable "terraform_user" {
  type = string
  default = "xia-terraform"
}
