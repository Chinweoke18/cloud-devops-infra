data "aws_availability_zones" "available" {}

resource "random_id" "suffix" {
  byte_length = 4
  
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                   = var.vpc_name
  cidr                   = var.cidr
  azs                    = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets        = var.private_subnets
  public_subnets         = var.public_subnets
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  enable_dns_hostnames   = var.enable_dns_hostnames
  enable_dns_support     = var.enable_dns_support

}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  vpc_id = module.vpc.vpc_id
  alb_subnets = module.vpc.public_subnets 

  depends_on = [ module.vpc ]

}

module "iam" {
  source = "./modules/iam"
  
  ecs_task_execution_role_name = "cloud-devops-ecs-task-exec-role"
  
}

module "s3_backend" {
  source = "./modules/s3_backend"
  bucket_name = "cloud-pipeline-tf-state-${random_id.suffix.hex}"
  dynamodb_table_name = "cloud-devops-pipeline-lock-table"

}

resource "aws_ecs_cluster" "main" {
    
  name = var.cluster_name
}


