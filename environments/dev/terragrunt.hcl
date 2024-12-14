include {
  path = find_in_parent_folders()
}

inputs = {
  region = "us-east-1"
  environment = "dev"

  cidr            = "10.10.0.0/16"
  public_subnets  = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  private_subnets = ["10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway   = true
  single_nat_gateway   = true
}