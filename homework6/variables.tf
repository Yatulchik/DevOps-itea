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
    default = "Homework6-asg"
}

variable "VPCId" {}

variable "subnet_ids" { type = "list" }

variable "instance_role_name" {
    default = "s3-read-only-itea"
}

variable "instance_profile_name" {
    default = "s3-readonly-instance-profile"
}
