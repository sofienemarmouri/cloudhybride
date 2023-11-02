resource "aws_instance" "aws-dev-apache-mgmt-01" {
  ami = "ami-008bcc0a51a849165"
  instance_type = "t2.micro"
  subnet_id     = "subnet-04bb61d08ddcbae8b"
  key_name        		 = "aws-key-smarmouri"
  monitoring             = true
  vpc_security_group_ids = [
    "sg-0a71265245ca5a316",
  ]
  user_data = file("install_apache.sh")
  tags = {
    Name = "aws-dev-apache-mgmt-01"
    mounting = "terraform"
    env = "mgmt"
    ami = "ubuntu2004"
    region = "paris"
  }
}



########data apache
###resource "aws_ebs_volume" "aws-dev-apache-test-01" {
###  availability_zone = "eu-west-1a"
###  size              = 50
###  type              = "gp2"
###  tags = {
###    Name              = "aws-dev-apache-test-01"
###    Environment       = "test"
###  }
###}
###
###Allow SSH and apache inbound traffic
##resource "aws_security_group" "test-security-group" {
##  name        = "test-security-group"
##  description = "Allow SSH and Apache inbound traffic"
##  vpc_id      = "vpc-0101e9456a70a9045"
##
##  ingress {
##    from_port   = 22
##    to_port     = 22
##    protocol    = "tcp"
##    cidr_blocks = ["0.0.0.0/0"]
##  }
##
##  ingress {
##    from_port   = 8080
##    to_port     = 8080
##    protocol    = "tcp"
##    cidr_blocks = ["0.0.0.0/0"]
##  }
##
##  ingress {
##    from_port   = 80
##    to_port     = 80
##    protocol    = "tcp"
##    cidr_blocks = ["0.0.0.0/0"]
##  }
##
##  egress {
##    from_port       = 0
##    to_port         = 0
##    protocol        = "-1"
##    cidr_blocks     = ["0.0.0.0/0"]
##  }
##}
