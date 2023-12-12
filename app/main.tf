################### Terraform Configuration ###################
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.26.0"
    }
  }

  backend "s3" {
    bucket         = "jin-bucket" # S3 버킷 이름
    key            = "vpc/terraform.tfstate" # tfstate 저장 경로
    region         = "us-east-2"
    dynamodb_table = "backend-dynamodb" 
  }
}
provider "aws" {
  region = "us-east-2"
}

################### Local Configuration ###################
# locals {
#   subject = "jin-pipeline"
#   time_static = formatdate("YYYYMMDDHHmm", time_static.this.rfc3339)
#   name = join("-", [local.subject, local.time_static])

#   region_name = "rs-east-2"
#   account_id  = "035574589515"
#   codecommit_repo_name = "codepipeline-demo"
#   ecr_repo_name        = "jin-pipeline"

#   ci_env_infos = {
#     "env" : {
#       "buildspec_path" : "app/env/buildspec.yml"
#     }
#   }
# }

# data "aws_codecommit_repository" "repo" {
#   # CI/CD에서 사용할 git 저장소
#   repository_name = local.codecommit_repo_name
# }

################### Module VPC ###################
module "vpc" {
  source  = "../modules/vpc"
  vpc-id = module.vpc.vpc_id

  pub-sub1-id = module.vpc.public_subnet1_id
  pub-sub2-id = module.vpc.public_subnet2_id
  pri-sub1-id = module.vpc.private_subnet1_id
  pri-sub2-id = module.vpc.private_subnet2_id

  pub-rt-id = module.vpc.public_route_table_id
  pri-rt-id = module.vpc.private_route_table_id
  igw-id = module.vpc.internet_gateway_id
  ngw-id = module.vpc.nat_gateway_id
  eip-id = module.vpc.elastic_ip_id
}

################### Module Security Group ###################
module "sg" {
  source = "../modules/sg"

  vpc-id = module.vpc.vpc_id
  vpc-sg-id = module.sg.vpc_security_group_id
}

################### Module Bation EC2 ###################
module "ec2_instance" {
  source  = "../project/ec2"
  vpc-id = module.vpc.vpc_id

  vpc-sg-id = module.sg.vpc_security_group_id

  pub-sub1-id = module.vpc.public_subnet1_id
  pub-sub2-id = module.vpc.public_subnet2_id
}
