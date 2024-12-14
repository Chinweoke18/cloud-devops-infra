
terraform {
  source = "${get_parent_terragrunt_dir()}/tf"
}

inputs = {
  cluster_name = "cloud-devops-cluster"
  vpc_name = "cloud-devops-vpc"
}