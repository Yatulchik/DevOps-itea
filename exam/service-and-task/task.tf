data "aws_ecs_task_definition" "nginx" {
  task_definition = "${aws_ecs_task_definition.nginx.family}"
}

resource "aws_ecs_task_definition" "nginx" {
    family                = "hello_world"
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
    "memory": 500,
    "cpu": 10
  },
  {
    "name": "php-fpm",
    "image": "php-fpm",
    "cpu": 10,
    "memory": 500,
    "essential": true
  }
]
DEFINITION
}