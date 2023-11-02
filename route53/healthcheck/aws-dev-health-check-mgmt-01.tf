resource "aws_route53_health_check" "aws-dev-health-check-mgmt-01" {
#  fqdn              = "example.com"  #nom de domaine
  ip_address        = "35.181.169.8"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"

  tags = {
    Name = "aws-dev-health-check-mgmt-01"
  }
}

resource "aws_route53_health_check" "aws-dev-health-check-mgmt-02" {
#  fqdn              = "example.com"  #nom de domaine
  ip_address        = "15.237.194.184"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"

  tags = {
    Name = "aws-dev-health-check-mgmt-02"
  }
}

resource "aws_route53_health_check" "aws-dev-health-check-mgmt-03" {
#  fqdn              = "example.com"  #nom de domaine
  ip_address        = "185.202.52.228"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"

  tags = {
    Name = "aws-dev-health-check-mgmt-03"
  }
}
