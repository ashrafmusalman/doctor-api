variable "ami_id" {
  description = "AMI for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet where EC2 will be launched"
  type        = string
}

variable "ec2_security_group_id" {
  description = "Security group for EC2"
  type        = string
}