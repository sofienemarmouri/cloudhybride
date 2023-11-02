resource "aws_internet_gateway" "aws-internet-gateway-mgmt-01" {
 vpc_id = "vpc-0317680e9bab9e292"
 tags = {
        Name = "aws-internet-gateway-mgmt-01"
}
}

#attachement au VPC 20
resource "aws_vpc" "aws-vpc-mgmt-01" {
  cidr_block = "10.0.0.0/16"
}
