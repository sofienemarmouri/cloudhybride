provider "aws" {
  access_key = "AKIA57K4OIW7NOBQMXXP"
  secret_key = "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"
  region     = "eu-west-3"
}

resource "aws_instance" "onx-aws-dev-prometheus-mgmt-01" {
  ami = "ami-008bcc0a51a849165"
  availability_zone = "eu-west-3b"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0c5ac6ab8cbe307f3"
  key_name        		 = "onx-aws-key-smarmouri"
  monitoring             = true
  vpc_security_group_ids = [
    "sg-023300e3f405b9229",
  ]
  user_data = file("install_prometheus.sh")
  tags = {
    Name = "onx-aws-dev-prometheus-mgmt-01"
    mounting = "terraform"
    env = "mgmt"
    ami = "ubuntu2004"
    region = "paris"
  }
}

#
#Allow SSH and apache inbound traffic
resource "aws_security_group" "onx-aws-sg-mgmt-02" {
  name        = "onx-aws-sg-mgmt-02"
  description = "Allow All"
  vpc_id      = "vpc-0317680e9bab9e292"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "onx-aws-sg-mgmt-02"
  }
}
