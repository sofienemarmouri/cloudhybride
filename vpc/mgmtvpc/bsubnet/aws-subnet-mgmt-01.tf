provider "aws" {
  access_key = "AKIA57K4OIW7NOBQMXXP"
  secret_key = "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"
  region     = "eu-west-3"
}

resource "aws_subnet" "onx-aws-subnet-mgmt-01" {
  vpc_id                  = "vpc-0317680e9bab9e292"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-3a"
tags = {
   Name = "onx-aws-subnet-mgmt-01"
}
}

resource "aws_subnet" "onx-aws-subnet-mgmt-02" {
  vpc_id                  = "vpc-0317680e9bab9e292"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-3a"
tags = {
   Name = "onx-aws-subnet-mgmt-02"
}
}

resource "aws_subnet" "onx-aws-subnet-mgmt-03" {
  vpc_id                  = "vpc-0317680e9bab9e292"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-3a"
tags = {
   Name = "onx-aws-subnet-mgmt-03"
}
}