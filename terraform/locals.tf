locals {
  name_prefix = "${var.project_name}-${var.environment}"

  labels = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
    route       = "gcp"
  }
}
