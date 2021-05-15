resource "aws_route53_zone" "current" {
  name    = var.hostzone_name
  comment = ""
}

resource "aws_route53_record" "metabase" {
  zone_id = aws_route53_zone.current.id
  type    = "A"
  name    = var.host_metabase
  alias {
    name                   = aws_alb.metabase.dns_name
    zone_id                = aws_alb.metabase.zone_id
    evaluate_target_health = true
  }
}
