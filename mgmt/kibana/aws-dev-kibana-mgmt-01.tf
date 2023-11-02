#provider "aws" {
#  profile = "default"
#  region  = "eu-west-1"
#}
#
#resource "aws_instance" "aws-dev-kibana-test-01" {
#  availability_zone      = "eu-west-1c"
#  ami                    = "ami-08a3bf0ca5cb00159"
#  instance_type          = "t3.small"
#  key_name        		 = "key-test"
#  monitoring             = true
#  vpc_security_group_ids = [
#    "sg-05d1a251614fa89b7",
#  ]
#  user_data = file("install_kibana.sh")
#  tags          = {
#    Name              = "aws-dev-kibana-test-01"
#    environment       = "production"
#    shutdown_nightly  = "false"
#    startup_daily     = "true"
#  }
#   root_block_device {
#    delete_on_termination = false
#  }
#}
