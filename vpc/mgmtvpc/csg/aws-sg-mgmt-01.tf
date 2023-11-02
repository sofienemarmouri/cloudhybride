provider "aws" {
  access_key = "AKIA57K4OIW7NOBQMXXP"
  secret_key = "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"
  region     = "eu-west-3"
}

resource "aws_security_group" "onx-aws-sg-mgmt-20" {
  vpc_id       = "vpc-0317680e9bab9e292"
  name         = "onx-aws-sg-mgmt-01"
  description  = "onx-aws-sg-mgmt-01"

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
   Name = "onx-aws-sg-mgmt-01"
}
}