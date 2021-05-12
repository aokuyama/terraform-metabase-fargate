resource "aws_ecs_cluster" "tools" {
  name = "tools"
  setting {
    name  = "containerInsights"
    value = "disabled"
  }
  capacity_providers = [
    "FARGATE",
    "FARGATE_SPOT"
  ]
}
