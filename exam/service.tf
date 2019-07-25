resource "aws_ecs_service" "ecs-cluster-service" {
	name            = "ecs-cluster-service"
	iam_role        = "${aws_iam_role.ecs-service-role.name}"
	cluster         = "${aws_ecs_cluster.ecs-cluster.id}"
	task_definition = "${aws_ecs_task_definition.nginx.arn}"
	desired_count   = 2

	load_balancer	= {
	    target_group_arn = "${aws_lb_target_group.ecs-target-group.arn}"
	    container_port   = "80"
	    container_name   = "nginx"
	}

	launch_type	= "EC2"

	depends_on	 = ["aws_lb_listener.ecs-lb-listener"]
}