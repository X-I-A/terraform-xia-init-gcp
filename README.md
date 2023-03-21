# X-I-A Infrastructure initialize GCP Project
Terraform XIA Initialization for Google Cloud Platform Project

## Introduction

Prepare a project for the usage of deploying XIA components

## Quick Start

### Prerequisite
An empty Google Cloud Project

If the project is not empty, you might need to import existed infrastructure to Terraform state. 

### Variables 

* project_id (Mandatory): Project id to initialize
* repository_project (Mandatory): The GCP Project which holds the Docker Registry
* gcs_location (Default="eu"): Cloud Bucket (used to save terraform states) Location.
* firestore_location (Default="eur3"): Firestore database location
* terraform_user (Default="xia-terraform"): The service account user to be used for Terraform tasks

### Let's go !
Open the Google Cloud Shell from Google Cloud Console and launching the following command and it is done
```bash
git clone https://github.com/X-I-A/terraform-xia-init-gcp
cd terraform-xia-init-gcp
terraform -chdir=environments/prod init
terraform -chdir=environments/prod validate
terraform -chdir=environments/prod plan
terraform -chdir=environments/prod apply -var="project_id=<project_id>" -var="repository_project=<repository project name>" -auto-approve
```

### Expected Results
* A service_account.json for the created service account
* The follow resources has been created:
  * Essential service API are activated
  * Cloud bucket: <project_id>-tf-states created
  * Cloud Run Service Activated and could pull image from Repository Project
  * Firestore Database initialized
  * Terraform user created with essential authorization.
