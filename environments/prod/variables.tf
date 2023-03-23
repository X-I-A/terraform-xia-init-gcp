variable "project_id" {
  type = string
}

variable "repository_project" {
  type = string
}

variable "data_location" {
  type = string
  default = "EU"
}

variable "firestore_location" {
  type = string
  default = "eur3"
}

variable "dataset_id" {
  type = string
  default = "xia_app_core"
}

variable "terraform_user" {
  type = string
  default = "xia-terraform"
}
