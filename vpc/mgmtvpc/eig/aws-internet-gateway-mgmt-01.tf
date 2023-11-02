provider "aws" {
  access_key = "AKIA57K4OIW7NOBQMXXP"
  secret_key = "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"
  region     = "eu-west-3"
}

resource "aws_internet_gateway" "onx-aws-internet-gateway-mgmt-01" {
 vpc_id = "vpc-0317680e9bab9e292"
 tags = {
        Name = "onx-aws-internet-gateway-mgmt-01"
}
}

#attachement au VPC 20
resource "aws_vpc" "onx-aws-vpc-mgmt-01" {
  cidr_block = "10.0.0.0/16"
}
