data "aws_ecs_task_definition" "nginx" {
  task_definition = "${aws_ecs_task_definition.nginx.family}"
}

resource "aws_ecs_task_definition" "nginx" {
    family                = "Itea-DevOps"
    container_definitions = <<DEFINITION
[
  {
    "name": "nginx",
    "links": [
      "php-fpm"
    ],
    "image": "nginx",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 128,
    "cpu": 10
  },
  {
    "name": "php-fpm",
    "image": "php-fpm",
    "cpu": 10,
    "memory": 128,
    "essential": true
  }
]
DEFINITION
}