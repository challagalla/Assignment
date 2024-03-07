variable "ami_id" {
  description = "ID of the CentOS AMI"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
}

variable "subnet_id" {
  description = "ID of the subnet"
}

variable "security_group_name" {
  description = "Name of the security group"
}


variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  
}
