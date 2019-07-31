resource "aws_lb" "ecs-load-balancer" {
    name                = "ecs-load-balancer"
    internal		= "false"
    load_balancer_type	= "application"
    security_groups     = ["${aws_security_group.ecs-alb-sg.id}"]
    subnets             = ["${var.subnet_ids}"]

    enable_deletion_protection = false

    tags {
      Name = "ecs-load-balancer"
    }
}

resource "aws_lb_target_group" "ecs-target-group" {
    name                = "ecs-target-group"
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = "${var.VPCId}"

    target_type		= "instance"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "7"
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

resource "aws_lb_listener" "ecs-lb-listener" {
    load_balancer_arn = "${aws_lb.ecs-load-balancer.arn}"
    port              = "80"
    protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "We are closed! Go AWAY! (Fuck off)"
      status_code  = "200"
    }
  }
}

resource "random_integer" "priority" {
  min     = 1
  max     = 500
}

resource "aws_lb_listener_rule" "HTTPListener" {
  depends_on = ["aws_lb_target_group.ecs-target-group"]
  listener_arn = "${aws_lb_listener.ecs-lb-listener.arn}"
  priority     = "${random_integer.priority.result}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.ecs-target-group.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/"]
  }
}