provider "aws" {
  region = var.region
  access_key = local.aws_access_key
  secret_key = local.aws_secret_key

}
