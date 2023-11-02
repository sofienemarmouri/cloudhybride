provider "aws" {
  access_key = "AKIA57K4OIW7NOBQMXXP"
  secret_key = "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"
  region     = "eu-west-3"
}

#virtual private gateways and attached to vpc
resource "aws_vpn_gateway" "onx-aws-dev-vpgw-mgmt-01" {
  vpc_id            = "vpc-0317680e9bab9e292"
  tags = {
    Name = "onx-aws-dev-vpgw-mgmt-01"
  }
}

#customer gateway
resource "aws_customer_gateway" "onx-aws-dev-cgw-mgmt-01" {
  type        = "ipsec.1"
  bgp_asn     = 65000
  ip_address  = "185.202.52.227" #On Premise public IP.
  tags = {
    Name = "onx-aws-dev-cgw-mgmt-01"
  }
}

#vpn_connection
resource "aws_vpn_connection" "onx-aws-dev-vpn-connection-mgmt-01" {
  customer_gateway_id   = "cgw-03dc9dfed52ec7f6d"
  vpn_gateway_id        = "vgw-0ca76d44f075f8626"
  type              = "ipsec.1"
  static_routes_only = true
  local_ipv4_network_cidr                 = "10.5.51.0/24"
  remote_ipv4_network_cidr                = "10.0.0.0/24"
#  tunnel1_phase1_encryption_algorithms    = "AES256"
#  tunnel2_phase1_encryption_algorithms    = "AES256"
#  tunnel1_phase2_encryption_algorithms    = "AES256"
#  tunnel2_phase2_encryption_algorithms    = "AES256"
#  tunnel1_phase1_integrity_algorithms     = "SHA2-256"
#  tunnel2_phase1_integrity_algorithms     = "SHA2-256"
#  tunnel1_phase2_integrity_algorithms     = "SHA2-256"
#  tunnel2_phase2_integrity_algorithms     = "SHA2-256"
#  tunnel1_phase1_dh_group_numbers         = 14
#  tunnel2_phase1_dh_group_numbers         = 14
#  tunnel1_phase2_dh_group_numbers         = 14
#  tunnel2_phase2_dh_group_numbers         = 14
#  tunnel1_phase1_lifetime_seconds         = "28800"
#  tunnel2_phase1_lifetime_seconds         = "28800"
#  tunnel1_phase2_lifetime_seconds         = "3600"
#  tunnel2_phase2_lifetime_seconds         = "3600"

  tags = {
    Name = "onx-aws-dev-vpn-connection-mgmt-01"
  }
}
#
#####a executer après de créer VPN pour mettre son id
resource "aws_vpn_connection_route" "office" {
  destination_cidr_block = "10.5.51.0/24"
  vpn_connection_id      = "vpn-0a303f590c8494b66"
}

###  blog.XXXX.on-x.cloud