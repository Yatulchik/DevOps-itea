provider "aws" {
  region     = "eu-west-1"
}

provider "aws" {
  alias = "east"
  region     = "us-east-1"
}

provider "random" {
}

terraform {
  backend "s3" { }
}
