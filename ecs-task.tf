resource "aws_ecs_task_definition" "metabase" {
  family             = "metabase"
  execution_role_arn = var.task_role_arn
  task_role_arn      = var.task_role_arn
  cpu                = 256
  memory             = 512
  network_mode       = "awsvpc"
  container_definitions = jsonencode(
    [
      {
        cpu         = 0
        environment = []
        essential   = true
        image       = var.image_metabase
        mountPoints = []
        name        = var.container-metabase
        portMappings = [
          {
            containerPort = 3000
            hostPort      = 3000
            protocol      = "tcp"
          },
        ]
        volumesFrom = []
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-group         = aws_cloudwatch_log_group.ecs-metabase-task.name
            awslogs-region        = var.region
            awslogs-stream-prefix = "ecs"
          }
        }
      },
    ]
  )
  requires_compatibilities = [
    "FARGATE"
  ]
}

resource "aws_cloudwatch_log_group" "ecs-metabase-task" {
  name = "/ecs/metabase-task"
}
