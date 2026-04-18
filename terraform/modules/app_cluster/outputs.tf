output "public_ips" {
  value = {
    for key, value in aws_instance.nodes : key => value.public_ip
  }
}