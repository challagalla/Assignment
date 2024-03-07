variable "region" {
  description = "AWS region"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
}

variable "subnet_cidr_block" {
  description = "CIDR block for Subnet"
}

variable "availability_zone" {
  description = "Availability zone for the Subnet"
}
