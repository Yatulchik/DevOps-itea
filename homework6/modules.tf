resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.PATH_TO_PUBLIC_KEY)}"
}

data "template_file" "user_data" {
  template = "${file("templates/user_data.sh")}"

  vars {
    package_to_install = "nginx"
  }
}

module "ecs-instances" {
#  source = "../../Dgadavin_repo/devops-course-itea/terraform/asg_module"
  source = "git@github.com:Dgadavin/devops-course-itea.git//terraform/asg_module"
  environment = "dev"
  name = "${var.instance_name}"
  aws_ami = "${var.ami_id}"
  key_name = "${aws_key_pair.auth.key_name}"
  security_groups = ["${aws_security_group.aws-cluster-sg.id}"]
  iam_instance_profile_arn = "${aws_iam_instance_profile.instance_profile.name}"
  subnet_ids = "${var.subnet_ids}"
  lifecycle_hook = 1
  user_data = "${data.template_file.user_data.rendered}"
}
