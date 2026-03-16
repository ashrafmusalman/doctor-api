module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr

  public_subnet_az     = var.public_subnet_az
  private_subnet_az    = var.private_subnet_az
  private_subnet_2_az  = var.private_subnet_2_az
}

module "security_groups" {
  source = "./modules/security-groups"

  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type

  public_subnet_id = module.vpc.public_subnet_id

  ec2_security_group_id = module.security_groups.ec2_security_group_id
}

module "postgress_db" {
  source = "./modules/rds"

  private_subnet_id  = module.vpc.private_subnet_id
  private_subnet_2_id = module.vpc.private_subnet_2_id

  rds_security_group_id = module.security_groups.rds_security_group_id

  db_name     = var.db_name
  db_user     = var.db_username
  db_password = var.db_password
}