terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source     = "./modules/vpc"
  vpc_cidr   = var.vpc_cidr
  subnet_cidrs = var.subnet_cidrs
}

module "ec2" {
  source          = "./modules/ec2"
  instance_type   = "t2.micro"
  ami_id =  var.ami_id
  subnet_id       = module.vpc.subnet_id
  security_groups = [module.vpc.security_group_id]
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "my-terraform-bucket"
}
