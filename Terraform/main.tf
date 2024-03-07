provider "aws" {
  region = "aws region"
}

module "vpc_subnet" {
  source             = "./vpc_subnet"
  region             = "your region"
  vpc_cidr_block     = "10.0.0.0/16"
  subnet_cidr_block  = "10.0.1.0/24"
  availability_zone  = "your availability zone "
}

module "security_group" {
  source                      = "./security_group"
  security_group_name         = "allow_http"
  security_group_description  = "Allow HTTP traffic"
  vpc_id                      = module.vpc_subnet.vpc_id
}

module "ec2_instance" {
  source              = "./ec2_instance"
  ami_id              = "ami-xxxxxxxxxxxxx"  # CentOS AMI ID
  instance_type       = "t2.micro" # Change the type based on requirement
  subnet_id           = module.vpc_subnet.subnet_id
  security_group_name = module.security_group.security_group_id
  ssh_public_key_path = " "  # Specify the path to your SSH public key file

}

output "public_ip" {
  value = module.ec2_instance.public_ip
}
