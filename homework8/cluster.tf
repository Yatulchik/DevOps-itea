resource "aws_ecs_cluster" "itea-ecs-cluster" {
    name = "${var.ecs_cluster}"
}

