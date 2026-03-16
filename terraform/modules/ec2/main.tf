resource "aws_instance" "hospital_server" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.public_subnet_id

  vpc_security_group_ids = [var.ec2_security_group_id]

  associate_public_ip_address = true
  key_name = "ashraf"

  tags = {
    Name = "hospital-k3s-server"
  }
}