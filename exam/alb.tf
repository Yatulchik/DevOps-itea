resource "aws_alb" "ecs-load-balancer" {
    name                = "ecs-load-balancer"
    security_groups     = ["${aws_security_group.ecs-cluster-sg.id}"]
    subnets             = ["${var.subnet_ids}"]

    tags {
      Name = "ecs-load-balancer"
    }
}

resource "aws_alb_target_group" "ecs-target-group" {
    name                = "ecs-target-group"
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = "${var.VPCId}"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }

    tags {
      Name = "ecs-target-group"
    }
}

resource "aws_alb_listener" "alb-listener" {
    load_balancer_arn = "${aws_alb.ecs-load-balancer.arn}"
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.ecs-target-group.arn}"
        type             = "forward"
    }
}
resource "aws_alb_listener_rule" "HTTPListener" {
    listener_arn = "${aws_alb_listener.alb-listener.arn}"
    priority     = "25587"

    action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.ecs-target-group.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/nginx/*"]
  }
}
