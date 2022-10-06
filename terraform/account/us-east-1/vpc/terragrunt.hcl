include {
  path = find_in_parent_folders("common_terragrunt.hcl")
}


terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=3.5.0"
}

generate "backend" {
  path = "overwrite_backend.tf"
  if_exists = "overwrite"
  contents = <<-EOF
    terraform {
      backend "s3" {}
    }
  EOF
}


# Indicate the input values to use for the variables of the module.
inputs = {
  name = "vpc-do-bucetao"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

