output "ec2_public_ip" {
    value = module.ec2.public_ip
  
}

output "db_url" {
    value = module.postgress_db.db_endpoint
  
}