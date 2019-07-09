variable "ami_id" {}

variable "aws_access_key" { }

variable "aws_secret_key" { }

variable "aws_region" {
  default = "eu-west-1"
}

variable "PATH_TO_PRIVATE_KEY" {
default = "~/.ssh/itea-devops-nemo-key.pem"
}

variable "PATH_TO_PUBLIC_KEY" {
default = "~/.ssh/itea-devops-nemo-key.pub"
}

variable "INSTANCE_USERNAME" {
default = "ec2-user"
}

variable "key_name" {
default = "itea-devops-nemo-key"
}

variable "instance_name" {
default = "Homework5-Itea-DevOps"
}