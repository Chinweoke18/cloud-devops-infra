output "load_balancer_arn" {
  value = module.loadbalancer.load_balancer_arn
}

output "lb_security_groups" {
  value = module.loadbalancer.load_balancer_sg
}

output "vpc_id" {
  value = module.vpc.name
}


# output "aws_ecs_cluster" {
#   value = aws_ecs_cluster.main.name
# }

output "subnets" {
  description = "List of private subnets created by the VPC module"
  value       = module.vpc.private_subnets
}

output "execution_role_arn" {
  value = module.iam.execution_role_arn
}

output "pipeline_state_bucket" {
  value = module.s3_backend.s3_state_bucket
}

output "pipeline_dynamodb_table" {
  value = module.s3_backend.dynamodb_table_name
}
