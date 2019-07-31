provider "aws" {
  access_key = "${file("${var.aws_access_key}")}"
  secret_key = "${file("${var.aws_secret_key}")}"
  region     = "${var.aws_region}"
}

provider "random" {
}

terraform {
  backend "s3" {
    bucket     = "itea-devops-nemo-exam"
    key        = "ecs-cluster/terraform.tfstate"
    region     = "eu-west-1"
  }
}
