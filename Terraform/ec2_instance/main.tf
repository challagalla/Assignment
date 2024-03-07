# Generate SSH key pair
resource "aws_key_pair" "ssh_key_pair" {
  key_name   = "myaws2"  # Change this to your desired key name
  public_key = file(var.ssh_public_key_path)
}

# Launch an EC2 instance with CentOS AMI
resource "aws_instance" "centos_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_name]
  key_name      = aws_key_pair.ssh_key_pair.key_name  # Assign the generated SSH key pair

  tags = {
    Name = "centos-instance"
  }
}


