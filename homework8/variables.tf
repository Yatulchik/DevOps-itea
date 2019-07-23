variable "ami_id" {}

variable "aws_access_key" {
    default = "~/.aws/key"
}

variable "aws_secret_key" {
    default = "~/.aws/secret_key"
}

variable "aws_region" {
    default = "eu-west-1"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "~/.ssh/itea-devops-nemo-key.pub"
}

variable "key_name" {
    default = "itea-devops-nemo-key"
}

variable "instance_name" {
    default = "Homework8-Cluster"
}

variable "VPCId" {}

variable "subnet_ids" { type = "list" }

variable "instance_role_name" {
    default = "ecs-cluster-itea"
}

variable "instance_profile_name" {
    default = "ecs-cluster-instance-profile"
}

variable "ecs_cluster" {
    default = "Itea-DevOps-Cluster"
}
