resource "aws_vpc" "aws-vpc-mgmt-10" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
tags = {
    Name = "aws-vpc-mgmt-10"
    mounting = "terraform"
    env = "mgmt"
    region = "paris"
}
}
