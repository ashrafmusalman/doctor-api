
###  in this the entire app instnace and the datbase is created here 




#########################################
# RDS MODULE  
#########################################

module "rds" {
  source = "../modules/rds"

  private_subnet_id   = data.terraform_remote_state.network.outputs.private_subnet_id
  private_subnet_2_id = data.terraform_remote_state.network.outputs.private_subnet_2_id

  rds_security_group_id = data.terraform_remote_state.network.outputs.rds_security_group_id

  db_name     = "hospital"
  db_user     = "postgres"
  db_password = "postgres123"  # temp (Vault later)
}

#########################################
# APP EC2 CLUSTER
#########################################

module "app_cluster" {
  source = "../modules/app_cluster"

  ami_id   = var.ami_id
  subnet_id = data.terraform_remote_state.network.outputs.public_subnet_id

  key_name = var.key_name

  instances = {
    master = {
      instance_type = "c7i-flex.large"
      volume        = 30
      volume_type   = "gp2"
      name          = "master"
      sg            = data.terraform_remote_state.network.outputs.ec2_security_group_id
    }

    worker = {
      instance_type = "t3.micro"
      volume        = 25
      volume_type   = "gp2"
      name          = "worker"
      sg            = data.terraform_remote_state.network.outputs.ec2_security_group_id
    }
  }

  tags = {
    Environment = "dev"
    Project     = "hospital"
  }
}