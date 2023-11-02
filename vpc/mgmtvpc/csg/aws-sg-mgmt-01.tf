resource "aws_security_group" "aws-sg-mgmt-20" {
  vpc_id       = "vpc-0317680e9bab9e292"
  name         = "aws-sg-mgmt-01"
  description  = "aws-sg-mgmt-01"

  # allow ingress all
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  # allow egress all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
   Name = "aws-sg-mgmt-01"
}
}
