#mettre à jour les deux adresse ip sans health check pour tester notre failover dns
#failover
resource "aws_route53_record" "primary" {
  zone_id = "Z09424501XG1RUAXXMBHB"
  name    = "blog.on-x-cloudhybride.com"
  type    = "A"
  ttl     = "60"
  records = ["35.181.169.8"]

  set_identifier = "primary"
  failover_routing_policy {
    type = "PRIMARY"
  }

  health_check_id = "a017eda8-64e6-4c9c-90f2-8bc5ad9ef99d"
}

resource "aws_route53_record" "secondary" {
  zone_id = "Z09424501XG1RUAXXMBHB"
  name    = "blog.on-x-cloudhybride.com"
  type    = "A"
  ttl     = "60"
  records = ["185.202.52.228"]

  set_identifier = "secondary"
  failover_routing_policy {
    type = "SECONDARY"
  }

  health_check_id = "cab3c006-6a98-4f36-89ad-796de4dfea89"
}

##http://blog1.on-x-cloudhybride.com/
#resource "aws_route53_record" "blog1" {
#  zone_id = "Z09424501XG1RUAXXMBHB"
#  name    = "blog1.on-x-cloudhybride.com"
#  type    = "A"
#  ttl     = 60
#  records = ["35.180.203.157"]
#}
#
##http://blog2.on-x-cloudhybride.com/
#resource "aws_route53_record" "blog2" {
#  zone_id = "Z09424501XG1RUAXXMBHB"
#  name    = "blog2.on-x-cloudhybride.com"
#  type    = "A"
#  ttl     = 60
#  records = ["15.188.74.137"]
#}

