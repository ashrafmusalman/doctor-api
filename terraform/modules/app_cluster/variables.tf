variable "ami_id" {
    description = "Ami id for the ec2 instance"
    type = string

}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}


variable "instances" {
  description = "Map of instances (master, worker, etc.)"


  type = map(object({
    instance_type = string
    volume        = number
    name          = string
    sg            = string
    volume_type    = string
  }))
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
  }

  
}