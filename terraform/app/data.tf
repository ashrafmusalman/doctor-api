data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "ashraf-terraform-state"   #
    key    = "network/terraform.tfstate" #  network path
    region = "us-east-1"
  }
}
