resource "aws_lb" "ecs-load-balancer" {
    name                = "ecs-load-balancer"
    internal		= true
    load_balancer_type	= "application"
    security_groups     = ["${aws_security_group.ecs-cluster-sg.id}"]
    subnets             = ["${var.subnet_ids}"]

    enable_deletion_protection = false

    tags {
      Name = "ecs-load-balancer"
    }
}

resource "aws_lb_target_group" "ecs-target-group" {
    name                = "ecs-target-group"
    port                = "3000"
    protocol            = "HTTP"
    vpc_id              = "${var.VPCId}"

    target_type		= "instance"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "7"
        matcher             = "200,201"
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
    port              = 3000
    protocol          = "HTTP"

    default_action {
    target_group_arn = "${aws_lb_target_group.ecs-target-group.arn}"
    type = "forward"
    }
}
