terraform {
  backend "s3" {
    bucket	= "itea-devops-nemo-exam"
    key		= "ecs-service/terraform.tfstate"
    region	= "eu-west-1"
  }
}

data "terraform_remote_state" "ecs" {
  backend	= "s3"
  config	= {
    bucket	= "itea-devops-nemo-exam"
    key		= "ecs-cluster/terraform.tfstate"
    region	= "eu-west-1"
  }
}
