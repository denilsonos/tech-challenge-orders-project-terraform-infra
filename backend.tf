terraform {
  backend "s3" {
    bucket  = "terraform-bucket-4soat-s3"
    key     = "terraform/state/terraform.tfstate"
    region  = "us-east -1"
    encrypt = true
  }
}
