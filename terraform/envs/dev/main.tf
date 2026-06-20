module "platform" {
  source = "../../"

  environment  = "dev"
  project_name = var.project_name
  project_id   = var.project_id
  region       = var.region
}

variable "project_name" {
  type    = string
  default = "logistics-medallion"
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}
