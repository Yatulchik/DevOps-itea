resource "aws_ecs_task_definition" "nginx" {
    family                = "Itea-DevOps"
    container_definitions = <<DEFINITION
[
  {
    "name": "nginx",
    "image": "nginx:latest",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 128,
    "cpu": 20
  }
]
DEFINITION
}
