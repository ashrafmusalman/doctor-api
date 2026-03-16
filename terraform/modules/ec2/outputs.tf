output "instance_id" {
    value = aws_instance.hospital_server.id


  
}


output "public_ip" {
    value = aws_instance.hospital_server.public_ip
  
}