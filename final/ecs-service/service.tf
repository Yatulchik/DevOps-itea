resource "aws_ecs_service" "ecs-cluster-service" {
	name            = "ecs-cluster-service"
	iam_role        = "${aws_iam_role.ecs-service-role.name}"
	cluster         = "${data.terraform_remote_state.ecs.ecs-cluster}"
	task_definition = "${aws_ecs_task_definition.nginx.arn}"
	desired_count   = 2

	load_balancer	= {
	    target_group_arn = "${data.terraform_remote_state.ecs.ecs-target-group}"
	    container_port   = "80"
	    container_name   = "nginx"
	}

	launch_type	= "EC2"
}
