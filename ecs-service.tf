resource "aws_ecs_service" "metabase" {
  name                              = "metabase"
  cluster                           = aws_ecs_cluster.tools.arn
  task_definition                   = aws_ecs_task_definition.metabase.arn
  desired_count                     = 1
  enable_ecs_managed_tags           = true
  health_check_grace_period_seconds = 0
  launch_type                       = "FARGATE"
  deployment_circuit_breaker {
    enable   = false
    rollback = false
  }
  deployment_controller {
    type = "ECS"
  }
  load_balancer {
    container_name   = var.container-metabase
    container_port   = 3000
    target_group_arn = aws_alb_target_group.ecs-metabase-service.arn
  }
  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.ecs-metabase-service.id
    ]
    subnets = [
      aws_subnet.current-1a.id,
      aws_subnet.current-1c.id,
      aws_subnet.current-1d.id,
    ]
  }
}
