resource "aws_network_acl" "aws-nacl-mgmt-01" {
  vpc_id = "vpc-0317680e9bab9e292"

# allow ingress all
  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  # allow egress all
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

tags = {
    Name = "aws-nacl-mgmt-01"
}
}
#subnets attachement

#la mettre par défaut !!!
