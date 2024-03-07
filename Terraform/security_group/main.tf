# Create Security Group allowing HTTP outgoing traffic
resource "aws_security_group" "allow_http" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create Security Group Rule allowing HTTP outgoing traffic
#resource "aws_security_group_rule" "http_egress" {
 # type              = "egress"
 # from_port         = 0
 # to_port           = 0
  #protocol          = "-1"
  #cidr_blocks       = ["0.0.0.0/0"]
  #security_group_id = aws_security_group.allow_http.id
#}


