// Provider for users with access and secret keys
provider "aws" {
  access_key = "${file("${var.aws_access_key}")}"
  secret_key = "${file("${var.aws_secret_key}")}"
  region     = "${var.aws_region}"
}

provider "random" {
}

terraform {
  backend "s3" {}
}
