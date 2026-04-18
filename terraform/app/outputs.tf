output "app_public_ips" {
  value = module.app_cluster.public_ips
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}