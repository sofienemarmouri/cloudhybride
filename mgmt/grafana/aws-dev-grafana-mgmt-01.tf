provider "aws" {
  access_key = "AKIA57K4OIW7NOBQMXXP"
  secret_key = "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"
  region     = "eu-west-3"
}

resource "aws_instance" "onx-aws-dev-grafana-mgmt-01" {
  ami = "ami-008bcc0a51a849165"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0dfaa6da4fc0f2265"
  key_name        		 = "onx-aws-key-smarmouri"
  monitoring             = true
  vpc_security_group_ids = [
    "sg-0a71265245ca5a316",
  ]
  user_data = file("install_grafana.sh")
  tags = {
    Name = "onx-aws-dev-grafana-mgmt-01"
    mounting = "terraform"
    env = "mgmt"
    ami = "ubuntu2004"
    region = "paris"
  }
}
