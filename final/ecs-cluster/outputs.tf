output "region" {
  value = "${var.aws_region}"
}

output "vpc-id" {
  value = "${var.VPCId}"
}

output "ecs-cluster" {
    value = "${var.ecs_cluster}"
}

output "ecs-target-group" {
    value = "${aws_lb_target_group.ecs-target-group.arn}"
}

output "ecs-instance-role-name" {
  value = "${aws_iam_role.instance-role.name}"
}

output "ecs-instance-profile-name" {
  value = "${aws_iam_instance_profile.instance_profile.name}"
}

output "ecs-load-balancer-name" {
    value = "${aws_lb.ecs-load-balancer.name}"

}

output "iam-role-arn" {
  value = "${aws_iam_role.instance-role.arn}"
}

output "iam-role-name" {
  value = "${aws_iam_role.instance-role.name}"

} 
