resource "aws_instance" "hospital_server" {

  ami           = var.ami_id                # Ubuntu AMI
  instance_type = var.instance_type        # Keep same instance type
  subnet_id = var.public_subnet_id         # Public subnet for internet access
  vpc_security_group_ids = [var.ec2_security_group_id]  # Attach security group
  associate_public_ip_address = true       # Assign public IP
  key_name = "ashraf"                      # SSH ckey pair
  # Root EBS volume configuration
 root_block_device {
    volume_size = 30        
    volume_type = "gp3"     # General purpose SSD (recommended)
  }
  tags = {
    Name = "hospital-k3s-server"
  }
}




resource "aws_instance" "k3s_worker" {

  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [var.ec2_security_group_id]
  associate_public_ip_address = true
  key_name = "ashraf"

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "hospital-k3s-worker"
  }
}