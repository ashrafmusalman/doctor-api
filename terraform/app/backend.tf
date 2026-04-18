terraform {
  backend "s3" {
    bucket         = "ashraf-terraform-state"
    key            = "app/terraform.tfstate"   # 
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}