resource "aws_instance" "hospital_server" {

  ami           = var.ami_id                # Ubuntu AMI
  instance_type = var.instance_type        # Keep same instance type

  subnet_id = var.public_subnet_id         # Public subnet for internet access

  vpc_security_group_ids = [var.ec2_security_group_id]  # Attach security group

  associate_public_ip_address = true       # Assign public IP

  key_name = "ashraf"                      # SSH key pair

  # Root EBS volume configuration
  root_block_device {
    volume_size = 30        # ✅ Increase storage to 30GB (Free Tier limit)
    volume_type = "gp3"     # General purpose SSD (recommended)
  }

  tags = {
    Name = "hospital-k3s-server"
  }
}