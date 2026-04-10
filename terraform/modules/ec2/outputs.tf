output "instance_id" {
    value = aws_instance.hospital_server.id


  
}


output "public_ip" {
    value = aws_instance.hospital_server.public_ip
  
}


output "worker_public_ip" {
  value = aws_instance.k3s_worker.public_ip
}