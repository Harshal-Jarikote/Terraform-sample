terraform {
  required_version = ">= 0.11.7"
}

provider "aws" {
  region = "us-east-1"
}

module "dev" {
  source          = "../../modules/"
  env             = "dev"
  region          = "us-east-1"
  cidr            = "172.20.0.0/16"
  private_subnets = "172.20.20.0/24"
  public_subnets  = "172.20.10.0/24"
  key_name        = "dev_key"                             ## Assumes that this key is already present
  instance_type   = "t2.micro"
  user_data       = "${data.template_file.init.rendered}"
}
