resource "aws_alb" "metabase" {
  name         = "metabase"
  internal     = false
  idle_timeout = 3000
  subnets = [
    aws_subnet.current-1a.id,
    aws_subnet.current-1c.id,
    aws_subnet.current-1d.id,
  ]
  security_groups = [aws_security_group.alb-metabase.id]
}

resource "aws_alb_target_group" "ecs-metabase-service" {
  name        = "ecs-metabase-service"
  vpc_id      = aws_vpc.current.id
  port        = 80
  target_type = "ip"
  protocol    = "HTTP"
}

resource "aws_alb_listener" "metabase-https-listener" {
  load_balancer_arn = aws_alb.metabase.arn
  port              = 443
  certificate_arn   = var.cert_arn
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  default_action {
    order            = 1
    target_group_arn = aws_alb_target_group.ecs-metabase-service.arn
    type             = "forward"
  }
}
