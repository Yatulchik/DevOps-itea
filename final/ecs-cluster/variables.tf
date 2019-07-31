variable "ami_id" {
   default = "ami-0862aabda3fb488b5"
}

variable "VPCId" {
   default = "vpc-bfddded9"
}

variable "aws_region" {
    default = "eu-west-1"
}

variable "aws_access_key" {
    default = "~/.aws/key"
}

variable "aws_secret_key" {
    default = "~/.aws/secret_key"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "~/.ssh/itea-devops-nemo-key.pub"
}

variable "key_name" {
    default = "itea-devops-nemo-key"
}

variable "instance_name" {
    default = "Exam-Work-Cluster"
}

variable "subnet_ids" {
    type = "list"
    default = ["subnet-cf0478a9", "subnet-00d99548"]
}

variable "instance_role_name" {
    default = "ecs-cluster"
}

variable "instance_profile_name" {
    default = "ecs-cluster-profile"
}

variable "ecs_cluster" {
    default = "Exam-Work-Cluster"
}
